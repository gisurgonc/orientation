

library(bib2df)
library(tidyverse)

#url={vb3lk7eb4t.search.serialssolutions.com/?sid=Entrez:PubMed&id=17229956}
path <- system.file("extdata", "zotero.bib", package = "bib2df")

path<-('zotero.bib')
df_raw <- bib2df(path)

df<-df_raw%>%
  mutate(URL = case_when(
    !is.na(PMID) ~ paste0('vb3lk7eb4t.search.serialssolutions.com/?sid=Entrez:PubMed&id=',PMID),
    TRUE ~ ''
  ))

#df$URL<-paste0('vb3lk7eb4t.search.serialssolutions.com/?sid=Entrez:PubMed&id=',df$PMID)

df$URL

colnames(df)

df$BIBTEXKEY


'zotero_url.bib' <- tempfile()
df2bib(df_raw, file = 'zotero_url.bib')
