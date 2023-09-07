# Cleaning the Audobon Society Field Guide Mushroom data for tutorial

mush_raw <- read.csv("~/Desktop/mushroom/agaricus-lepiota.data", header = FALSE)
# colnames(mush_raw) <- c("class", "cap_shape", "cap_surface", "cap_color", "bruises", "odor",
#                         "gill_attachment", "gill_spacing", "gill_size", "gill_color", 
#                         "stalk_shape", "stalk_root", "stalk_surface_above_ring",
#                         "stalk_surface_below_ring", "stalk_color_above_ring",
#                         "stalk_color_below_ring", "veil_type", "veil_color",
#                         "ring_number", "ring_type", "spore_print_color", "population",
#                         "habitat")
library(quadcleanR)

mush_raw <- categorize(mush_raw, column = "V1", values = c("e", "p"), binary = FALSE, 
                       categories = c("edible", "poisonous"), name = "class", exact = TRUE)

mush_raw <- categorize(mush_raw, column = "V2", values = c("b", "c", "x", "f", "k", "s"), binary = FALSE, 
                       categories = c("bell", "conical", "convex", "flat", "knobbed", "sunken"), 
                       name = "cap_shape", exact = TRUE)

mush_raw <- categorize(mush_raw, column = "V3", values = c("f", "g", "y", "s"), binary = FALSE, 
                       categories = c("fibrous", "grooves", "scaly", "smooth"), 
                       name = "cap_surface", exact = TRUE)

mush_raw <- categorize(mush_raw, column = "V4", values = c("n", "b", "c", "g", "r", "p", "u", "e", "w", "y"), 
                       binary = FALSE, 
                       categories = c("brown", "buff", "cinnamon", "gray", "green", "pink", "purple",
                                      "red", "white", "yellow"), 
                       name = "cap_color", exact = TRUE)

mush_raw <- categorize(mush_raw, column = "V5", values = c("t", "f"), binary = FALSE, 
                       categories = c("bruises", "no"), name = "bruises", exact = TRUE)

mush_raw <- categorize(mush_raw, column = "V6", values = c("a", "l", "c", "y", "f", "m", "n", "p", "s"), 
                       binary = FALSE, 
                       categories = c("almond", "anise", "creosote", "fishy", "foul", "musty", "none", 
                                      "pungent", "spicy"), name = "odor", exact = TRUE)

mush_raw <- categorize(mush_raw, column = "V7", values = c("a", "d", "f", "n"), binary = FALSE, 
                       categories = c("attached", "descending", "free", "notched"), name = "gill_attachment", exact = TRUE)

mush_clean <- mush_raw %>% 
  select(class, cap_shape, cap_surface, cap_color, bruises, odor, gill_attachment, 
         gill_spacing, gill_size, gill_color, stalk_shape, stalk_root, stalk_surface_above_ring,
         stalk_surface_below_ring, stalk_color_above_ring, stalk_color_below_ring, veil_type, 
         veil_color, ring_number, ring_type, spore_print_color, population, habitat)
