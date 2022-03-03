library(tidyverse)

install.packages("tictoc")



d <- tibble(a = sample(letters, size = 5e7, replace = T),
            b = rnorm(5e7),
            c = runif(5e7))

# tictoc::tic()
# d %>%
#   write_csv("work/big_container.csv")
# tictoc::toc()
# # 21.192 sec elapsed
# 
# tictoc::tic()
# d %>%
#   write_csv("work/home/culshawmaurer/big_DS.csv")
# tictoc::toc()
# # 28.886 sec elapsed

# rm(list = "d")
# 
# tictoc::tic()
# d <- read_csv("work/big_container.csv")
# tictoc::toc()
# # 81.955 sec elapsed
# 
# rm(list = "d")
# 
# tictoc::tic()
# d <- read_csv("work/home/culshawmaurer/big_DS.csv")
# tictoc::toc()
# # 142.31 sec elapsed

tictoc::tic()
d %>% 
  mutate(group = sample(1:1000, size = 5e7, replace = T)) %>%
  group_by(group) %>% 
  nest() %>% 
  pwalk(function(group, data)  write_csv(x = data, 
                                         file = paste0("work/many_files/test_", group, ".csv")))
tictoc::toc()
# 297.997 sec elapsed
# after this one, I ran `time cp -r work/many_files/ work/home/culshawmaurer`
# real 7m35.961s

ticoc::tic()
d %>% 
  mutate(group = sample(1:1000, size = 5e7, replace = T)) %>%
  group_by(group) %>% 
  nest() %>% 
  pwalk(function(group, data)  write_csv(x = data, 
                                         file = paste0("work/home/culshawmaurer/many_files_2/test_", group, ".csv")))
tictoc::toc()
# 1006.469 sec elapsedt
