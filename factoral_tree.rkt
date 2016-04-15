#lang racket

(require graphics/turtles)
(turtles #t)

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

