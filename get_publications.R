library(tidyverse)
library(bib2academic)


# Get bibtex files --------------------------------------------------------

scholar::get_publications("zrxQbOsAAAAJ&hl") %>% 
  distinct(title, .keep_all = TRUE) #%>%
  transmute(bibtype = "Article", author = as.character(author),
            title = as.character(title),
            journaltitle = as.character(journal), year)%>% 
    RefManageR::as.BibEntry() %>% 
    RefManageR::WriteBib("piper.bib")



# Get abstract ------------------------------------------------------------
# Need to add function to fetch abstract as well


# Convert to academic format ----------------------------------------------

bib2acad("piper.bib", copybib = TRUE, abstract = TRUE, overwrite = TRUE)
