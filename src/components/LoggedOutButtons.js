import React from 'react';
import './css/HardwareLayout.css';
import {Grid} from "@material-ui/core";
import Button from "@material-ui/core/Button";
import {Link} from 'react-router-dom';

function LoggedOutButtons() {
    return (
        <Grid container spacing={5}>
            <Grid item>
                <Link to='/login'>
                    <Button variant="contained" className="navButton" mr={2}>
                        Log In
                    </Button>
                </Link>
            </Grid>
            <Grid item>
                <Link to='/register'>

                    <Button variant="contained" className="navButton">
                        Register
                    </Button>
                </Link>
            </Grid>
        </Grid>
    );
}

export default LoggedOutButtons