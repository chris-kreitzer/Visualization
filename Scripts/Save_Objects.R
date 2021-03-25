## Properly save ggplot objects
##
## Here the golden section is proposed as default output

#' cairo_pdf is used as output device (recommended when using customized fonts)

if('Cairo' %in% rownames(installed.packages())){
  message('Ready to go')
  library(Cairo)
} else {
  message('Cairo will be installed')
  install.packages('Cairo')
  library(Cairo)
}


ggsave_golden = function(filename, plot, ...){
  ggsave(filename = filename, 
         plot = plot, 
         device = cairo_pdf, 
         width = 8, 
         height = 8/1.61803398875)
}

#' example
#' out.plot = ggplot(data, aes(x = V1, y = V2)) + geom_point()
ggsave_golden(filename = 'look.pdf', plot = out.plot)
