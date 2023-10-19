# SmithWaterman

## 1. Aim of the project

The project has been developed as part of the exam for the Scientific Programming course (A.A. 2021-2022) of the Bioinformatics for Computational Genomics Master's Degree. <br>
The aim of the project was to develop a package in R which implements the local pairwise alignment method using the Smith-Waterman (S-W) algorithm to find the optimal global alignment between two sequences.<br>
This project has been developed as a standard R package that could be used locally on RStudio, not as a compliant Bioconductor package. <br><br>
The main expected outcomes of the package were the following:
1. appropriate data structures for the implementation of the S-W algorithm;
2. a function that takes as parameters: <br>
    a1. cost of a match, <br>
    a2. cost of a mismatch, <br> 
    a3. cost of a gap, <br>
    b. first nucleotide sequence, <br>
    c. second nucleotide sequence. <br>
    As result, the function returns on optimal alignment between the two input sequences; <br>
3. documentation of the design and development;
4. the implementation should work smoothly for sequences of length equals to ~500 nucleotides;
5. an optional unit testing implementation. <br><br>

## 2. What does the repository store?

One possible tool that is used in R to develop packages is `devtools`, which allows the instant creation of a "skeleton" that provides the basic structure for organizing the package in a series of files and directories. <br>
The content of this repository reflects the basic files and directories necessary to build a complete package, which are:
- **DESCRIPTION** file: it describes the project, sets up what packages are suggested for the development tasks and applies a license.
- **NAMESPACE** file: it is automatically generated and it lists the function in the package.
- **R** directory: it stores the `.R` code of the main function.
- **man** directory: it contains the documentation that will become the help page in the package.
- **tests** directory: it stores the files for unit testing of the function, relying on the `testthat` package.
- **vignettes** directory: inside it is stored a very thorough description of the package developmental process in form of a `.Rmd` file, with explanation of the code abd a usage example. The RMarkdown file can be converted into an HTML file with `knitr`.<br>

There are also other files referred to the package inside the repository which are automatically generated, plus some `.gitignore` files that refer to the version control changes.<br>

The package has been developed with the following system specifics:
- R version 4.1.2 (2021-11-01)
- Platform: x86_64-w64-mingw32/x64 (64-bit)
- Running under: Windows 10 x64 (build 22621)<br><br>

## 3. Package installation
The package can be installed from Github with `devtools` in RStudio with the following commands:

```
> if (!require("devtools")) {install.packages("devtools")}

> devtools::install_github("sonechkina/SmithWaterman")
```

Once the package is installed, it can be loaded in the current RStudio session:

```
> library(SmithWaterman)
```

The help page for the function of the package can be browsed in RStudio session with the following command:

```
> ?smith_waterman
```
