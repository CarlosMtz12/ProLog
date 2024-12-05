% EJERCICIO 1

guardian(apolo).
guardian(hecate).
guardian(ares).
guardian(hermes).

templo(fuego).
templo(agua).
templo(tierra).
templo(aire).

% Restricciones (quién no puede cuidar qué templo)
no_guarda(apolo, aire).
no_guarda(hecate, fuego).
no_guarda(hecate, aire).
no_guarda(ares, agua).
no_guarda(ares, aire).
no_guarda(hermes, tierra).

% Regla: Un guardián guarda un templo si no está restringido por "no_guarda"
guarda_templo(Guardian, Templo) :-
    guardian(Guardian),
    templo(Templo),
    \+ no_guarda(Guardian, Templo).

% Regla para asignar cada guardián a un único templo
asignar_guardianes(Asignaciones) :-
    findall((Guardian, Templo), guarda_templo(Guardian, Templo), Posibles),
    agrupar_guardianes(Posibles, Asignaciones).

% Agrupar para que cada guardián tenga exactamente un templo asignado
agrupar_guardianes(Posibles, Asignaciones) :-
    setof(Guardian, Templo^(member((Guardian, Templo), Posibles)), Guardianes),
    asignar_unico(Guardianes, Posibles, [], Asignaciones).

% Asignar a cada guardián un único templo
asignar_unico([], _, Asignaciones, Asignaciones).
asignar_unico([G|Guardianes], Posibles, Parcial, Asignaciones) :-
    member((G, T), Posibles),
    \+ member((_, T), Parcial),
    asignar_unico(Guardianes, Posibles, [(G, T)|Parcial], Asignaciones).






?- asignar_guardianes(Asignaciones).




% EJERCICIO 2-----------------------------------------------------------------------------------------------------------------------------------------------------------

% Hechos: Héroes y Armas
heroe(aquiles).
heroe(perseo).
heroe(hercules).
heroe(teseo).

arma(espada).
arma(lanza).
arma(arco).
arma(escudo).

% Restricciones (quién no puede usar qué arma)
no_usa(aquiles, escudo).
no_usa(aquiles, arco).
no_usa(perseo, espada).
no_usa(hercules, lanza).
no_usa(hercules, escudo).
no_usa(teseo, arco).
no_usa(teseo, escudo).

% Regla: Un héroe puede usar un arma si no está restringido
usa_arma(Heroe, Arma) :-
    heroe(Heroe),
    arma(Arma),
    \+ no_usa(Heroe, Arma).

% Regla para asignar cada héroe a una única arma
asignar_armas(Asignaciones) :-
    findall((Heroe, Arma), usa_arma(Heroe, Arma), Posibles),
    agrupar_heroes(Posibles, Asignaciones).

% Agrupar para que cada héroe tenga exactamente un arma asignada
agrupar_heroes(Posibles, Asignaciones) :-
    setof(Heroe, Arma^(member((Heroe, Arma), Posibles)), Heroes),
    asignar_unico(Heroes, Posibles, [], Asignaciones).

% Asignar a cada héroe un único arma
asignar_unico([], _, Asignaciones, Asignaciones).
asignar_unico([H|Heroes], Posibles, Parcial, Asignaciones) :-
    member((H, A), Posibles),
    \+ member((_, A), Parcial),
    asignar_unico(Heroes, Posibles, [(H, A)|Parcial], Asignaciones).







?- asignar_armas(Asignaciones).




% EJERCICIO 3-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

% Titanes y Gemas
titan(cronos).
titan(oceano).
titan(hiperion).
titan(japeto).

gema(zafiro).
gema(rubi).
gema(esmeralda).
gema(diamante).

% Restricciones (quién no puede tener qué gema)
no_tiene(cronos, zafiro).
no_tiene(cronos, diamante).
no_tiene(oceano, rubi).
no_tiene(hiperion, diamante).
no_tiene(hiperion, esmeralda).
no_tiene(japeto, rubi).
no_tiene(japeto, esmeralda).

% Regla: Un titán puede tener una gema si no está restringido
tiene_gema(Titan, Gema) :-
    titan(Titan),
    gema(Gema),
    \+ no_tiene(Titan, Gema).

% Regla para asignar cada titán a una única gema
asignar_gemas(Asignaciones) :-
    findall((Titan, Gema), tiene_gema(Titan, Gema), Posibles),
    agrupar_titanes(Posibles, Asignaciones).

% Agrupar 
agrupar_titanes(Posibles, Asignaciones) :-
    setof(Titan, Gema^(member((Titan, Gema), Posibles)), Titanes),
    asignar_unico(Titanes, Posibles, [], Asignaciones).

% Asignar a cada titán una única gema
asignar_unico([], _, Asignaciones, Asignaciones).
asignar_unico([T|Titanes], Posibles, Parcial, Asignaciones) :-
    member((T, G), Posibles),
    \+ member((_, G), Parcial),
    asignar_unico(Titanes, Posibles, [(T, G)|Parcial], Asignaciones).








asignar_gemas(Asignaciones).



