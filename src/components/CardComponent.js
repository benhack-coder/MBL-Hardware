import React from 'react'
import Typography from '@material-ui/core/Typography';
import CardContent from '@material-ui/core/CardContent';
import './css/Cards.css';
import {makeStyles} from '@material-ui/core';
import CardMedia from '@material-ui/core/CardMedia';
import CardActionArea from '@material-ui/core/CardActionArea';
import './css/FadeIn.css';

const styles = makeStyles(() => ({
    root: {
        width: "5em",
        background: "black",
        borderRadius: 20,
        height: "5em",
        marginTop: "7%"
    },
    text: {
        color: "white",
        fontSize: "40%"
    },
    image: {
        width: 120,
        height: 100,
        display: "block",
        margin: "auto"
    },
    actionArea: {
        "&:hover $focusHighlight": {
            opacity: 0.4,
            color: '#00FF00'
        }
    },
    focusHighlight: {}
}));

function CardComponent(props) {
    const classes = styles();

    const name = props.item.name.replace(/_/g, " ");

    return (
        <div className="fade-in">
            <CardActionArea className={classes.root} onClick={props.changeText}>
                <CardContent>
                    <Typography className={classes.text} id="header" color="textSecondary" gutterBottom>
                        {name}
                    </Typography>
                    <hr id="cardline"/>
                </CardContent>
                <CardMedia height={100} className={classes.image} image={props.item.image}/>
            </CardActionArea>
        </div>
    )
}

export default CardComponent
