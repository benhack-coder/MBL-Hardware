import React from 'react'
import CardComponent from './CardComponent';
import { Grid } from "@material-ui/core";

function RenderComponent(props) {
    return (
        <div>
            <input type="text" className="searchField" name="textcomponent" />
            {props.isLoading ? (
                <h1>Loading...</h1>
            ) : (
                <Grid container spacing={3}>
                    {props.render.length === 0 ? (
                        <h1 id="text">Choose component</h1>
                    ) : (
                        props.render.components.map((item) => (
                            <Grid item>
                                <CardComponent key={item.name} item={item} changeText={() => {props.onClick(item)}} />
                            </Grid>
                        ))
                    )}
                </Grid>
            )}
        </div>
    )
}

export default RenderComponent
