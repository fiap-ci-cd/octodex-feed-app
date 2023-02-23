import {
  Button,
  Card,
  CardActionArea,
  CardActions,
  CardContent,
  CardMedia, Dialog, DialogActions, DialogContent, DialogTitle, Grid, Slide,
  Typography
} from "@mui/material";
import React from'react';
import Image from 'next/image'

const Transition = React.forwardRef(function Transition(props, ref) {
  return <Slide direction="up" ref={ref} {...props} />;
});

export default function Octocat({
  name,
  image,
  url,
  snippet,
  published
}) {
  const cardImageSize = 256;
  const dialogImageSize = 4 * cardImageSize;
  const [open, setOpen] = React.useState(false);

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
  };

  return (
      <Grid item xs={8} md={4}>
        <Card variant="outlined" className="octocat dark:bg-gray-600">
          <CardContent>
            <CardActionArea onClick={handleClickOpen}>
              <CardMedia
                component="img"
                image={image}
                height={cardImageSize}
                width={cardImageSize}
                title={name}/>
            </CardActionArea>
              <CardContent>
                <Typography gutterBottom variant="h5" component="h2" className="dark:text-gray-300">{name}</Typography>

                <Typography variant="body1" color="textSecondary" component="p" className="dark:text-gray-300">
                  {snippet}
                </Typography>

                <Typography variant="body2" color="textSecondary" component="p" className="dark:text-gray-300">
                  {published}
                </Typography>
              </CardContent>

              <CardActions>
                <Button size="small" color="primary" href={url}>
                  View on Octodex...
                </Button>
              </CardActions>
          </CardContent>
        </Card>

        <Dialog
          fullScreen={true}
          open={open}
          onClose={handleClose}
          TransitionComponent={Transition}
        >
          <DialogTitle disableTypography>
            <Typography variant="h2">
              {name}
            </Typography>

          </DialogTitle>

          <DialogContent dividers>
            <Grid container justifyContent={"center"} alignItems={"center"}>
              <Grid item>
                <Image src={image} height={dialogImageSize} width={dialogImageSize} alt={name}/>
              </Grid>
            </Grid>
          </DialogContent>

          <DialogActions>
            <Button autoFocus onClick={handleClose} color="primary">
              Close
            </Button>
          </DialogActions>
        </Dialog>
      </Grid>
  )
}