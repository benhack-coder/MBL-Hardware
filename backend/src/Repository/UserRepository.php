<?php


namespace App\Repository;


use App\Database\ConnectionHandler;

class UserRepository extends Repository
{
    protected string $tableName = "user";

    public function create($username, $password): int
    {
        $query = 'INSERT INTO ' . $this->tableName . ' (username, password) VALUES (?, ?)';
        $statement = $this->prepareConnection($query);
        $statement->bind_param('ss', $username, $password);
        $statement->execute();

        $result = $statement->get_result();
        if (!$result) {
            //TODO throw new Exception($statement->error); if debugger is working
            print_r($statement->error);
            return 0;
        }
        return 1;
    }

    public function checkIfUserExists($username): bool
    {
        $query = 'SELECT * FROM ' . $this->tableName . ' WHERE username=?';

        $statement = $this->prepareConnection($query);
        $statement->bind_param('s', $username);
        $statement->execute();

        $result = $statement->get_Result();
        return $result->num_rows != 0;
    }

    public function checkCredentials($username, $password): bool
    {
        $query = 'SELECT * FROM ' . $this->tableName . ' WHERE username=? and password=?';

        $statement = $this->prepareConnection($query);
        $statement->bind_param('ss', $username, $password);
        $statement->execute();

        $result = $statement->get_Result();
        return $result->num_rows != 0;
    }

    private function prepareConnection($query)
    {
        $connection = ConnectionHandler::getConnection();
        $statement = $connection->prepare($query);

        if (false == $statement) {
            //TODO throw new Exception($connection->error);
            print_r($connection->error);
            return 0;
        }
        return $statement;
    }
}