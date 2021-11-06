## report.html  : Generate final analysis report.
report: Rmarkdown/report.Rmd figure/figure1.png figure/figure2.png
	Rscript -e "rmarkdown::render('Rmarkdown/report.Rmd')"

## figure1.png     : Make a plot between concavity mean and compactness mean for all participants
figure/figure1.png: R/figure1.R DATAA/breast_cancer.csv
	Rscript R/figure1.R

## figure2.png     : Make a plot between concavity mean and compactness mean grouped by diagnosis 
figure/figure2.png: R/figure2.R DATAA/breast_cancer.csv
	Rscript R/figure2.R

## clean        : Remove compiled report and figures.
.PHONY: clean
clean:
	rm -f Rmarkdown/report.html figure/figure1.png figure/figure2.png

.PHONY: help
help: Makefile
	@sed -n 's/^##//p' $<