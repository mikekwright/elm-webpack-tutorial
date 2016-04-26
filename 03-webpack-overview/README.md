03 - Webpack Overview
========================================

Ok at this point we have a project that we have created.  This project was simple but it is pretty dependant 
on us doing everything inside of elm (using elm-make, etc).  This means if we want to use other items to handle
out application (such as less for our css) we would have to manually script that together.  Lucky for us there
is a tool called webpack that will basically allow us to process files with different names in different 
fashions and combine the results into our expected application.  

## Overview

In this section we will be going over the basics of webpack which includes how to set it up, how to 
add our processors (elm, less), and how to use the tool in our development process.  

We will also discuss some of the philosophies that are in webpack, namely:   

1. Everyting is a module
2. Only load what you want, when you want it

## Steps

1. First we will need to start our docker container (or install webpack)

        docker run -it mikewright/elm-webpack:STEP-3
        #
        npm install -g webpack

2.  




### Notes


## References

