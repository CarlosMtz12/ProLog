(defun verificar-edad ()
  (format t "Por favor, ingresa tu edad: ")
  (let ((edad (read)))
    (if (>= edad 18)
        (format t "Eres mayor de edad.~%")
        (format t "No eres mayor de edad.~%"))
    
    (unless (zerop (mod edad 2))
      (format t "Tu edad es impar.~%"))
    
    (when (zerop (mod edad 2))
      (format t "Tu edad es par.~%"))))

(verificar-edad)
