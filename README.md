# SmithWaterman

## 1. Aim of the project

The project has been developed as part of the exam for the Scientific Programming course (A.A. 2021-2022) of the Bioinformatics for Computational Genomics Master's degree.<br>
The aim of the project was to develop a package in R that implements the local pairwise alignment method using the Smith-Waterman algorithm to find the best optimal global alignment between two sequences.<br>
Since the projects guidelines did not specify it, the project has been developed as a standard R package that could be used locally on RStudio, not as a compliant Bioconductor package.<br>
The main expected outcomes of the package were the following:
1. appropriate data structures for the implementation of the Smith-Waterman algorithm;
2. a function that takes as parameters:
    
    a1. the cost of a match,<br>
    a2. the cost of a mismatch,<br> 
    a3. the cost of a gap/indel,<br>
    b. the first nucleotide sequence,<br>
    c. the second nucleotide sequence.<br>
    
    As result, it returns one optimal alignment between the two input sequences;<br>
  
3. documentation of the design and development;
4. the implementation should work smoothly for sequences of length equals to ~500 nucelotides;
5. optionally: unit test implementation.<br><br>

## 2. What does the repository store?

The main tool that is used in R to develop packages is `devtools`, which allows the instant creation of a 'skeleton' that gives the basic structure for organizing the package in a series of files and directories.<br>
The content of this repository reflects the basic files and directories necessary to build a working package, which are:
- **DESCRIPTION** file, which describes the project, sets up what packages are suggested for the dvelopment tasks and applies a license.
- **NAMESPACE** file, that is automatically generated and lists the function in the package.
- **R** directory, which stores the `.R` code of the main function.
- **man** directory, which contains the documentation that will become the help page in the package.
- **tests** directory, which stores the files for unit testing of the function relying on the `testthat` package.
- **vignettes** directory, in which is stored a very thorough description of the package developmental process in form of a `.Rmd` file, with explanation of the code and a usage example. The Rmarkdown file can be visualized in form of an HTML by the `knitr` package.
There are also other files referred to the package in the repository which are automatically generated, plus some `.gitignore` files that refer to the version control changes.<br><br>

## 3. Package installation

The package can be installed from from Github with `devtools` in RStudio with the following command:
```{r}
> if (!require("devtools")) {install.packages("devtools")}

> devtools::install_github("sonechkina/SmithWaterman")
```

Alternatively, the package compressed file can be installed from the terminal by typing:
```
> R CMD INSTALL SmithWaterman_0.1.0.tar.gz
```
Once the package is installed, it can be loaded in the current RStudio session:
```
> library(SmithWaterman)
```
