import Image from "next/image";
import {Box, Grid, Typography} from "@mui/material";
import useTheme from "next-themes";
import {MoonIcon, SunIcon} from "@heroicons/react/solid";

const iconSize = 64;

export default function OctodexHeader() {

  return (
    <header className="h-15 shadow-sm dark:bg-gray-700 bg-white">"
      <Box className="header">
        <Grid container spacing={2}>
          <Grid item>
            <Image src="/GitHub-Mark-64px.png" width={iconSize} height={iconSize} alt={"GitHub Mark"}/>
          </Grid>
          <Grid item>
            <Typography variant="h2" noWrap>
              GitHub Octodex RSS Feed
            </Typography>
          </Grid>
        </Grid>
      </Box>
    </header>
  )
}