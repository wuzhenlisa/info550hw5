## report.html  : Generate final analysis report.
report: Rmarkdown/report.Rmd figure/figure1.png figure/figure2.png
	Rscript -e "rmarkdown::render('Rmarkdown/report.Rmd')"

## figure1.png     : Make a plot between concavity mean and compactness mean for all participants
figure/figure1.png: R/figure1.R DATAA/breast_cancer.csv
	Rscript R/figure1.R

## figure2.png     : Make a plot between concavity mean and compactness mean grouped by diagnosis 
figure/figure2.png: R/figure2.R DATAA/breast_cancer.csv
	Rscript R/figure2.R

.PHONY: clean
clean:
	rm report.html 

.PHONY: help
help:
    @echo "report.html : Generate final analysis report."
    @echo "figure1.png    : Make a plot between concavity mean and compactness mean for all participants."
    @echo "figure2.png    : Make a plot between concavity mean and compactness mean grouped by diagnosis. "	
    @echo "clean       : Remove report."