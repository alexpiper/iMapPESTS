#Also assign to species rank using exact matching
exact <- assignSpecies(seqtab.final, "reference/rdp_species.fa.gz", allowMultiple = TRUE, tryRC = TRUE, verbose = FALSE)

exact <- exact %>% 
  as.data.frame() %>%
  rownames_to_column("OTU") %>%
  mutate(binomial =  case_when(!is.na(Species) ~  paste0(Genus,"_",Species)))

#merge together - JOIN BY OTU! - left_join?
#For exact where Species is not NA, replace tax$Species where Species contains K__,P__,C__,O__,F__,G__
pattern <- c("K__","P__","C__","O__","F__","G__")

tax <- tax %>%
  as.data.frame() %>%
  rownames_to_column("OTU")

test <- left_join(tax, 
                  exact %>% select(OTU, binomial),
                  by="OTU")

for (row in 1:nrow(tax)){
  if   (str_detect(tax[row,7], paste(pattern, collapse="|")) && !is.na(exact$binomial[row]) == TRUE ) {
    tax[row,7] <- exact$binomial[row]
  }
}

# Write taxonomy table to disk
saveRDS(tax, "output/rds/tax_IdTaxaExact.rds") 