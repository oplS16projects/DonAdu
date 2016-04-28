#lang web-server/insta
(require graphics/turtles)
(require xml net/url)
(turtles #t) 

;intended to globalize this variable to receive number input
;(define get-number 0)

 
              
; start: runs the webpage
(define (start request)
 (render-blog-page request "/reply"))



(define (pythagoras-tree side) 
  (if (< side 30) 
      (home)     
      (let ((half-side (/ side 2)))
        (turn 90)        
        (move half-side) 
        (turn 90)        
        (draw half-side) 
        (turn 90)        
        (draw side)      
        (turn 90)        
        (draw side)      
        (turn 90)        
        (draw side)      
        (turn 90)        
        (draw half-side) 

        (turn -45)         
        (split (turn -90)) 

        (move (* half-side (sqrt 2))) 
        (turn -90)                    
        (pythagoras-tree (* (/ (sqrt 2) 2) side)))))



(define (render-blog-page request next-url)  
  (response/xexpr
   `(html (head (title "FTG- WmHTML"))
          (body (h1 "Fractal Turtle Graphics- With more HTML")
                (h1 "Introduction")
               
(p "A fractal is a never ending pattern that repeats itself at different scales, in the words of 
Wolfe, Schuertz, and Eckert. The property described above is referred to as, Self-Similarity. 

Fractals are discovered in nature, in Geometry, and in Algebra as trees, Sierpinski triangles,
and in Mandelbrot equation respectively. Other natural examples of fractals are our lungs,
neurons, lightning,  and fiddlehead fern. Examples of fractals in Geometry and Algebra include Koch Curve, Galanga, and
Morphalingus.")

(h1 "Uses")
(p "Fractals are applied in science and engineering to establish correct patterns or normal functioning. For instance, healthy blood vessels are modeled using fractals by scientists, 
in order to detect cancerous tumors. Furthermore, fractal patterns are used in engineering, for example, to design chips used in cellphone antenna. 
Lastly, fractals are applied to the design of space-filling devices that facilitate fluid mixing,
instead of using centrifuges, according to Dr. Wolfe et al.")
(h1 "Generate Fractal Patterns")
                "How many recursions should the function preform? "
                 (form ([action ,next-url]
                        [method "get"])
                (input ([type "text"] [name "number"]
                                      [value " "]))
                (input ([type "submit"] [name "enter"]
                                        [value "Enter"])))
               
               
 ))))


  

;(define (dispatch frac-path)
 ; (define url (string->url frac-path))
  ;(define path (map path/param-path (url-path url)))
  ;(define frac-handler (hash-ref dispatch-table (car path) #f))
   ; (if frac-handler
    ;    (frac-handler (url-query url))
     ;   `(html (head (title "Fractal Display Page"))
      ;         (body
       ;         (p, frac-path)))))

(define dispatch-table (make-hash))

(define (reply query)
  (let ([n (string->number (cdr (assq 'number query)))])
   `(html (body
           (h1 "Fractal Drawing")
           (display (pythagoras-tree n))))))


(hash-set! dispatch-table "reply" reply)



;(sleep (random 10))
;(define (parse-number bindings)
 ;(begin (set! get-number (string->number (extract-binding/single 'number (request-bindings bindings)))) get-number))

