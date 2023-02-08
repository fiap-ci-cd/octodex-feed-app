import Image from "next/image";
import {Box, Grid, Typography} from "@mui/material";
import {useTheme} from "next-themes";
import {useState, useEffect} from "react";
import {MoonIcon, SunIcon} from "@heroicons/react/solid";

const iconSize = 64;

export default function OctodexHeader() {

  const {systemTheme , theme, setTheme} = useTheme();
  const [mounted, setMounted] = useState(false);

  useEffect(() =>{
    setMounted(true);
  },[])

  const renderThemeChanger = () => {

    if(!mounted) return null;

    const currentTheme = theme === "light" ? systemTheme : theme ;

    if(currentTheme ==="dark"){
      return (
        <SunIcon className="w-10 h-10 text-yellow-500 " role="button" onClick={() => setTheme('light')} />
      )
    }

    else {
      return (
        <MoonIcon className="w-10 h-10 text-gray-900 " role="button" onClick={() => setTheme('dark')} />
      )
    }
  };

  return (
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
  )
}
