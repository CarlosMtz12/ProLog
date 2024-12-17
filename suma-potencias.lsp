(defun suma-potencias (base exponente)
  (if (= exponente 0)
      1  ; base^0 es 1
      (+ (expt base exponente) (suma-potencias base (- exponente 1)))))


