# Load the relevant libraries
library(tidyverse)
library(arrow)

# Import the dataset
df <- read_parquet("dataset.parquet")
dim(df)

# Check dataset for duplicates
duplicate_count <- nrow(df) - nrow(distinct(df))
cat("Number of duplicates:", duplicate_count, "\n")

#df without the duplicates, export file
df <- distinct(df)
write_parquet(df, "dataset_no_duplicates.parquet")