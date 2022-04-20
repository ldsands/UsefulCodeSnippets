# Reveal.js Notes and Tips

## Markdown Tips

- To get a markdown section you can head the section with this: `<section data-markdown>` then you can use normal markdown in the slide.

## Video Tips

- To use a video use this format `<iframe width="1600" height="900" src="HTTPS://WWW.YOUTUBE.COM/embed/it0EYBBl5LI" frameborder="0" allowfullscreen></iframe>`
- For video size you can use these which keep the aspect ratio consistent
    - $(1920/2)=960$
    - $(1080/2)=540$
    - $(1920/4)*3=1440$
    - $(1080/4)*3=810$
    - $(1920/5)*4=1536$
    - $(1080/5)*4=864$
    - $(1920/6)*5=1600$
    - $(1080/6)*5=900$
- You can also get a start and stop time for any video using this format: `<iframe width="1400" height="787.5" src="https://www.youtube.com/embed/IS5mwymTIJU?start=1&end=382" title="Bail: Last Week Tonight with John Oliver (HBO)" frameborder="0" allow="clipboard-write; encrypted-media" allowfullscreen></iframe>`
    - Note that the start and stop time have to be in seconds
