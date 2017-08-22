library(readxl)
library(dplyr)

set.seed(50)

count <- read_xlsx("data.xlsx", 2)
sheet <- read_xlsx("data.xlsx", 1) %>%
  sample_n(16) %>% 
  mutate(sample_id = 1:16)

stf <- inner_join(count, sheet, by = c("item_id")) %>%
  group_by(sample_id) %>% 
  mutate(diff = first(item_qty) - sum(tag_qty)) %>%
  select(sample_id, item_id, item_descr.y, unit.y, item_qty, tag_id, tag_qty, diff) %>%
  arrange(sample_id)

write.csv(stf, "output_stf.csv", row.names = F)
