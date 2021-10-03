import React from 'react'
import CardComponent from './CardComponent';
import { Grid } from "@material-ui/core";

function ComponentList(props) {
    return (
        <div>
            {
                localStorage.getItem("componentList") === null || localStorage.getItem("componentList").length === 0 ? (<h1>No Items Yet</h1>) : (
                    JSON.parse(localStorage.getItem("componentList")).map((item) => (
                        <Grid item>
                            <CardComponent key={item.name} item={item}
                                changeText={() => {props.onClick(item)}} />
                        </Grid>
                    )
                    ))
            }
        </div>
    )
}

export default ComponentList
