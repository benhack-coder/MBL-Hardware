<?php

namespace App\Repository;

use App\Database\ConnectionHandler;
use mysqli_result;

class i18nRepository
{
    protected string $userTable = "user";

    public function translateKey($username)
    {
        return $this->getUserLanguage($username)->fetch_assoc()['name'];
    }


    public function getUserLanguage($username)
    {
        $query = 'SELECT u.locales_id
                  FROM ' . $this->userTable . ' AS u
                  WHERE u.username = ?';

        $connection = ConnectionHandler::getConnection();
        $statement = $connection->prepare($query);

        if (false == $statement) {
            return 0;
        }

        $statement->bind_param("s", $username);

        $statement->execute();

        return $statement->get_result()->fetch_assoc();
    }

    public function getAvailableLanguages()
    {
        $query = 'SELECT * FROM mydb.locales';

        $connection = ConnectionHandler::getConnection();
        
        $statement = $connection->prepare($query);
        if (false == $statement) {
            return 0;
        }

        $statement->execute();

        $languages = array();
        $result = $statement->get_result();
        if ($result->num_rows != 0) {
            while ($row = $result->fetch_object()) {
                $languages[] = $row;
            }
        }
        return $languages;
    }


    public function changeUserLanguage($username, $language)
    {
        $query = 'UPDATE ' .
                  $this->userTable . ' AS u
                  JOIN locales AS l ON u.locales_id = l.id
                  SET u.locales_id=?
                  WHERE u.username=?';
        
        $connection = ConnectionHandler::getConnection();
        $statement = $connection->prepare($query);
        
        if ($statement == false) {
            return 0;
        }
        
        $statement->bind_param("is", $language, $username);
        
        $statement->execute();

        return 1;
    }
}