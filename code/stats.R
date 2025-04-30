library(pacman)
p_load(tidyverse, readr)

tstep = 5

SE_converter <- function(filepath, tstep)
{
  data <- read_csv(filepath)
  
  data <-
    data %>% 
    filter(Time != 0)
  
  blc_cost <- numeric(ncol(data)-2)
  names(blc_cost) <- colnames(data)[-c(1,2)]
  
  data_error <- data
  
  for(i in 3:ncol(data))
  {
    data_error[,i] <- data[,i] - data[,2]
    
    blc_cost[i-2] = sum(data_error[,i]^2*tstep)
  }
  
  return(blc_cost)
}

SE_tableizer <- function(data)
{
  SE_tibble <- as_tibble(matrix(nrow = length(data), ncol = 4))
  
  cyp_names <- names(data)
  
  SE_tibble[,1:3] <- (str_split_fixed(cyp_names, pattern = "_", n=4))[,2:4]
  SE_tibble[,4] <- data
  
  colnames(SE_tibble) <- c("allele", "n_admin", "dosing", "cost")
  
  SE_tibble <-
    SE_tibble %>% 
    filter(allele != "1A")
  
  SE_tibble <-
    SE_tibble %>% 
    mutate(n_admin = str_split_fixed(n_admin, "n",2)[,2])
}

SE_OCT <- 
  SE_converter("data/data_OCT_C_B.csv", tstep) %>% 
  SE_tableizer()

SE_SOC <- 
  SE_converter("data/data_SOC_C_B.csv", tstep) %>% 
  SE_tableizer()

SE_total <- rbind(SE_SOC, SE_OCT)

SE_best_case <- 
  SE_total %>% 
  group_by(allele, dosing) %>% 
  mutate(test = n_admin[which.min(cost)]) %>% 
  filter(n_admin == test) %>% 
  select(!test)

stopifnot(
  
  sum(
    SE_best_case$allele[1:(nrow(SE_best_case)/2)] == SE_best_case$allele[(nrow(SE_best_case)/2+1):nrow(SE_best_case)] 
  ) == nrow(SE_best_case)/2
  
)

SE_OCT_best_case <- 
  SE_best_case %>% 
  filter(dosing == "OCT")
  
SE_SOC_best_case <- 
  SE_best_case %>% 
  filter(dosing == "SOC")

SE_diffs <- SE_OCT_best_case$cost - SE_SOC_best_case$cost
  
t.test(SE_diffs)
  
  
  
  