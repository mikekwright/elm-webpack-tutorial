04 - Webpack Static Site
=========================================

So for this last step in todays discussion we will be using the information that
we have completed in the first 3 stages to build a static site that will be hosted 
by github.    


## Overview

We will be capitalizing on githubs awesome feature to give you the ability to create
static sites for github projects by following the github standard for the static
content.   

Create a repo that is your username.github.io and the master branch will be used to
host the static site.   

If you want a project based site you will just need to put the static content into
a branch named `gh-pages`, you can then access the site by navigating to the url
`username.github.io/projectname`.   

## Steps

1. Create a new project on github that we will use for our github page.    

2. Clone the repo and create the scripts we will use for publishing the compiles pages.

3. Start our docker container that we will use for our project, create skeleton and build

        docker run -it -p 8080:8080 -v $PWD:/src mikewright/elm-webpack:STEP-4
        setup-project
        npm install
        elm make
        npm run build

4. Exit the container and run deploy
      
        ./deploy

5. Navigate to your site to see the completed result
        

### Notes


## References

[Github - Creating Project Pages](https://help.github.com/articles/creating-project-pages-manually/)    

