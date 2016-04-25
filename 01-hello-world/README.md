01 - Hello World (of elm)
==========================================================

For this first step we are going to go over the basics of elm, as a language what it does
and how it runs to generate html code that we can use.   

## Overview

To get started we will first discuss some of the pieces of elm.  

1. The repl (elm-repl)
2. The compiler (elm-make)
3. The server (elm-reactor)
4. The package manager (elm-install) 

The next portion will be us creating our first elm project (that is a simple hello world).    

## Steps

1. To start open our docker container (or install required pieces).   

        docker run --rm -it -p 8000:8000 -v $PWD:/src mikewright/elm-webpack:STEP-1

2. At this point we should have a running container that has elm installed

        elm --help

3. Create our Main.elm file

        import Html

        main : Html.Html
        main = 
          Html.text "Hello World (of elm)"

5. Start our server (setup environment)

        elm reactor

4. Install our missing dependant package (Html)  

        elm package install evancz/elm-html

6. Start our server (again)

        elm reactor

### Notes

This section holds the notes from the above steps, this will hopefully provide some
of the clarity needed to understand what is going on.   

#### Step 1

The elm reactor (that basically compiles and runs the app) uses port 8000 by default
so we will need to make sure that we have that open.  Also rather than losing our
changes we are going to mount the volume so that the changes are left in your 
system after we are done.     

#### Step 2

This gives us a brief overview of the tools that we have available to use    

#### Step 3

For elm the one important thing to note is that the main function is the function
that elm will always start with.  In this case we want to make sure that we are 
defining our main function correctly, so that it returns an Html element that can
be used to render html.    

Note that when defining methods in elm, there is a definition that will be followed
by an implementation.     

#### Step 4

When we start elm reactor after having added our main file, we can open a page that 
basically has a list of the files in the current directory.  When we click on the 
Main.elm file to have it run you should see some output that is similiar to below.   

        Downloading elm-lang/core
        Packages configured successfully!
        I cannot find find module 'Html'.
        
        Module 'Main' is trying to import it.
        
        Potential problems could be:
          * Misspelled the module name
          * Need to add a source directory or new dependency to elm-package.json

So this means that we are missing a dependency that we need to install.  Stopping
the server and looking in the directory should show you some new files that have
been added.    

        elm-package.json
        elm-stuff/

This basically creates the project structure that we need for our app.  

#### Step 5

This step will install the module that we need (Html) that is a core module provided
by the author of elm (evancz).  This will also install any other dependencies that
the Html module may have.  

The other thing this will do is include the new package into our `elm-package.json`
file as a dependency.    

#### Step 6

Finally when we restart the server and click on the Main.elm file again (or just 
refresh the page if still there) we should now see our expected output.    

## References

* [Elm Tutorial (Online)](http://www.elm-tutorial.org/)    

