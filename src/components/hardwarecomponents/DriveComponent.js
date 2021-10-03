import React from "react";

function DriveComponent(props) {
    return props.chosen === false ? (<h1>No component selected</h1>) : (
        <div>
            <h1>Model: {props.component.name}</h1>
            <br/>
            <h1>Length: {props.component.length_in_cm}cm</h1>
            <br/>
            <h1>Width: {props.component.width_in_cm}cm</h1>
            <br/>
            <h1>Height: {props.component.height_in_cm}cm</h1>
            <br/>
            <h1>Price: {props.component.price_in_chf}CHF</h1>
            <br/>
            <h1>Manufacturer: {props.component.m_name}</h1>
            <br/>
            <h1>Storage type: {props.component.dst_name}</h1>
            <br/>
            <h1>Connector: {props.component.c_name}</h1>
            <br/>
            <h1>Form factor: {props.component.dff_name}</h1>
            <br/>
            <h1>Storage size: {props.component.storage_in_gb}GB</h1>
        </div>

    )
}
export default DriveComponent;