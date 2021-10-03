import React from "react";

function RamComponent(props) {
    return props.chosen === false ?
        (<h1>No Component selected</h1>) : (
            <div>
                <h1>Model: {props.component.name}</h1>
                <br/>
                <h1>Manufacturer: {props.component.manufacturer}</h1>
                <br/>
                <h1>DDR: {props.component.ddr_standard}</h1>
                <br/>
                <h1>RAM size: {props.component.storage_in_gb}GB</h1>
                <br/>
                <h1>Length: {props.component.length_in_cm}cm</h1>
                <br/>
                <h1>Width: {props.component.width_in_cm}cm</h1>
                <br/>
                <h1>Height: {props.component.height_in_cm}cm</h1>
                <br/>
                <h1>Price: {props.component.price_in_chf}CHF</h1>
                <br/>
                <h1>Weight: {props.component.weight_in_kg}kg</h1>
            </div>
        )
}

export default RamComponent;