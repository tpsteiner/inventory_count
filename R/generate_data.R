library(tibble)
library(readr)
library(dplyr)
library(ids)


shuffle_then_rand <- function(unshuffled, n) {
  # Return list of length n
  # All items in return list must be from short_list
  # All items in short_list must be used
  
  unshuffled_n <- length(unshuffled)
  extra_n = n - unshuffled_n
  
  if (extra_n < 1) stop("long_list must be longer than short_list.")
  
  shuffled <- sample(unshuffled, unshuffled_n)
  
  shuffled <- c(shuffled, sample(shuffled, extra_n, replace = TRUE))
  
  return(shuffled)
}

divide_qty <- function(item_qty, idx){
  tag_qty <- rep(NA, length(idx))

  for (i in 1:length(item_qty)) {
    matches <- which(idx == i)
    n <- length(matches)
    
    for (m in matches) {
      tag_qty[m] <- matches[1] / n
      
    }
  }
  
  return(tag_qty)
}



item_n <- 500
item_id <- random_id(item_n, 4)
item_loc <- ids::proquint(item_n, 1)
item_qty <- round(runif(item_n, 1, 1000))

items <- tibble(item_id, item_loc)


tag_n <- 1150
tag_id <- 1:tag_n
tag_item_id <- shuffle_then_rand(item_id, tag_n)
tag_loc <- tibble(item_id=tag_item_id) %>%
  left_join(items) %>% 
  select(item_loc) %>%
  unlist() %>%
  unname()

tag_item_idx <- match(tag_item_id, item_id)
tag_qty <- divide_qty(item_qty, tag_item_idx)

tags <- tibble(tag_id, tag_item_id)






sample_n <- round(.15*tag_n)
sample_id <- 1:samples_n

samples <- tibble(sample_id = sample_id)

