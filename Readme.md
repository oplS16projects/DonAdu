# FP7-webpage Title of Project
This is a template for using your repo's README.md as your project web page. 
I recommend you copy and paste into your README file. Delete this line and the one above it, customize everything else. Make it look good!

##Authors
Person One

Person Two

Patrick Donegan

##Overview
A brief description of the project is given here.  The description is 1 to 3 sentences long.  Be concise and clear.

We use scheme to draw fractals when a user enters a request into a website. When the program begins to execute a 
web-server is created. The user enters data into the webpage and that data is then sent to a racket function which 
draws a fractal shape.

##Screenshot
(insert a screenshot here. You may opt to get rid of the title for it. You need at least one screenshot. Make it actually appear here, don't just add a link.)

Here's a demonstration of how to display an image that's uploaded to this repo:
![screenshot showing env diagram](withdraw.png)

##Concepts Demonstrated
Identify the OPL concepts demonstrated in your project. Be brief. A simple list and example is sufficient. 
* **Data abstraction** is used to provide access to the elements of the RSS feed.
* The objects in the OpenGL world are represented with **recursive data structures.**
* **Symbolic language processing techniques** are used in the parser.

##External Technology and Libraries
Briefly describe the existing technology you utilized, and how you used it. Provide a link to that technology(ies).

We used #lang web-server/insta and turtle graphics to accomplish this project.

##Favorite Scheme Expressions


####Mark (a team member)
Each team member should identify a favorite expression or procedure, written by them, and explain what it does. Why is it your favorite? What OPL philosophy does it embody?
Remember code looks something like this:
```scheme
(map (lambda (x) (foldr compose functions)) data)
```
####Lillian (another team member)
This expression reads in a regular expression and elegantly matches it against a pre-existing hashmap....
```scheme
(let* ((expr (convert-to-regexp (read-line my-in-port)))
             (matches (flatten
                       (hash-map *words*
                                 (lambda (key value)
                                   (if (regexp-match expr key) key '()))))))
  matches)
```


####Patrick
This expression recursively calls the function again. This embodies recursion which was the heart of this OPL class
```
 (pythagoras-tree (* (/ (sqrt 2) 2) side) ;; recursively call the function again   
 
 ```

##Additional Remarks
Anything else you want to say in your report. Can rename or remove this section.

We were able to get something together. However, We were not as successful as we hoped. Integrating the web stuff
with the turtle graphics became a pitfall that was never fully solved.

