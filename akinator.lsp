

(defun recorre (lista) 
    (when lista 
        (let ((elemento (car lista)))
        (format t "¿Tu personaje es a?%" (car elemento)) 
        (setq a (read))
        (if (string-equal a "si")
            (progn
                (setq b (cadr (assoc (car elemento) lista)))
                (recorre b)
            )
        (recorre (cdr lista))
        )
        )
    )
)



(defparameter *nodes* '((Labrador (
                                        (jugueton(Buddy))
                                        (tranquilo(Lucy))
                                        (cazador(Spot))
                                        (amigable(Max))))
                             (Husky (
                                        (energetico(Luna))
                                        (inteligente(Ace))
                                        (amigable(Bella))
                                        (resistente(Apollo))))
                             (salchicha (
                                        (curioso(Oliver))
                                        (jugueton(Molly))
                                        (rastreador(Charlie))
                                        (amistoso(Sadie))))
                             (Dalmata (
                                        (activo(Pongo))
                                        (pintoresco(Perdita))
                                        (rapido(Daisy))
                                        (alerta(Rocky))))
                             (Chihuahua (
                                        (pequeno(Tiny))
                                        (valiente(Spike))
                                        (leal(Chip))
                                        (energetico(Fifi)))
										
							 )))

