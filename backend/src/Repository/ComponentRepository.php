<?php


namespace App\Repository;


use App\Database\ConnectionHandler;

class ComponentRepository
{
    public function list($component, $from = 0, $to = 50)
    {
        $components = array();

        switch ($component) {

            case "gpu":
                $query = $this->listGPU();
                break;
            case "cpu":
                $query = $this->listCPU();
                break;
            case "ram":
                $query = $this->listRam();
                break;
            case "disk":
                $query = $this->listDiskStorage();
                break;
            case "pcCase":
                $pc_case = $this->listPcCase();

                $index = sizeof($components);

                $components[$index] = $pc_case;
                $components[$index]->type = $component;

                return $components;
            case "powerSupply":
                $query = $this->listPowerSupply();
                break;
            case "motherboard":
                $motherboard = $this->listMotherboard();

                $index = sizeof($components);

                $components[$index] = $motherboard;
                $components[$index]->type = $component;

                return $components;
            case "cpuCooler":
                $cpuCooler = $this->listCpuCooler();

                $index = sizeof($components);

                $components[$index] = $cpuCooler;
                $components[$index]->type = $component;

                return $components;
        }

        $result = $this->makeRequest($query);

        if ($result->num_rows != 0) {
            while ($row = $result->fetch_object()) {
                $index = sizeof($components);
                $components[$index] = $row;
                $components[$index]->type = $component;
            }
        }
        return $components;
    }

    private function makeRequest($query)
    {
        $connection = ConnectionHandler::getConnection();
        $statement = $connection->prepare($query);

        if (false == $statement) {
            return 1;
        }

        $statement->execute();

        return $statement->get_result();
    }

    private function listCpuCooler()
    {
        $query = $this->cpuCoolerSpecs();
        $result = $this->makeRequest($query);

        $cpuCooler = new class {
        };

        if ($result) {
            while ($row = $result->fetch_assoc()) {
                if (!property_exists($cpuCooler, "id")) {
                    $cpuCooler->id = $row["cpuCooler_id"];
                    $cpuCooler->name = $row["name"];
                    $cpuCooler->length_in_cm = $row["length_in_cm"];
                    $cpuCooler->width_in_cm = $row["width_in_cm"];
                    $cpuCooler->height_in_cm = $row["height_in_cm"];
                    $cpuCooler->weight_in_kg = $row["weight_in_kg"];
                    $cpuCooler->price_in_chf = $row["price_in_chf"];
                    $cpuCooler->image = $row["image"];
                    $cpuCooler->m_name = $row["m_name"];

                    $cpuCooler->c = array();
                    $cpuCooler->cs = array();
                }

                if ($row['c_id'] && !array_key_exists($row['c_id'], $cpuCooler->c)) {
                    $cpuCooler->c[$row['c_id']] = new class {
                    };
                    $cpuCooler->c[$row['c_id']]->name = $row['c_name'];
                }

                if ($row['cs_id'] && !array_key_exists($row['cs_id'], $cpuCooler->cs)) {
                    $cpuCooler->cs[$row['cs_id']] = new class {
                    };
                    $cpuCooler->cs[$row['cs_id']]->name = $row['cs_name'];
                }
            }
        }
        return $cpuCooler;
    }

    private function listPcCase()
    {
        $query = $this->pcCaseSpecs();
        $result = $this->makeRequest($query);

        $pcCase = new class {
        };

        if ($result) {
            while ($row = $result->fetch_assoc()) {
                if (!property_exists($pcCase, "id")) {
                    $pcCase->id = $row['pc_id'];
                    $pcCase->name = $row['name'];
                    $pcCase->length_in_cm = $row['length_in_cm'];
                    $pcCase->width_in_cm = $row['width_in_cm'];
                    $pcCase->height_in_cm = $row['height_in_cm'];
                    $pcCase->weight_in_kg = $row['weight_in_kg'];
                    $pcCase->price_in_chf = $row['price_in_chf'];
                    $pcCase->m_name = $row['m_name'];
                    $pcCase->image = $row['image'];

                    $pcCase->dffs = array();
                    $pcCase->c = array();
                }

                if ($row['dff_id'] && !array_key_exists($row['dff_id'], $pcCase->dffs)) {
                    $pcCase->dffs[$row['dff_id']] = new class {
                    };
                    $pcCase->dffs[$row['dff_id']]->name = $row['dff_name'];
                    $pcCase->dffs[$row['dff_id']]->count = $row['count'];
                }

                if ($row['c_id'] && !array_key_exists($row['c_id'], $pcCase->c)) {
                    $pcCase->c[$row['c_id']] = new class {
                    };
                    $pcCase->c[$row['c_id']]->name = $row['c_name'];
                    $pcCase->c[$row['c_id']]->count = $row['c_count'];
                }
            }
        }
        return $pcCase;
    }

