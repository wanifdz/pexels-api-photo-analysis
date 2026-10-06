# Pexels API Photo Analysis --- Strawberry Matcha

A data retrieval and image-analysis project using the **Pexels API** and
**R** to explore photographs returned for the search term **"strawberry
matcha."**

## Overview

This project demonstrates how API data can be requested, transformed
into tidy data, filtered, summarised, and used for a small creative
image-processing task.

I retrieved photo metadata from Pexels, created variables describing
image dimensions and orientation, selected landscape photographs, and
analysed characteristics of the resulting dataset.

## Workflow

1.  Request photo data from the Pexels API.
2.  Parse the returned API response.
3.  Convert the photo metadata into a tidy data frame.
4.  Calculate image aspect ratios.
5.  Classify images as landscape, portrait, or square.
6.  Filter the data to landscape images.
7.  Summarise image dimensions and characteristics.
8.  Use one selected image in a creative image-processing task.

## Results

For the final selected photographs:

-   **11 landscape photos** were retained.
-   Average image width: **6,400 px**
-   Median image height: **3,922 px**
-   Average aspect ratio: **1.54**

The photographs commonly featured natural lighting, simple backgrounds,
and strong red/green colour contrast.

## Tools & Skills

-   R
-   tidyverse
-   httr
-   magick
-   REST APIs
-   JSON/API response processing
-   Data wrangling
-   Feature engineering
-   Image processing
-   R Markdown

## Repository Structure

``` text
.
├── README.md
├── project3_report.html
├── selected_photos.csv
└── images/
    ├── top_photos.png
    └── creativity.png
```

## API Key Security

The API key is **not stored in this public repository**. A local
environment variable should be used instead:

``` r
api_key <- Sys.getenv("PEXELS_API_KEY")
```

## About

This project was completed as part of **STATS 220 -- Data Technologies**
at the University of Auckland.

Photo data was obtained from Pexels.
