# Fractal Turtal Graphics

##Authors
John Adams

Ebenezer Ampadu

Patrick Donegan

##Overview

We use scheme to draw fractals when a user enters a request into a website. When the program begins to execute a 
web-server is created. The user enters data into the webpage and that data is then sent to a racket function which 
draws a fractal shape.

##Screenshot
![screenie](https://cloud.githubusercontent.com/assets/17749976/14918342/6847d69c-0df1-11e6-9172-bc53942be614.jpg)

##Concepts Demonstrated
Identify the OPL concepts demonstrated in your project. Be brief. A simple list and example is sufficient. 
* Fractals are drawn through recursion
* html web-server is kicked off by Racket
* web-server takes data input from user to make a custom fractal drawing 

##External Technology and Libraries

We used #lang web-server/insta and turtle graphics to accomplish this project.

##Favorite Scheme Expressions


####John Adams

The function parse-post bindings is the magic behind the program. The main driving force behind the entire program is: 
(set! mynumb (string->number (extract-binding/single 'body bindings)))

This line of code takes the user input string from the "body" text box, changes it to a number, and the sets the global variable 'mynumb' to the value retrieved. this is then passed as the smallest side length, in the pythagoras-tree function. Once the number is retrieved, only after the "Stop" button in DrRacket is pressed, does the Turtle Graphics window come into play, where the fractal is drawn- starting at a side length of 100, and decreasing down to the minimum length entered by the user.

```scheme
(define (parse-post bindings)
  (begin (display "User's name: ")
         (display (extract-binding/single 'title bindings))
         (set! mynumb (string->number (extract-binding/single 'body bindings)))
         (display "\nSide Length is: ")
         (display mynumb)
         (pythagoras-tree 100)
         (post (extract-binding/single 'title bindings)
               (extract-binding/single 'body bindings))))
```


####Patrick
This expression is what builds the fractal with turtles. at the end the expression first moves the two new turtles into positon and then recursively calls the function again. pythagoras-tree is the function which draws the fractal images. This embodies recursion which was the heart of this OPL class
```
 (define (pythagoras-tree side) ; starting position: center of square, facing east
  (if (< side 30) ; when side length is less than 30 stop!
      (home)     ; clear all turtles except the original
      (let ((half-side (/ side 2)))
        (turn 90)        ; now facing north
        (move half-side) ; move north
        (turn 90)        ; now facing west
        (draw half-side) ; draw west
        (turn 90)        ; now facing south
        (draw side)      ; draw south
        (turn 90)        ; now facing east
        (draw side)      ; draw east
        (turn 90)        ; now facing north
        (draw side)      ; draw north
        (turn 90)        ; now facing west
        (draw half-side) ; draw west

        (turn -45)         ; turn turtle 1 (current turtle) to face northwest
        (split (turn -90)) ; create and turn turtle 2 to face northeast

        (move (* half-side (sqrt 2))) ; move both turtles to the centers of the new squares
        (turn -90)                    ; and adjust them to face east
        (pythagoras-tree (* (/ (sqrt 2) 2) side)))))

(pythagoras-tree 100)
 
 ```

##Additional Remarks

We were able to get something together. However, We were not as successful as we hoped. Integrating the web stuff
with the turtle graphics became a pitfall that was never fully solved.

Because of the nature of Turtle Graphics, Drawing the fractals in an Html page proved impossible. To upload an image to an html page, we would need more time to find and learn the documentation that was responsible.
Also because Turtle Graphics draws in the final stages of a program, the program needs to be stopped in DrRacket before the final drawing is rendered in the Turtle Graphics window. There is no way around this that I was able to find, unfortunately.

