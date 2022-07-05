
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rpgmapr

<!-- badges: start -->
<!-- badges: end -->

The goal of `rpgmapr` is to provide a set of functions to create
consistently styles base maps for use in R documents and applications

## Installation

You can install the development version of rpgmapr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("renaissanceplanning/rpgmapr")
```

## Example

A simple basemap can be created in tmap with a general call:

``` r
library(rpgmapr)

base <- create_tmap_base()
```

This base can be passed to create styled maps:

``` r
base + 
  tm_shape(miami) + 
  tm_polygons(col = "estimate",
              palette = "plasma",
              alpha = 0.5,
              n = 10,
              lwd = 0.5)
```

<img src="data-raw/example_1.jpg" title="html screenshot" alt="html screenshot" width="100%" />

A more styled version, keeping labels and lines on top of the data,
requires minimal additional code

``` r
base <- create_tmap_base(
  type = "base_detailed"
)

base + 
  tm_shape(miami) + 
  tm_polygons(col = "estimate",
              palette = "plasma",
              alpha = 0.5,
              n = 10,
              lwd = 0.5)
```

<img src="data-raw/example_2.jpg" title="html screenshot" alt="html screenshot" width="100%" />

The full inventory of mapbox elements is kept in the `basemap_elements`
object which is displayed below and can be used for custom calls.

``` r
basemap_elements
#>   library style       element
#> 1    tmap atlas     base_full
#> 2    tmap atlas base_detailed
#> 3    tmap atlas       details
#> 4    tmap atlas         lines
#> 5    tmap atlas        labels
#> 6    tmap atlas   base_simple
#> 7 mapdeck atlas     full_base
#>                                                                                                                                                                                                  url
#> 1 https://api.mapbox.com/styles/v1/renplan/cl4olqb9v000514ldljtf1omt/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicmVucGxhbiIsImEiOiJjaWgzcHdjOTIweTJvdzdtNWxlYnZ5MXZjIn0.zMsUwMAoEu6DZvd7IYVtjg
#> 2 https://api.mapbox.com/styles/v1/renplan/cl4zupz4n000u14mv38mp0q2l/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicmVucGxhbiIsImEiOiJjaWgzcHdjOTIweTJvdzdtNWxlYnZ5MXZjIn0.zMsUwMAoEu6DZvd7IYVtjg
#> 3 https://api.mapbox.com/styles/v1/renplan/cl4zuotax001o15nyt6lnvssc/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicmVucGxhbiIsImEiOiJjaWgzcHdjOTIweTJvdzdtNWxlYnZ5MXZjIn0.zMsUwMAoEu6DZvd7IYVtjg
#> 4 https://api.mapbox.com/styles/v1/renplan/cl4zu0pxx002015nwqeasn33i/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicmVucGxhbiIsImEiOiJjaWgzcHdjOTIweTJvdzdtNWxlYnZ5MXZjIn0.zMsUwMAoEu6DZvd7IYVtjg
#> 5 https://api.mapbox.com/styles/v1/renplan/cl4ztwaxq000r14mv74t1tktp/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicmVucGxhbiIsImEiOiJjaWgzcHdjOTIweTJvdzdtNWxlYnZ5MXZjIn0.zMsUwMAoEu6DZvd7IYVtjg
#> 6 https://api.mapbox.com/styles/v1/renplan/cl513hqsd000h14la0kzbzbci/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicmVucGxhbiIsImEiOiJjaWgzcHdjOTIweTJvdzdtNWxlYnZ5MXZjIn0.zMsUwMAoEu6DZvd7IYVtjg
#> 7                                                                                                                                                  mapbox://styles/renplan/cl4olqb9v000514ldljtf1omt
```

Further examples can be found the in vignettes.
