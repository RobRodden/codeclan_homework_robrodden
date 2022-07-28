# first thing to do is load in any relevant packages such as tidyverse ----
library(tidyverse)
library(janitor) # loading janitor to allow us to clean names efficiently and effectively
library(assertr) # loading the assertr package to do so assertive program checking

# next is to read the data into R, assign it a vector name and check it's meta data ----

meteorite_landings <- read_csv("data/meteorite_landings.csv") %>% 
glimpse()

# initially I had tried cleaning the data at this point (with Janitor) but this caused some issues later so instead I have just called it for use in a specific instance later

# as a personal preference I also like to view the data early on ----
View(meteorite_landings)

# I also considered changing the names of the variables (eg "mass (g)) at this point to avoid issues but I decided to do it later on, again due to a specific instance.

# meteorite_landings_rename_columns <- rename(meteorite_landings, "GeoLocation" = "geo_location")
# meteorite_landings_rename_columns

# here is where we starg cleaning the data ----
tidy_meteorite_landings_data <- meteorite_landings %>%
  mutate(GeoLocation = str_remove_all(GeoLocation, "[()]")) %>% # here is where the brackets are removed from the GeoLocaton data column
  
  separate(GeoLocation, c("latitude", "longitude"), ", ") %>% # split the column GeoLocation out into latitude and longitude
  
  mutate(latitude = as.numeric(latitude), longitude = as.numeric(longitude), # change the format of latitude and longitude columns from character to numeric
         latitude = coalesce(latitude, 0, na.rm = TRUE), # replacing any missing values in latitude with 0
         longitude = coalesce(longitude, 0, na.rm = TRUE)) %>% # replacing any missing values in longitude with 0
  filter(`mass (g)` >= 1000) %>% # removing any meteorites whose mass "(g)" is less than 1000g
  arrange(year) # arrange the data in ascending order by year of discovery


tidy_meteorite_landings_data # an opportunity to view that we have successfully tidied up the data

# I also like to check how things are preiodically with regards to missing values
tidy_meteorite_landings_data %>% 
  summarise(across(.fns = ~ sum(is.na(.x))))

# lhere is where we use the assertr package to do so assertive program checking

# to check that the column names are the same as we expect
tidy_meteorite_landings_data %>% 
  verify(has_all_names("id", "name", "mass (g)", "fall", "year", "latitude", "longitude"))

# here we create a function to verify that the latitude and longitude data sit within the parameters that we expect
meteorite_landings_assertr_check <- function(meteorite_landings_lat_long_test){
  
  tidy_meteorite_landings_data %>%
    verify(latitude >= -90 & latitude <= 90) %>% 
    verify(longitude >= -180 & longitude <= 180)
}
meteorite_landings_assertr_check(tidy_meteorite_landings_data) # here we load the data into the function

write_csv("")
