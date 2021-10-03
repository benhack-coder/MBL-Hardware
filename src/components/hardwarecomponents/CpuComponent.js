import React from 'react'
import '../css/FadeIn.css';

function CpuComponent(props) {
    return props.chosen === false ?
        (<h1>No component selected</h1>) : (
            <div className="fade-in">
                    <h1>Model: {props.component.name.replace(/_/g, " ")}</h1>
                    <br/>
                    <h1>Socket: {props.component.socket_name}</h1>
                    <br/>
                    <h1>Manufacturer: {props.component.manufacturer_name}</h1>
                    <br/>
                    <h1>Price: {props.component.price_in_chf}</h1>
                    <br/>
                    <h1>Cores: {props.component.cores}</h1>
                    <br/>
                    <h1>Threads: {props.component.threads}</h1>
                    <br/>
                    <h1>Length: {props.component.length_in_cm}</h1>
                    <br/>
                    <h1>Width: {props.component.width_in_cm}</h1>
                    <br/>
                    <h1>Height: {props.component.height_in_cm}</h1>
                    <br/>
                    <h1>Weight: {props.component.weight_in_kg}</h1>
                    <br/>
            </div>
        )
}

export default CpuComponent
