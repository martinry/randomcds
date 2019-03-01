#' Generate a dataframe of categorical data
#'
#' @param n Integer to specify the number of rows (current maximum is 334000)
#' @param ncat Integer to specify the number of columns (current maximum is 23)
#' @param theme Optional. Select of the following: "science", "movies", "books", "comics", "sports", "games".
#' @keywords datasets
#' @export
#' @examples
#' # Default is a dataframe with 10 rows and 4 columns
#' mycds <- cds()
#' mycds <- cds(n = 900, ncat = 2, )


fifa <- data.table::fread("datasets/fifa.csv", header = T, sep = ',')
ptable <- data.table::fread("datasets/ptable.csv", header = T, sep = ',')
countries <- data.table::fread("datasets/concap.csv", header = T, sep = ',')
associations <- data.table::fread("datasets/associations.csv", header = T, sep = ',')
pokemon <- data.table::fread("datasets/pokemon.csv", header = T, sep = ',')
videogames <- data.table::fread("datasets/videogames.csv", header = T, sep = ',')
astronauts <- data.table::fread("datasets/astronauts.csv", header = T, sep = ',')

categories <- list("ptable" = ptable,
                   "fifa" = fifa,
                   "countries" = countries,
                   "associations" = associations,
                   "pokemon" = pokemon,
                   "videogames" = videogames,
                   "astronauts" = astronauts)

listdims <- function(l) {
    dims <- l
    for(i in 1:length(l)) {
        dims[[i]] <- list("x" = ncol(l[[i]]), "y" = nrow(l[[i]]))
    }

    return (dims)
}

dimensions <- listdims(categories)

cds <- function(n = 10, ncat = 4) {

    available <- sapply(dimensions, FUN = function(z) z$x >= ncat & z$y >= n)

    available_df <- categories[available == T]
    r <- sample.int(length(available_df), 1)
    x <- as.data.frame(available_df[[r]])
    x <- x[sample.int(nrow(x), n),1:ncat]

  return ( x )
}


