;; примитивные операции 
(+ 1 2)
(+ 2  4 6 4 9 8 10)
(+(* 10 2) (* 2 4))
(+ 1 2)
(+ 2  4 6 4 9 8 10)
(+(* 10 2) (* 2 4))
(define pi 3.14)
(+ pi pi pi pi)
(define radius 10)
(* pi (* radius radius ))
;; определяем процедуру(функцию)
(define (square x) (* x x))
(square 2)
(square 10)
;; вывод <procedure square (x)>
(define (sum-of-squares x y) (+ square x) (square y))
(sum-of-squares 9 26) ;; 757
(define (f a) (sum-of-squares (+ a 1) (+ a 2)))
(f 5) ;; 85 

;; когда я вызываю (f 5) происходит вот что 
(sum-of-squares (+ 5 1) (+ 5 2)) ;; первый шаг
(+ (square 6) (square 7)) ;; второй шаг 
(+ (* 6 6) (* 7 7)) ;; третий шаг 
(+ 36 49) ;; выражения вычислились

;; нормальный порядок - стратегия вычислений, при которой охватывающее выражение полностью редуцируется, применяя функции до вычисления аргументов 
(+ (square (+ 5 1)) (square (+ 5 2))) ;; не вычисляем выражения до тех пор, пока они не используются  
(+ (* (5 + 1) (5 + 1) (* (5 + 2) (5 + 2)))) 
(+ (* 6 6) (* 7 7)) 
(+ 36 49)

;; условие вот так выглядит
(define (abs x)
  (cond ((> x 0) x) ;; true/false
        ((= x 0) 0)
        ((< x 0) (- x))))

(> 10 12) ;; #f

(> 10 5) ;; #t

(abs 5)
(abs 0)
(abs -18)

;; один из способов не является частью языка - это синтаксический сахар 

;; cond используем когда пишем множественное условие, если два варианта - if 

(define (abs x )
  (if (< x 0) (- x) x))
;; (< x 0) условие 
;; (- x) последствие 
;; x альтернатива 
;; выше переписанный вариант

(abs -19)

(define (>= x y)
  (or (> x y) (= x y)))
;; написали больше-либо-равно

(define (>= x y)
  (not (< x y)))

(>= 10 10) ;; #t

;; на этом этапе мы изучили лисп 
;; изучаем рекурсию и пишем процедуру, которая ищет квадратный корень числа 

;; метод ньютона - пусть это будет корень 

(define (sqrt-iter guess x)
  (if (good-enough? guess x) guess
    (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average a b)
  (/ (+ a b) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.01))

(define (sqrt x)
  (sqrt-iter 1.0 x))

