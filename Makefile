cpt.html: code/renderreport.R projectreport.Rmd output/table.rds output/scatterplot.png
	Rscript code/renderreport.R

#! TO DO:

output/table.rds: code/maketable.R 
	Rscript code/maketable.R
#! add a rule to create the output of 
#! code/01_make_output1.Rmake

output/scatterplot.png: code/makefigure.R 
	Rscript code/makefigure.R

.phony: clean

clean: 
	rm output1/*.rds && rm -f output2/*.rds && rm -f output3/*.rds