    private function listMotherboard()
    {
        $query = $this->motherboardSpecs();
        $result = $this->makeRequest($query);

        $motherboard = new class {
        };

        if ($result) {
            while ($row = $result->fetch_assoc()) {
                if (!property_exists($motherboard, "id")) {
                    $motherboard->id = $row['mb_id'];
                    $motherboard->name = $row['name'];
                    $motherboard->length_in_cm = $row['length_in_cm'];
                    $motherboard->width_in_cm = $row['width_in_cm'];
                    $motherboard->height_in_cm = $row['height_in_cm'];
                    $motherboard->weight_in_kg = $row['weight_in_kg'];
                    $motherboard->price_in_chf = $row['price_in_chf'];
                    $motherboard->m_name = $row['m_name'];
                    $motherboard->image = $row['image'];
                    $motherboard->mff_name = $row['mff_name'];
                    $motherboard->ds_name = $row['ds_name'];
                    $motherboard->cs_name = $row['cs_name'];
                    $motherboard->pv_version = $row['pv_version'];
                    $motherboard->mc_name = $row['mc_name'];
                    $motherboard->mmc = $row['mmc'];

                    $motherboard->c = array();
                }

                if ($row['c_id'] && !array_key_exists($row['c_id'], $motherboard->c)) {
                    $motherboard->c[$row['c_id']] = new class {
                    };
                    $motherboard->c[$row['c_id']]->name = $row['c_name'];
                    $motherboard->c[$row['c_id']]->count = $row['c_count'];
                }
            }
        }
        return $motherboard;
    }

    private function listGPU()
    {
        return 'SELECT 
                g.id, 
                m.name AS manufacturer_name,
                a.name, a.length_in_cm, a.height_in_cm, a.width_in_cm, a.price_in_chf, a.weight_in_kg, a.image,
                pv.version AS pv_version,
                g.vram_in_gb, g.memory_bus, g.memory_bandwith_in_gb, g.power_draw, g.frequency 
                FROM attributes AS a
                JOIN gpu g ON a.id = g.attributes_id
                JOIN manufacturer m ON a.manufacturer_id = m.id
                JOIN pcie_version pv ON g.pcie_version_id = pv.id';
    }

    private function listCPU()
    {
        return 'SELECT 
                c.id,
                a.name, a.price_in_chf, a.length_in_cm, a.width_in_cm, a.height_in_cm, a.weight_in_kg, a.image,
                c.frequency_in_ghz, boost_frequency_in_ghz, cores, threads, lithography_in_nm, tdp_in_watt,
                cs.name AS socket_name, 
                m.name AS manufacturer_name, 
                pv.version AS pv_version
                FROM attributes AS a
                JOIN cpu AS c ON a.id = c.attributes_id
                JOIN manufacturer AS m ON a.manufacturer_id = m.id
                JOIN cpu_socket AS cs ON c.cpu_socket_id = cs.id
                JOIN pcie_version AS pv ON c.pcie_version_id = pv.id';
    }

    private function listRam()
    {
        return 'SELECT 
                r.id, r.memory_module_count AS mmc,
                d.name AS ddr_standard, 
                storage_in_gb, a.name, length_in_cm, height_in_cm, width_in_cm, price_in_chf, weight_in_kg, image, 
                m.name AS manufacturer
                FROM attributes AS a
                JOIN ram AS r ON a.id = r.attributes_id
                JOIN ddr_standard AS d ON r.ddr_standard_id = d.id
                JOIN manufacturer AS m ON a.manufacturer_id = m.id';
    }

    private function listDiskStorage()
    {
        return 'SELECT 
                ds.id, ds.storage_in_gb,
                a.name, a.length_in_cm, a.width_in_cm, a.height_in_cm, a.weight_in_kg, a.price_in_chf, a.image,
                m.name AS m_name, 
                dst.name AS dst_name,
                dff.name AS dff_name,
                pv.version AS pv_version,
                c.name AS c_name
                FROM disk_storage AS ds
                JOIN attributes AS a ON ds.attributes_id = a.id
                JOIN manufacturer AS m ON a.manufacturer_id = m.id
                JOIN disk_storage_type AS dst ON ds.disk_storage_type_id = dst.id
                LEFT JOIN connector AS c ON ds.connector_id = c.id
                JOIN disk_form_factor AS dff ON ds.disk_form_factor_id = dff.id
                LEFT JOIN pcie_version AS pv ON ds.pcie_version_id = pv.id
';
    }

