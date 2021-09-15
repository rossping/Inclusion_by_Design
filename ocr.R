library(tesseract)
library(magick)
library(tidyverse)
library(tibble)
library(pdftools)
# Render pdf to png image
img_file <- pdftools::pdf_convert("Report of the E&BC on the Parliamentary Elections 2010 (24th May 2010).pdf", 
                                  format = 'tiff', pages = 12, dpi = 400)

# Extract text from png image
text <- ocr("Report of the E&BC on the Parliamentary Elections 2010 (24th May 2010)_12.tiff")
unlink(img_file)
cat(text)
text

write.table(text,'new_file.txt',sep="\t",row.names=FALSE)

pdf_ocr_data(
  'orig.pdf',
  pages = 1,
  opw = "",
  upw = "",
  language = "eng",
  dpi = 600)-> df

options(tibble.print_max = Inf)
print(df)