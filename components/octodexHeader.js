import Image from "next/image";
import {Box, Grid, Typography} from "@mui/material";
import {useTheme} from "next-themes";
import {useState, useEffect} from "react";
import {MoonIcon, SunIcon} from "@heroicons/react/solid";

const iconSize = 64;

export default function OctodexHeader() {

  const { theme, setTheme} = useTheme();
  const [mounted, setMounted] = useState(false);

  useEffect(() =>{
    setMounted(true);
  },[])

  return (
      <Box className="header">
        <Grid container spacing={2}>
          <Grid item>
          { theme === 'light' ? <Image src="/GitHub-Mark-64px.png" width={iconSize} height={iconSize} alt={"GitHub Mark"}/>
              : <Image src="/GitHub-Mark-Light-64px.png" width={iconSize} height={iconSize} alt={"GitHub Mark"}/>}
          </Grid>
          <Grid item>
            <Typography variant="h2" noWrap>
              GitHub Octodex RSS Feed
            </Typography>
          </Grid>
          <Grid spacing={2}>
            { theme === 'light' ? <MoonIcon className="w-10 h-10 text-gray-900 " role="button" onClick={() => setTheme('dark')} />
              : <SunIcon className="w-10 h-10 text-yellow-500 " role="button" onClick={() => setTheme('light')} />}
          </Grid>
        </Grid>
      </Box>
  )
}