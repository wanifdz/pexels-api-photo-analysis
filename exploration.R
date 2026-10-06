library(tidyverse)
library(httr)
library(magick)

api_key <- "0iO4ROiLVnTBb0rRNEbYXyOgOKCT23blyadOMnDnJLmyfvVUvgcuzaRN"

url <- "https://api.pexels.com/v1/search?query=strawberry+matcha&per_page=80"

response <- httr::GET(url, 
                      add_headers(Authorization = api_key))

data <- httr::content(response, 
                      as = "parsed", 
                      type = "application/json")

photo_data <- tibble(photos = data$photos) %>%
  unnest_wider(photos) %>%
  unnest_wider(src)




selected_photos <- photo_data %>%
  
  
  mutate(
    aspect_ratio = width / height,
    orientation = ifelse(width > height, "landscape",
                         ifelse(width < height, "portrait", "square")),
    photographer_label = paste("Photo by", photographer)
  ) %>%
  filter(orientation == "landscape") %>%
  slice_head(n = 20)
write_csv(selected_photos, "selected_photos.csv")



# Mean width of images
mean_width <- selected_photos$width %>%
  mean(na.rm = TRUE)

# Median height of images
median_height <- selected_photos$height %>%
  median(na.rm = TRUE)

# Mean aspect ratio
mean_aspect_ratio <- selected_photos$aspect_ratio %>%
  mean(na.rm = TRUE)



# Group by orientation and summarise
grouped_photos <- selected_photos %>%
  group_by(orientation) %>%
  summarise(
    mean_width = mean(width, na.rm = TRUE),
    mean_height = mean(height, na.rm = TRUE),
    count = n()
  )

# Extract mean width for landscape photos
mean_width_landscape <- grouped_photos %>%
  filter(orientation == "landscape") %>%
  pull(mean_width)


# Meme 

img <- image_read(selected_photos$large[3]) %>%
  image_resize("600x400")


top_text <- image_blank(width = 600, height = 120, color = "black") %>%
  image_annotate(
    text = "How perfect I wish my life is:",
    size = 28,
    gravity = "center",
    color = "white"
  )


meme <- c(top_text, img) %>%
  image_append(stack = TRUE)

image_write(meme, "creativity.png")