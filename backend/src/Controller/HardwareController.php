<?php


namespace App\Controller;


use App\Repository\ComponentRepository;
use App\View\View;

class HardwareController
{
    const ComponentTypes = array(
        "gpu", "cpu", "connector", "ram", "disk", "pcCase", "motherboard", "powerSupply", "cpuCooler"
    );
    public function index()
    {
        $view = new View();
        if (isset($_SESSION['login']) && $_SESSION['login'] == true && isset($_GET) || isset($_GET)) {
            $componentRepository = new ComponentRepository();
            if (in_array($_GET['component'], self::ComponentTypes)) {
                $view->components = $componentRepository->list($_GET['component']);
            }
        }
        $view->display();
    }
}