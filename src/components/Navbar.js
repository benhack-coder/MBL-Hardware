import React from 'react'
import logo from '../images/MBL_Logo/logo.png';
import LoggedInButtons from "./LoggedInButtons";
import LoggedOutButtons from "./LoggedOutButtons";
import AppBar from '@material-ui/core/AppBar';
import ToolBar from '@material-ui/core/Toolbar';
import {Grid} from "@material-ui/core";

function Navbar(props) {
    return (
        <div>
            <AppBar position="fixed">
                    <ToolBar className="navBar">
                        <Grid container>
                            <Grid item xs={11}>
                                <Grid container spacing={2}>
                                    <Grid item>
                                        {props.login ? (<LoggedInButtons save = {props.save} />) : (<LoggedOutButtons/>)}
                                    </Grid>
                                </Grid>
                            </Grid>
                        </Grid>
                        <Grid item>
                            <img id="logo" src={logo} alt="MBL Logo"/>
                        </Grid>
                    </ToolBar>
                </AppBar>
        </div>
    )
}

export default Navbar
