import React from 'react'
import './../css/Details.css';
import './../css/FadeIn.css';

function GpuComponent(props) {
    return props.chosen === false ?
    (<h1>No component selected</h1>) : (
        <div className = "fade-in">
            <h1>Model: {props.component.name.replace(/_/g, " ")}</h1>
            <br></br>
            <h1>Manufacturer: {props.component.manufacturer_name}</h1>
            <br></br>
            <h1>Length cm: {props.component.length_in_cm}</h1>
            <br></br>
            <h1>Height cm: {props.component.height_in_cm}</h1>
            <br></br>
            <h1>Width cm: {props.component.width_in_cm}</h1>
            <br></br>
            <h1>Price CHF: {props.component.price_in_chf}</h1>
            <br></br>
            <h1>Weight kg: {props.component.weight_in_kg}</h1>
            <br></br>
            <h1>VRAM GB: {props.component.vram_in_gb}</h1>
            <br></br>
            <h1>Memory: {props.component.memory_bus}</h1>
            <br></br>
        </div>
    )
}

export default GpuComponent
