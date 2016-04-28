#lang web-server/insta
(require graphics/turtles)
(turtles #t) 
 
; post Structure- required for Blog definition
(struct post (title body))
 
; Blog definition- required for HTML webpage to run
(define BLOG
  (list (post "Welcome to FTG" "Please enter name and a number. (Number must be greater than 1, and less than 100)")))
 
; start: runs the webpage
(define (start request)
  (local [(define a-blog
            (cond [(can-parse-post? (request-bindings request))
                   (cons (parse-post (request-bindings request))
                         BLOG)]
                  [else
                   BLOG]))]
    (render-blog-page a-blog request)))

(define (can-parse-post? bindings)
  (and (exists-binding? 'title bindings)
       (exists-binding? 'body bindings)))

; Fractal number global
(define mynumb 0)

; Parse Bindings
(define (parse-post bindings)
  (begin (display "User's name: ")
         (display (extract-binding/single 'title bindings))
         (set! mynumb (string->number (extract-binding/single 'body bindings)))
         (display "\nSide Length is: ")
         (display mynumb)
         (pythagoras-tree 100)
         (post (extract-binding/single 'title bindings)
               (extract-binding/single 'body bindings))))

; render-blog-page: blog request -> response
; Consumes a blog and a request, and produces an HTML page
; of the content of the blog.
(define (render-blog-page a-blog request)   ;;John A. Modified render-blog-page, now webpage displays text box and submit button
  (response/xexpr
   `(html (head (title "FTG- WmHTML"))
          (body (h1 "Fractal Turtle Graphics- With more HTML")
                ,(render-posts a-blog)
                (form
                 (input ((name "title")))
                 (input ((name "body")))
                 (input ((type "submit"))))))))

;; Patrick Donegen supplied the first Recursive function that we will use
(define (pythagoras-tree side) ; starting position: center of square, facing east
  (if (< side mynumb) ; this seems like a good stopping point...
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
      ;; Once the webpage and fractal function are linked, will uncomment- original fractal code will be uploaded seperately as well




; Required for HTML
(define (render-post a-post)
  `(div ((class "post"))
        ,(post-title a-post)
        (p ,(post-body a-post))))
 
; Required for HTML
(define (render-posts a-blog)
  `(div ((class "posts"))
        ,@(map render-post a-blog)))
