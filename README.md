# Get-and-clean-data-Project

Overview

# Project for Coursera Get and Clean Data course
The project was designed to demonstrate the process of 
acquiring and cleaning datasets so they could be manipulated
and analyzed.  In other words, to prepare some raw data for
later anaysis.

## Getting started

### Dependencies

The program was written on a Windows 7 machine using Rstudio Version 1.1.442
and R version 3.4.4

The package dplyr is required for the group_by function.

### Installing

The program is found on github at
https://github.com/Marky59/Clean-data

### Executing program

The program should be opened in Rstudio and executed from there.
There shouldn't be any need to modify any user folders.
The program will begin with the user's working directory and 
create any needed folders from there.  The code used to create
folders is

if(! file.exists("coursera")){dir.create("coursera")}
setwd(file.path(getwd(),"coursera"))

if(! file.exists("get and clean data")){dir.create("get and clean data")}
setwd(file.path(getwd(),"get and clean data"))

if(! file.exists("project")){dir.create("project")}
setwd(file.path(getwd(),"project"))

## Help

No help file has been provided.

## Authors

Just me

## Version History

* 0.1
    * Initial Release

## License

No license required

## Acknowledgments

I used a template found here

*  https://gist.github.com/DomPizzie/7a5ff55ffa9081f2de27c315f5018afc
