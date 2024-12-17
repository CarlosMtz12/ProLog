
% hechos
hombre(carlos).
hombre(tesoro).
hombre(jorge).
hombre(julio).
hombre(antonio).
hombre(roberto).
hombre(miguelangel).

mujer(maria).
mujer(madelein).
mujer(sandra).
mujer(gloria).
mujer(emily).
mujer(gisell).

padre(antonio,carlos).
padre(jorge,madelein).
padre(jorge,sandra).
padre(miguelangel,roberto).
padre(miguelangel,julio).

madre(madelein,tesoro).
madre(madelein,carlos).
madre(maria,madelein).
madre(maria,sandra).
madre(sandra,emily).
madre(sandra,gisell).

esposos(antonio,madelein).
esposos(julio,sandra).
esposos(jorge,maria).

% Regla para abuelos
abuelo(X, Y) :- padre(X, Z), padres(Z, Y).
abuela(X, Y) :- madre(X, Z), padres(Z, Y).

% Regla para padres 
padres(X, Y) :- padre(X, Y); madre(X, Y).

% Regla modificada para hermanos
hermanos(X, Y) :- (padre(Z, X), padre(Z, Y); madre(W, X), madre(W, Y)), X \= Y.

% Regla para primos
primos(X, Y) :- padres(A, X), padres(B, Y), hermanos(A, B).

% Relación de cuñados
cunado(X, Y) :- esposos(X, Z), hermanos(Z, Y). 
cunado(X, Y) :- esposos(Y, Z), hermanos(Z, X). 

% Relación de tíos y tías (incluyendo cónyuges)
tio(X, Y) :- hermanos(X, Z), padres(Z, Y), hombre(X).          
tio(X, Y) :- esposos(X, W), tia(W, Y).                         
tia(X, Y) :- hermanos(X, Z), padres(Z, Y), mujer(X).           
tia(X, Y) :- esposos(X, W), tio(W, Y).                         

% sobrinos
sobrino(X, Y) :- tio(Y, X), hombre(X).
sobrino(X, Y) :- tia(Y, X), hombre(X).
sobrina(X, Y) :- tio(Y, X), mujer(X).
sobrina(X, Y) :- tia(Y, X), mujer(X).

% Nietos
nieto(X, Y) :- abuelo(Y, X), hombre(X).
nieto(X, Y) :- abuela(Y, X), hombre(X).
nieta(X, Y) :- abuelo(Y, X), mujer(X).
nieta(X, Y) :- abuela(Y, X), mujer(X).

% Hijos
hijo(X, Y) :- padre(Y, X), hombre(X).
hijo(X, Y) :- madre(Y, X), hombre(X).
hija(X, Y) :- padre(Y, X), mujer(X).
hija(X, Y) :- madre(Y, X), mujer(X).