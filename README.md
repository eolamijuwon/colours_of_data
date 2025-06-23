# SGSSS Summer School || Colours of Data: A Beginner’s Approach to Data Visualization in R

In the ever-growing universe of dry academic texts, impressive and efficient graphics are quite rare. Driven by widespread software legacy issues and mostly outdated limitations imposed by traditional scientific publishers, researchers often consider producing high quality graphics as a peripheral optional task – “if time allows” (spoiler: it won’t). Yet, modern tools place data visualization in the focus of research workflows when it comes to conveying the results. Hence, the ability to turn a large dataset into an insightful visualization is an increasingly valuable skill in academia.

This workshop provides an introduction to the fundamental principles and practices of data visualisation using R. The workshop is targeted at beginners and will cover the essential concepts and techniques for transforming raw data into meaningful, visually appealing representations. Participants will learn how to leverage R’s powerful visualisation libraries to create various types of charts, graphs, and plots, enabling them to communicate data-driven insights effectively. By the end of the workshop, students will be able to explain key foundational concepts in human perception of data, describe practical approaches for data visualisation and understand how to create a range of impactful data visualisations in R.


# Prerequisites
- [<a href="https://cloud.r-project.org" target="_blank" rel="noopener noreferrer">R</a>]
- [Rstudio](https://www.rstudio.com/products/rstudio/download/#download)  
- [R {packages}](/01-prerequisites/install-pkg.R)
- [Datasets](/02-data/install-pkg.R)
- Basic familiarity with R, consider [RStudio Primers](https://rstudio.cloud/learn/primers)
- Recommended readings: [Better Data Visualizations: A Guide for Scholars, Researchers, and Wonks](https://doi.org/10.7312/schw19310), [`ggplot2`: Elegant Graphics for Data Analysis](https://link.springer.com/book/10.1007/978-3-319-24277-4), [A Layered Grammar of Graphics](http://doi.org/10.1198/jcgs.2009.07098).



# Outline

### Topic 1: THEORY [10:00-10:45]
- Basic dataviz principles [[slides]()]
- Impressive dataviz showcases
- `tidyverse`: Tidy approach to data

### Topic 2: BASICS [10:45-12:00]
- Basic types of plots [[slides]()]
- `ggplot2` basics
- Arranging and exporting plots
- Practical [exercises](04-practicals/intro_ggplot/intro_ggplot.Rmd)



### Topic 4: TUNE-UP [12:00-13:00]
- Themes in dataviz [[slides]()]
- Colors and fonts
- Annotating
- Practical [exercises](04-practicals/intermediate/intermediate.Rmd)

### Topic 3: TOOLBOX [14:00-14:45]
- Heatmap, dotplot, ggridges, treemap, geofacet [[slides]()]
- Interactivity: `plotly`, `gganimate`

### Topic 5: SHINE [14:45-16:00]
- Dataviz challenge in teams
- Brief presentations by teams and discussion
- Wrap-up


# Useful links (mostly adapted from Ilya Kashnitsky and Tim Riffe's [Dataviz – the Art/Skill Cocktail](https://github.com/jschoeley/idem_viz/tree/master))
- Jonas Schöley's [IDEM 181 course](https://github.com/jschoeley/idem_viz/tree/master)
- Oscar Baruffa's [Big Book of R](https://www.bigbookofr.com)
- Hadley Wickham's [R For Data Science](https://r4ds.had.co.nz)
- Kyle Walker's [dataviz book chapter](https://walker-data.com/census-r/exploring-us-census-data-with-visualization.html)
- Neal Grantham's [TidyTuesday Rocks app](https://nsgrantham.shinyapps.io/tidytuesdayrocks/)
- Andy Kirk's [The little of visualisation design](https://visualisingdata.com/the-little-of-visualisation-design/) 
- Jonas Schoeley's [2017 IDEM dataviz course](https://github.com/jschoeley/idem_viz)
- Garrick Aden-Buie's [Gentle Guide to the Grammar of Graphics](https://pkg.garrickadenbuie.com/gentle-ggplot2)   
- [R Graph Gallery](https://r-graph-gallery.com/)
- Yan Holtz's [tool for selecting color palletes](https://python-graph-gallery.com/color-palette-finder/)
- Hans Rosling: [sample talk](https://youtu.be/BZoKfap4g4w); [Factfulness](https://www.amazon.com/Factfulness-Reasons-World-Things-Better/dp/1250107814); [gapminder.org](https://www.gapminder.org/tools/#$chart-type=bubbles&url=v1)
- Nathaniel Smith's [talk on the principles of viridis palettes](https://youtu.be/xAoljeRJ3lU)
- David Robinson's [RStudio Conference 2019 talk](https://posit.co/resources/videos/the-unreasonable-effectiveness-of-public-work/) on the immense benefits of being open and sharing stuff freely 
- John Burn-Murdoch's [RStudio 2021 talk](https://youtu.be/L5_4kuoiiKU)
- [Thread on excess deaths plots](https://twitter.com/ikashnitsky/status/1409472083965349892) 
- [Thread](https://twitter.com/ikashnitsky/status/1380247006170509312) on log transformation of the ratios
- [Post on efficient RStudio layout](https://ikashnitsky.github.io/2018/perfect-rstudio-layout/)
- [Replication materials](https://github.com/ikashnitsky/sex-gap-e0-pnas) for Zarulli etal 2021 PNAS paper
- Boxplot + jitter example: [tweet](https://twitter.com/ikashnitsky/status/1403645553637011461)  
- Jonas Schoeley's [HMD explorer app](https://jschoeley.shinyapps.io/hmdexp/)
- US names shiny app: [repository](https://github.com/ikashnitsky/us-names-app); [tweet](https://twitter.com/ikashnitsky/status/1203840297911889920); [shiny app](https://ikashnitsky.shinyapps.io/us-names/)  
- Jim Vaupel's [brilliant talk](https://twitter.com/ikashnitsky/status/1512700871968186379) on the unique central positioning of demography in science  
- Years of life stolen by gun shooting in the US -- [dataviz by Periscopic](https://guns.periscopic.com) 
- NYT Giorgia Lupi's [Long COVID data storytelling](https://www.nytimes.com/interactive/2023/12/14/opinion/my-life-with-long-covid.html?unlocked_article_code=1.F00.435C.ojkN6YhWx43Q) 
- NYT (Motoko Rich, Amanda Cox, Matthew Bloch) [US districts school kids performance against parent's wealthiness](https://www.nytimes.com/interactive/2016/04/29/upshot/money-race-and-success-how-your-school-district-compares.html)