(defun menu ()
  (format t "Selecciona una opción:~%")
  (format t "1. Área de un círculo~%")
  (format t "2. Área de un cuadrado~%")
  (format t "3. Área de un rectángulo~%")
  (format t "4. Área de un triángulo~%")
  (format t "5. Área de un trapecio~%")
  (format t "6. Área de un rombo~%")
  (format t "7. Área de un paralelogramo~%")
  (format t "8. Área de un elipsoide~%")
  (format t "9. Área de un pentágono regular~%")
  (format t "10. Área de un hexágono regular~%")
  (format t "11. Volumen de un cubo~%")
  (format t "12. Volumen de un prisma rectangular~%")
  (format t "13. Volumen de un cilindro~%")
  (format t "14. Volumen de una esfera~%")
  (format t "15. Volumen de un cono~%")
  (format t "16. Volumen de una pirámide~%")
  (format t "17. Volumen de un tronco de cono~%")
  (format t "18. Volumen de un elipsoide~%")
  (format t "19. Volumen de un toro~%")
  (format t "20. Volumen de un cilindro hueco~%")
  (let ((opcion (read)))
    (cond
      ((= opcion 1) (format t "Área del círculo: ~a~%" (area-circulo)))
      ((= opcion 2) (format t "Área del cuadrado: ~a~%" (area-cuadrado)))
      ((= opcion 3) (format t "Área del rectángulo: ~a~%" (area-rectangulo)))
      ((= opcion 4) (format t "Área del triángulo: ~a~%" (area-triangulo)))
      ((= opcion 5) (format t "Área del trapecio: ~a~%" (area-trapecio)))
      ((= opcion 6) (format t "Área del rombo: ~a~%" (area-rombo)))
      ((= opcion 7) (format t "Área del paralelogramo: ~a~%" (area-paralelogramo)))
      ((= opcion 8) (format t "Área del elipsoide: ~a~%" (area-elipsoide)))
      ((= opcion 9) (format t "Área del pentágono regular: ~a~%" (area-pentagono)))
      ((= opcion 10) (format t "Área del hexágono regular: ~a~%" (area-hexagono)))
      ((= opcion 11) (format t "Volumen del cubo: ~a~%" (volumen-cubo)))
      ((= opcion 12) (format t "Volumen del prisma rectangular: ~a~%" (volumen-prisma-rectangular)))
      ((= opcion 13) (format t "Volumen del cilindro: ~a~%" (volumen-cilindro)))
      ((= opcion 14) (format t "Volumen de la esfera: ~a~%" (volumen-esfera)))
      ((= opcion 15) (format t "Volumen del cono: ~a~%" (volumen-cono)))
      ((= opcion 16) (format t "Volumen de la pirámide: ~a~%" (volumen-piramide)))
      ((= opcion 17) (format t "Volumen del tronco de cono: ~a~%" (volumen-tronco-cono)))
      ((= opcion 18) (format t "Volumen del elipsoide: ~a~%" (volumen-elipsoide)))
      ((= opcion 19) (format t "Volumen del toro: ~a~%" (volumen-toro)))
      ((= opcion 20) (format t "Volumen del cilindro hueco: ~a~%" (volumen-cilindro-hueco)))
      (t (format t "Opción no válida~%")))))

(defun area-circulo ()
  (let ((radio (read)))
    (* pi (* radio radio))))

(defun area-cuadrado ()
  (let ((lado (read)))
    (* lado lado)))

(defun area-rectangulo ()
  (let ((base (read))
        (altura (read)))
    (* base altura)))

(defun area-triangulo ()
  (let ((base (read))
        (altura (read)))
    (/ (* base altura) 2)))

(defun area-trapecio ()
  (let ((base1 (read))
        (base2 (read))
        (altura (read)))
    (/ (+ base1 base2) 2 altura)))

(defun area-rombo ()
  (let ((d1 (read))
        (d2 (read)))
    (/ (* d1 d2) 2)))

(defun area-paralelogramo ()
  (let ((base (read))
        (altura (read)))
    (* base altura)))

(defun area-elipsoide ()
  (let ((a (read))
        (b (read)))
    (* pi a b)))

(defun area-pentagono ()
  (let ((lado (read)))
    (* (/ (sqrt 5 (* 5 (+ 2 (sqrt 5)))) 4) (* lado lado))))

(defun area-hexagono ()
  (let ((lado (read)))
    (* (/ (sqrt 3) 2) (* lado lado 6))))

(defun volumen-cubo ()
  (let ((lado (read)))
    (* lado lado lado)))

(defun volumen-prisma-rectangular ()
  (let ((largo (read))
        (ancho (read))
        (alto (read)))
    (* largo ancho alto)))

(defun volumen-cilindro ()
  (let ((radio (read))
        (altura (read)))
    (* pi (* radio radio) altura)))

(defun volumen-esfera ()
  (let ((radio (read)))
    (* (/ 4/3) pi (* radio radio radio))))

(defun volumen-cono ()
  (let ((radio (read))
        (altura (read)))
    (/ (* pi (* radio radio) altura) 3)))

(defun volumen-piramide ()
  (let ((base (read))
        (altura (read)))
    (/ (* base altura) 3)))

(defun volumen-tronco-cono ()
  (let ((radio1 (read))
        (radio2 (read))
        (altura (read)))
    (/ (* pi altura (+ (* radio1 radio1) (* radio2 radio2) (* radio1 radio2))) 3)))

(defun volumen-elipsoide ()
  (let ((a (read))
        (b (read))
        (c (read)))
    (* (/ 4/3) pi a b c)))

(defun volumen-toro ()
  (let ((radio1 (read))
        (radio2 (read)))
    (* (* pi pi) radio1 (* radio2 radio2))))

(defun volumen-cilindro-hueco ()
  (let ((radio-exterior (read))
        (radio-interior (read))
        (altura (read)))
    (* pi altura (- (* radio-exterior radio-exterior) (* radio-interior radio-interior)))))

(menu)
