<?php

namespace App\Controller;

use App\Repository\UserRepository;
use App\View\View;

/**
 * Documentation in DefaultController.
 * @
 */
class UserController
{
    public function index()
    {
        $userRepository = new UserRepository();

        $view = new View();
        $view->users = $userRepository->readAll();
        $view->display();
    }

    /**  JSON Exit Codes:
     *   0 - OK
     *   1 - Post Body Empty or invalid syntax
     *   2 - User already Exists
     */
    public function register()
    {
        $content = file_get_contents("php://input");
        $json = json_decode($content, true);

        $view = new View();

        if (
            isset($json['username']) && isset($json['password'])
            && $json['username'] != ""
            && $json['password'] != "") {
            $userRepository = new UserRepository();
            if ($userRepository->checkIfUserExists($json['username'])) {
                $view->exitcode = 2;
            } else {
                $view->exitcode = $userRepository->create($json['username'], hash("sha512", $json['password']));
            }
        } else {
            $view->exitcode = 1;
        }

        $view->display();
    }

    /** JSON Exit Codes:
     *  0 - OK
     *  1 - Post Body Empty or invalid syntax
     *  2 - Wrong Username/Password
     */

    public function login()
    {
        $content = file_get_contents("php://input");
        $json = json_decode($content, true);
        $view = new View();

        if (
            isset($json['username']) && isset($json['password'])
            && $json['username'] != ""
            && $json['password'] != ""
        ) {
            $userRepository = new UserRepository();
            if ($userRepository->checkCredentials($json['username'], hash("sha512", $json['password'])) == 1) {
                $_SESSION['login'] = true;
                $_SESSION['username'] = $json['username'];

                $view->exitcode = 0;
                $view->session = ['username' => $_SESSION['username'], 'login' => $_SESSION['login']];
            } else {
                $view->exitcode = 2;
            }
        } else {
            $view->exitcode = 1;
        }
        $view->display();
    }

    public function logout()
    {
        session_destroy();
    }

    public function conf()
    {
        $content = file_get_contents("php://input");
        $json = json_decode($content, true);
        $view = new View();
        $view->json = $json;
        $view->display();
    }


    public function delete()
    {
        // TODO Anfrage an die URI /user weiterleiten (HTTP 302)
        header('Location: /user');
    }
}
