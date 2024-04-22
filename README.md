# Report Description

This repository contains the code and outputs to generate the Orthopedic Reimbursements Rates in Illinois for Current Procedural Terminology (CPT) codes. 

The data set  compares Medicaid, Medicare, and commercial (Blue Cross Blue Shield) reimbursement rates for different orthopedic CPT codes. The data  outlines how much a physician would get reimbursed through different insurances for the same procedure.

The analysis in the report looks at the average reimbursements, and other descriptive statistics, for each insurance within orthopedics. It also compares Medicare as a function of Medicaid, in an attempt to examine their correlation.

The code contains R scripts that will generate the table that summarizes the codes' averages, the scatterplot figure that compares the CPT rates between Medicare and Medicaid, and the rendered Rmarkdown report.

The output contains the table and figure itself.

'code/' contains all code related to the tabular analysis and the graphical analysis.

-`data/` contains the cptcodes.xlsx dataset

-`/code/maketable.R` produces the Tabular analysis

-table output saved to `output/`

-`/code/makescatter.R` produces the scatter plot

-scatter plot should be saved to `output/`

-`projectreport.Rmd` reads in output from `output/` and cptcodes.xlsx and creates the report with the descriptive and graphical analysis

-`code/renderreport.R` is used for rendering the report from the command line

-to synchronize package repository with `renv::restore()`, run `make install` in the command line

-to build and run the Docker image, run `make cpt.html/final_report`, to run for a
Mac/Linux-OS-specific target