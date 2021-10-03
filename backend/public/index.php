<?php

/*
 * Die index.php Datei ist der Einstiegspunkt des MVC. Hier werden zuerst alle
 * vom Framework benötigten Klassen geladen und danach wird die Anfrage dem
 * Dispatcher weitergegeben.
 *
 * Wie in der .htaccess Datei beschrieben, werden alle Anfragen, welche nicht
 * auf eine bestehende Datei zeigen hierhin umgeleitet.
 */

require_once __DIR__.'/../vendor/autoload.php';
session_start();

use App\Dispatcher\Dispatcher;
use App\Exception\ExceptionListener;

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header('Access-Control-Allow-Credentials: true');
ExceptionListener::register();
Dispatcher::dispatch();
