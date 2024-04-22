FROM rocker/rstudio as base

RUN mkdir /home/rstudio/project
WORKDIR /home/rstudio/project

RUN apt-get update
RUN apt-get install -y zlib1g-dev

RUN apt-get update
RUN apt-get install -y libxml2-dev

RUN apt-get update
RUN apt-get install -y libfontconfig1-dev 

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN R -e "renv::restore()"

FROM rocker/rstudio
WORKDIR /home/rstudio/project
COPY --from=base /home/rstudio/project .

COPY Makefile Makefile
COPY projectreport.Rmd projectreport.Rmd

RUN mkdir code output data final_report
#Add a line to your Dockerfile to add an entry point 
#to the container that creates the report 
#and copies it to the final_report directory. 

COPY data/cptcodes.xlsx data/cptcodes.xlsx

COPY code/*.R code/

CMD make cpt.html && mv projectreport.html final_report