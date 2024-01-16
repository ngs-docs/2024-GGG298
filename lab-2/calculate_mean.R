# Check if command line arguments are provided
if (length(commandArgs(trailingOnly = TRUE)) != 2) {
  cat("Usage: Rscript calculate_mean.R input_file output_file\n")
  quit(status = 1)
}

# Get input and output file paths from command line arguments
input_file <- commandArgs(trailingOnly = TRUE)[1]
output_file <- commandArgs(trailingOnly = TRUE)[2]

# Load data from the input file
data <- scan(input_file, what = numeric(), na.strings = "", quiet = TRUE)

# Check if data is non-empty
if (length(data) == 0) {
  cat("Error: No valid numeric data found in the input file.\n")
  quit(status = 1)
}

# Calculate the mean of the numbers
mean_value <- mean(data)

# Output the mean to the specified output file
writeLines(paste("Mean:", mean_value), output_file)

cat("Mean calculation completed. Result written to", output_file, "\n")
