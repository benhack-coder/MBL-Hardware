import React from "react";


function MotherboardComponent(props) {
    return props.chosen === false ? (<h1>No component selected</h1>) : (
        <div>
            <h1>Name: {props.component.name}</h1>
            <br/>
            <h1>Manufacturer: {props.component.m_name}</h1>
            <br/>
            <h1>Price: {props.component.price_in_chf}CHF</h1>
            <br/>
            <h1>Length: {props.component.length_in_cm}cm</h1>
            <br/>
            <h1>Width: {props.component.width_in_cm}cm</h1>
            <br/>
            <h1>Height: {props.component.height_in_cm}cm</h1>
            <br/>
            <h1>Weight: {props.component.weight_in_kg}kg</h1>
            <br/>
            <h1>Socket: {props.component.cs_name}</h1>
            <br/>
            <h1>Form Factor: {props.component.mff_name}</h1>
            <br/>
            <h1>DDR standard: {props.component.ds_name}</h1>
            <br/>
            <h1>PCI Version: {props.component.pv_version}</h1>
            <br/>
            <h1>Chip: {props.component.mc_name}</h1>
            {Object.entries(props.component.c).map(([key,element])=>{<h1>{element.name}</h1>})}
        </div>

    )
}

export default MotherboardComponent;