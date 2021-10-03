import React from 'react'
import Button from '@material-ui/core/Button';

function ComponentButtons(props) {
    return (
        <div>
            <Button mx={2} variant="contained" className={'navButton'}
                onClick={() => props.onClick("cpu")}>Cpus</Button>
            <Button mx={2} variant="contained" className={'navButton'}
                onClick={() => props.onClick("gpu")}>Gpus</Button>
            <Button mx={2} variant="contained" className={'navButton'}
                onClick={() => props.onClick("motherboard")}>Motherboards</Button>
            <Button mx={2} variant="contained" className={'navButton'}
                onClick={() => props.onClick("cpuCoolers")}>Cpu Coolers</Button>
            <Button mx={2} variant="contained" className={'navButton'}
                onClick={() => props.onClick("powerSupply")}>Power Supplies</Button>
            <Button mx={2} variant="contained" className={'navButton'}
                onClick={() => props.onClick("disk")}>Disks</Button>
            <Button mx={2} variant="contained" className={'navButton'}
                onClick={() => props.onClick("memory")}>Memory</Button>
            <Button mx={2} variant="contained" className={'navButton'}
                onClick={() => props.onClick("pcCase")}>Pc Cases</Button>
        </div>
    )
}

export default ComponentButtons
