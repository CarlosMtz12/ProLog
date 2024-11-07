%1 FUNCION "MEMBER" 

%frutas([manzana, banana, naranja, uva, pera, fresa]).


%buscar_fruta(Fruta) :-
%   frutas(ListaDeFrutas),  
%  (member(Fruta, ListaDeFrutas) -> true ; false).





% 2 FUNCION "SELECT"selecciona un elemento de la lista y devuelve la lista restante sin ese elemento.
frutas([manzana, banana, naranja, uva, pera, fresa]).

 
buscar_fruta(Fruta) :-
    frutas(ListaDeFrutas), 
    (select(Fruta, ListaDeFrutas, _) -> true ; false).
