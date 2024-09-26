(defun dividir-por-restas (dividendo divisor)
  (if (< dividendo divisor)
      0
      (+ 1 (dividir-por-restas (- dividendo divisor) divisor))))




