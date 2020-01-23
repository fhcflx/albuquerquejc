require(rmarkdown)
render('script/monop.Rmd',output_format='pdf_document',output_dir='doc')
render('script/osdoc.Rmd',output_format='pdf_document',output_dir='doc')