    private function listPowerSupply()
    {
        return 'SELECT 
                ps.id,
                a.name, a.length_in_cm, a.height_in_cm, a.width_in_cm, a.weight_in_kg, a.price_in_chf, a.image,
                m.name AS m_name,
                pc.name AS pc_name
                FROM power_supply AS ps
                JOIN attributes AS a ON ps.attributes_id = a.id
                JOIN psu_certificate AS pc ON ps.psu_certificate_id = pc.id
                JOIN manufacturer AS m ON a.manufacturer_id = m.id';
    }

    private function cpuCoolerSpecs()
    {
        return 'SELECT 
                cc.id AS cpuCooler_id, a.name, a.length_in_cm, a.width_in_cm, a.height_in_cm, a.weight_in_kg, a.price_in_chf, a.image,
                m.name AS m_name,
                c.id AS c_id, c.name AS c_name,
                cs.id AS cs_id, cs.name AS cs_name
                FROM cpu_cooler AS cc
                LEFT JOIN attributes AS a ON cc.attributes_id = a.id
                LEFT JOIN manufacturer AS m ON a.manufacturer_id = m.id
                LEFT JOIN cpu_cooler_has_connector AS cchc ON cc.id = cchc.cpu_cooler_id
                LEFT JOIN connector AS c ON cchc.connector_id = c.id
                LEFT JOIN cpu_cooler_has_cpu_socket AS cchcs ON cc.id = cchcs.cpu_cooler_id
                LEFT JOIN cpu_socket AS cs ON cchcs.cpu_socket_id = cs.id';
    }

    private function pcCaseSpecs()
    {
        return 'SELECT
                pc.id AS pc_id,
                a.name, a.length_in_cm, a.width_in_cm, a.height_in_cm, a.weight_in_kg, a.price_in_chf, a.image,
                m.name AS m_name,
                mff.name AS mff_name,
                dff.id AS dff_id, dff.name AS dff_name,
                c.id AS c_id, c.name AS c_name, pchc.quantity AS c_count,
                pchdff.count
                FROM pc_case AS pc
                LEFT JOIN attributes  AS a ON a.id = pc.attributes_id
                LEFT JOIN manufacturer AS m ON a.manufacturer_id = m.id
                LEFT JOIN motherboard_form_factor AS mff ON pc.motherboard_form_factor_id = mff.id
                LEFT JOIN pc_case_has_connector AS pchc on pchc.pc_case_id = pc.id
                LEFT JOIN connector AS c ON pchc.connector_id = c.id
                LEFT JOIN pc_case_has_disk_form_factor AS pchdff ON pchdff.pc_case_id = pc.id
                LEFT JOIN disk_form_factor AS dff ON pchdff.disk_form_factor_id = dff.id';
    }

    private function motherboardSpecs()
    {
        return 'SELECT
                mb.id AS mb_id, mb.memory_module_count AS mmc,
                a.name, a.length_in_cm, a.width_in_cm, a.height_in_cm, a.weight_in_kg, a.price_in_chf, a.image,
                m.name AS m_name,
                mff.name AS mff_name,
                ds.name AS ds_name,
                pv.version AS pv_version,
                cs.name AS cs_name,
                mc.name AS mc_name,
                c.id AS c_id, c.name AS c_name,
                mhc.quantity AS c_count
                FROM motherboard AS mb
                LEFT JOIN attributes AS a ON mb.attributes_id = a.id
                LEFT JOIN cpu_socket AS cs ON mb.cpu_socket_id = cs.id
                LEFT JOIN motherboard_form_factor AS mff ON mb.motherboard_form_factor_id = mff.id
                LEFT JOIN motherboard_chip AS mc ON mb.motherboard_chip_id = mc.id
                LEFT JOIN ddr_standard AS ds ON mb.ddr_standard_id = ds.id
                LEFT JOIN pcie_version AS pv ON mb.pcie_version_id = pv.id
                LEFT JOIN manufacturer AS m ON a.manufacturer_id = m.id
                LEFT JOIN motherboard_has_connector AS mhc ON mb.id = mhc.motherboard_id
                LEFT JOIN connector AS c ON mhc.connector_id = c.id';
    }
}