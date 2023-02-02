import Octocat from "./octocat";
import {Grid} from "@mui/material";
import Head from "next/head";
import useDarkMode from "../lib/useDarkMode";

export default function Octocats({octocats}) {

  const [colorTheme, setTheme] = useDarkMode();
  return (
    <Grid
      container
      direction="row"
      spacing={5}
      justifyContent="center"
      alignItems="center">

      {octocats.map((node) => (
        <Octocat
          key={node.name}
          name={node.name}
          image={node.image}
          snippet={node.snippet}
          url={node.url}
          published={node.published}
        />
      ))}
    </Grid>
  )
}