#'Create tmap base map object
#'
#'@description
#'Creates a base map tmap object that can be passed to further mapping with
#'the appropriate z index for lines and labels if used.
#'
#'@param style The style of the base map to use must be:
#'  * "atlas (the default): and RPG color base map
#'  * "light": a clean, simple light base map
#'  * "dark": a clean, simple dark base map
#'
#'@param type The type of base map to create must be:
#'  * "base_full" (the default): creates base map to go under all mapping,
#'    includes labels and lines
#'  * "base_detailed": creates a detailed base including land use and land cover
#'  * "base_simple": creates a clean base with hill shade only
#'
#'@param details A Boolean.
#'  * `TRUE` (the default): ensures that details will be added to non full bases
#'  * `FALSE`: ensures that no details will be added to non full bases
#'
#'@param lines A Boolean.
#'  * `TRUE` (the default): ensures that lines will be added to non full bases
#'  * `FALSE`: ensures that no lines will be added to non full bases
#'
#'@param labels A Boolean.
#'  * `TRUE` (the default): ensures that labels will be added to non full bases
#'  * `FALSE`: ensures that no labels will be added to non full bases
#'
#'@return A tmap object
#'
#'@export
create_tmap_base <- function(
    style = "atlas",
    type = "base_full",
    details = TRUE,
    lines = TRUE,
    labels = TRUE
  ){
  if(stringr::str_detect(type, "full") == TRUE){
    full_url <- basemap_elements$url[
      basemap_elements$style == style &
        basemap_elements$element == type &
        basemap_elements$library == 'tmap'
      ]

    base <- tmap::tm_basemap(full_url)

    return(base)

  }else {
    base_url <- basemap_elements$url[
      basemap_elements$style == style &
        basemap_elements$element == type &
        basemap_elements$library == 'tmap'
    ]

    details_url <- basemap_elements$url[
      basemap_elements$style == style &
        basemap_elements$element == "details" &
        basemap_elements$library == 'tmap'
    ]

    lines_url <- basemap_elements$url[
      basemap_elements$style == style &
        basemap_elements$element == "lines" &
        basemap_elements$library == 'tmap'
    ]

    labels_url <- basemap_elements$url[
      basemap_elements$style == style &
        basemap_elements$element == "labels" &
        basemap_elements$library == 'tmap'
    ]

    base <- tmap::tm_basemap(base_url)

    if(details == TRUE){
      base <- base +
        tmap::tm_tiles(details_url, group = "Details")
    }

    if(lines == TRUE){
      base <- base +
        tmap::tm_tiles(lines_url, group = "Roads", zindex = 700)
    }

    if(labels == TRUE){
      base <- base +
        tmap::tm_tiles(labels_url, group = "Labels", zindex = 725)
    }

    return(base)
  }
}
