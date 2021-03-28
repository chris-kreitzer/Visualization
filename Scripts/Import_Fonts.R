## Download, import and properly render NEW FONTS in R plot
## 
## Willing to have fancy (new) fonts in your graphics?
## Moreover, sometimes you come across R packages (e.g. hrbrthemes) with pre-defined font families
## You can't use those properely, as there are several task to fulfill in order to make rendering work.
##
## Start documentation: 03/25/2021:
## christoph.kreitzer93@gmx.at



#' Search your desired font, and look if its freely available for download
#' (e.g. Roboto Condensed)
#' drag and drop your download into the Font Book (mac osx)
#' check if valid; locally (via control)

#' FONTS must be valid .ttf files


suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(grDevices))
library(sysfonts)


#' Import Font to R/RStudio
#' relies on extrafont-package: https://cran.r-project.org/web/packages/extrafont/README.html
if('extrafont' %in% rownames(installed.packages())){
  message('package::extrafont already installed. Ready to use')
  library(extrafont)
  library(extrafontdb)
} else {
  install.packages('extrafont')
  library(extrafontdb)
  library(extrafont)
}


#' Import fonts into the extrafont database
#' Needs only to be done once (e.g. when downloaded a new font)
#' If you install new fonts on your computer, you'll have to run font_import() again.
extrafont::font_import()
fonts_loaded = extrafont::fonttable() # check if your font is lised in table

loadfonts() # needs to be done once

#' restart RStudio 
.rs.restartR()

#' with that, RStudio should be capable of displaying new fonts

#' rendering plot: png or pdf
#' saving plot with ggsave 

#' for PDF use cairo_pdf
ggsave(filename = ..., device = cairo_pdf)

#' for PNG (no support vector graphic) use ''
ggsave(filename = ..., )


#' IMPORT a GoogleFont:
sysfonts::font_add_google(name = 'Lora', family = 'Lora')











