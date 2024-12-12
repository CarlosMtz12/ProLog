(car (cdr (cdr (cdr '(a b c d e f g h)))))  ;regresa el 4 elemento 

(cdr(cdr (cdr (cdr (cdr '(a b c d e f g h))))))  ;Refresa los 3 ultimos 

;Regrese los 3 primeros
(defun primeros-tres (lista)
  (list (car lista) (car (cdr lista)) (car (cdr (cdr lista)))))
(primeros-tres '(a b c d e f g h))  ; Regresa (a b c)


;elimina el primero y el ultimo
(defun primeros-tres (lista)
  (list (car lista) (car (cdr lista)) (car (cdr (cdr lista)))))
(primeros-tres '(a b c d e f g h))  ; Regresa (a b c)


;suma los 3 primeros numeros
(defun suma-tres-primeros (lista)
  (+ (car lista) (car (cdr lista)) (car (cdr (cdr lista)))))
(suma-tres-primeros '(1 2 3 4 5))  ; Regresa 6


;recorre toda la lista 
(defun recorrer-lista (lista)
  (dolist (elemento lista) (print elemento)))
(recorrer-lista '(a b c d e f g h))


;invierte los pares de la lista 
(defun invertir-pares (lista)
  (when lista
    (let ((siguiente (cdr lista)))
      (when siguiente
        (cons (car siguiente) (cons (car lista) (invertir-pares (cdr siguiente))))))))
(invertir-pares '(a b c d e f g h))  ; Regresa (b a d c f e h g)
