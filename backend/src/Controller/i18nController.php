<?php

namespace App\Controller;

use App\Repository\i18nRepository;
use App\View\View;

class i18nController
{
    public function index()
    {
        $view = new View();

        if (isset($_GET["key"])) {
            $key = $_GET["key"];
            $login = $_GET["login"];
            $username = $_GET['username'];

            if ($login && !empty($username)) {
                $i18nRepository = new i18nRepository();
                $userLanguage = $i18nRepository->translateKey($username);

                $content = file_get_contents(dirname(__DIR__)
                    . "/i18n/" . $userLanguage . ".json");
                $json = json_decode($content);
                $translation = $json->$key;
                $view->translation = $translation;
            } else {
                $content = file_get_contents(dirname(__DIR__) . "/i18n/en-US.json");
                $json = json_decode($content);
                $translation = $json->$key;
                $view->translation = $translation;
            }
        }
        $view->display();
    }

    public function getLanguages()
    {
        $view = new View();
        $i18nRepository = new i18nRepository();
        $view->languages = $i18nRepository->getAvailableLanguages();
        $view->display();
    }

    /** Exit Codes
     *  0 - Ok
     *  1 - Failed to Change Language
     */
    public function changeLanguage()
    {
        $content = file_get_contents("php://input");
        $json = json_decode($content, true);
        
        $username = $json['username'];
        $language = $json['language'];
        
        $view = new View();
        
        $i18nRepository = new i18nRepository();
        
        $view->exitcode = $i18nRepository->changeUserLanguage($username, $language);
        $view->display();
    }

    public function getUserLanguage()
    {
        $content = file_get_contents("php://input");
        $json = json_decode($content, true);

        $username = $json['username'];

        $view = new View();
        $i18nRepository = new i18nRepository();

        $result = $i18nRepository->getUserLanguage($username);

        $view->language = $result['locales_id'];
        $view->display();
    }
}