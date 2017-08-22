library(readxl)
library(dplyr)


sheet <- read_xlsx("data.xlsx", 1) %>% select(item_id, item_qty)
count <- read_xlsx("data.xlsx", 2)
samples <- read_xlsx("data.xlsx", 3)

count$item_id <- toupper(count$item_id)

fts <- inner_join(count, samples, by = c("item_id"))
  
fts$tm <- if_else(fts$tag_id.x == fts$tag_id.y, "A", "")

fts <- fts %>% left_join(sheet, by = "item_id")

fts <- fts %>% group_by(sample_type, sample_id) %>% mutate(diff = first(item_qty) - sum(tag_qty))
 
fts <- fts %>%
  select(sample_id, item_id, item_descr.y, unit.x, tag_id.x, tm, tag_qty, item_qty, diff, sample_type, tag_id.y) %>%
  arrange(sample_type, sample_id)


write.csv(fts, "output.csv", row.names = F)
