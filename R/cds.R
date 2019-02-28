require(data.table)

fifa <- data.table::fread("datasets/fifa.csv", header = T, sep = ',')
ptable <- data.table::fread("datasets/ptable.csv", header = T, sep = ';')

categories <- list("ptable" = ptable,
                   "fifa" = fifa)

cds <- function(n = 10, ncat = 4) {

    num_cat <- length(categories)
    rand_cat <- categories[[sample.int(num_cat, 1)]]

    nr <- nrow(rand_cat)
    nc <- ncol(rand_cat)
    rn <- sample.int(nr, n)

  return ( as.data.frame(rand_cat[c(rn), 1:ncat]) )
}

cds()
