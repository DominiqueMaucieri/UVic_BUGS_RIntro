#Cleaning up the Living Planet Database data for the tutorial

LPD_raw <- read.csv("~/Desktop/LPD2022_public/LPD2022_public.csv")
year_names <- names(LPD_raw[,c(34:104)])
sharks <- LPD_raw %>%
  filter(Class == "Elasmobranchii") %>%
  pivot_longer(cols = all_of(year_names), names_to = "Year", values_to = "Abundance") %>%
  filter(Units %in% c("Mature sharks per hook", "Catch per unit effort", 
                      "catch per unit effort (CPUE)", "CPUE (captures per hook per hour)",
                      "CPUE (#/hook hr)\n", "CPUE (sharks per km of net)",
                      "CPUE (catch/1000 hooks)", "CPUE")) %>%
  select(ID, Binomial, Class, Order, Family, Genus, Species, Common_name,
         Location, Country, Region, Latitude, Longitude, Year, Abundance) %>%
  filter(Abundance != "NULL") %>%
  mutate(Year = gsub('X','',Year),
         Abundance = as.numeric(Abundance))
hist(sharks$Abundance)

write.csv(sharks, "~/Desktop/LPD_Sharks_CPUE.csv", row.names = FALSE)
