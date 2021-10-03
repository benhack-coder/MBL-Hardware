import React from "react";

function PcCaseComponent(props) {
    return props.chosen === false ?
        (<h1>No component selected</h1>) : (
            <div>
                <h1>Name: {props.component.name.replace(/_/g, " ")}</h1>
                <br/>
                <h1>Manufacturer: {props.component.m_name}</h1>
                <br/>
                <h1>Price: {props.component.price_in_chf}CHF</h1>
                <br/>
                <h1>Length: {props.component.length_in_cm}cm</h1>
                <br/>
                <h1>Height: {props.component.height_in_cm}cm</h1>
                <br/>
                <h1>Width: {props.component.width_in_cm}cm</h1>
                <br/>
                <h1>Weight: {props.component.weight_in_kg}kg</h1>
            </div>

        )
}

export default PcCaseComponent;