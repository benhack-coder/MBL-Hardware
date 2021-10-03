import React, { useEffect, useState } from 'react'
import axios from 'axios'
import "../components/css/Cards.css";
import "./../components/HardwareLayoutComponent"
import HardwareLayoutComponent from "../components/HardwareLayoutComponent";

const HardwareConfigurator = (props) => {
    const [gpus, setGpus] = useState({ components: [] });
    const [cpus, setCpus] = useState({ components: [] });
    const [motherboards, setMotherboards] = useState({ components: [] })
    const [cpuCoolers, setCpuCoolers] = useState({ components: [] })
    const [powerSupplies, setPowerSupplies] = useState({ components: [] })
    const [disk, setDisk] = useState({ components: [] })
    const [ram, setRam] = useState({ components: [] })
    const [pcCase, setPcCase] = useState({ components: [] })
    const [isLoading, setIsLoading] = useState(true)


    useEffect(() => {
        const fetchItems = async (component, setComponent) => {
            const result = await axios(`http://backend.local/hardware?component=` + component)
            setComponent(result.data)
        }
        fetchItems("gpu", setGpus)
        fetchItems("cpu", setCpus)
        fetchItems("motherboard", setMotherboards)
        fetchItems("cpuCooler", setCpuCoolers)
        fetchItems("powerSupply", setPowerSupplies)
        fetchItems("disk", setDisk)
        fetchItems("ram", setRam)
        fetchItems("pcCase", setPcCase)
        setIsLoading(false)
    }, [])



    return (
        <div>
            <HardwareLayoutComponent isLoading={isLoading} gpus={gpus} cpus={cpus} motherboards={motherboards}
                cpuCoolers={cpuCoolers} powerSupplies={powerSupplies} disk={disk}
                ram={ram} pcCase={pcCase}
                login={props.location.state.login} />
        </div>
    )
}
export default HardwareConfigurator
