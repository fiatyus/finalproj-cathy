cpt.html: code/renderreport.R projectreport.Rmd output/table.rds output/scatterplot.png
	Rscript code/renderreport.R

#! TO DO:

output/table.rds: code/maketable.R 
	Rscript code/maketable.R
#! add a rule to create the output of 
#! code/01_make_output1.Rmake

output/scatterplot.png: code/makefigure.R 
	Rscript code/makefigure.R

install:
	Rscript -e "renv::restore(prompt=FALSE)"

project_image: Dockerfile 
	docker build -t project_image . 
	touch @
	
cpt.html/final_report: project_image 
	docker run -v "$$(pwd)"/final_report:/home/rstudio/project/final_report project_image 

.phony: clean

clean: 
	rm output/*
	
	