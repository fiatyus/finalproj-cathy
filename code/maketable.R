here::i_am("code/maketable.R")

library(readxl)
data <-read_excel("data/cptcodes.xlsx")

library(labelled)
library(gtsummary)

#changing medicaid variable to numeric
data <- data |> mutate(medicaid = as.numeric(medicaid)) 


# Install and load necessary packages
# Set a CRAN mirror

# install.packages('vtable', repos='http://cran.us.r-project.org')

library(vtable)

#changing the labels for the table
labs <- c('Medicaid Reimbursement','Medicare Reimbursement', 'Commercial Reimbursement', "Medicaid Reimbursement % of Medicare", "Medicaid Reimbursement % of Commercial"
)

library(knitr)
library(kableExtra)


my_table <- st(data, labels=labs, 
               summ=c('notNA(x)', 'mean(x)', 'sd(x)', 'median(x)', 'min(x)', 'max(x)'),
               summ.names = list(c('N','Mean','SD', 'Median', 'Min','Max')),
               title="Orthopedic CPT Code Reimbursements by Insurance",
               col.align = 'center', 
               out = 'return') #using vttable to make summary descriptive table 

kable(my_table) %>% kable_styling() #styling table

saveRDS(
  my_table,
  file = here::here("output/table.rds")
)