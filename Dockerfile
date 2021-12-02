
FROM wuzhenlisa/info550

# install R packages like this
# put as close to top of script as possible to make best 
# use of caching and speed up builds
#Run Rscript -e "install.packages('renv')"
#Run Rscript -e "renv::restore()""
#RUN Rscript -e "install.packages('here')"
#RUN Rscript -e "install.packages('dplyr')"
#RUN Rscript -e "install.packages('ggplot2')"
#RUN Rscript -e "install.packages('knitr')"
#RUN Rscript -e "install.packages('table1')"
#RUN Rscript -e "install.packages('rmarkdown')"

# make a project directory in the container
# we will mount our local project directory to this directory
#RUN mkdir /project

# copy contents of local folder to project folder in container
COPY ./ /project/

# make R scripts executable
#RUN chmod +x /project/R/*.R


WORKDIR /project
# make container entry point bash
CMD make report