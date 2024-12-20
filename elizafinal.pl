% Carlos Fabricio Martinez Martinez 21120230 
% Eliza
% Instituto Tecnologico de Morelia 
% Ing. Sistemas Computacionales

eliza:-	writeln('Hola , mi nombre es  Eliza tu amigo,
	por favor ingresa tu consulta,
	usar solo minúsculas sin . al final:'),
	readln(Input),
	eliza(Input),!.
eliza(Input):- Input == ['Adios'],
	writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['Adios', '.'],
	writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input) :-
	template(Stim, Resp, IndStim),
	match(Stim, Input),
	% si he llegado aquí es que he
	% hallado el template correcto:
	replace0(IndStim, Input, 0, Resp, R),
	writeln(R),
	readln(Input1),
	eliza(Input1), !.


template([hola, mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [4]).
template([buendia, mi, nombre, es, s(_), '.'], ['buen dia', 'Como', estas, tu, 0, '?'], [4]).


template([hola, ',', mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [5]).
template([buendia, ',', mi, nombre, es, s(_), '.'], ['Buendia', 'Como', estas, tu, 0, '?'], [5]).


template([hola, _], ['Hola', 'como', estas, tu, '?'], []).
template([buendia, _], ['Buendia', 'Como', estas, tu, '?'], []).



template([yo, s(_), yo, soy, s(_),'.'], [por, que, 0, eres, 1, '?'], [1, 4]).
template([yo, s(_), tu, '.'], [why, do, you, 0, me ,'?'], [1]).
template([yo, soy, s(_),'.'], [porque, eres, tu, 0, '?'], [2]).


% pregunta algo que le gusta a eliza

template([te, gustan, las, s(_), _], [flagLike], [3]).
template([te, gustan, los, s(_), _], [flagLike], [3]).

template([que, te, gusta, s(_), _], [flagquemegusta], [3]).

template([que, te, da, miedo,  s(_), _], [flagmiedos], [4]).


		 % pregunta algo que hace eliza
template([tu, eres, s(_), _], [flagDo], [2]).
% pregunta algo que es eliza
template([que, eres, tu, s(_)], [flagIs], [2]).
template([eres, s(_), '?'], [flagIs], [2]).


template([como, estas, tu, '?'], [yo, estoy, bien, ',', gracias, por, preguntar, '.'], []).



% templates por defecto que se agregan 10 mas


template([hola, _], ['Hola', '!'], []).
template([buenos, dias], ['Buenos', 'dias', '!'], []).
template([que, tal], ['Todo', 'bien', ',', 'y', 'tu', '?'], []).
template([como, estas], ['Bien', ',', 'gracias', 'por', 'preguntar', '!'], []).
template([estoy, cansado], ['Espero', 'que', 'puedas', 'descansar', 'pronto', '!'], []).
template([necesito, ayuda], ['Claro', ',', 'en', 'que', 'puedo', 'ayudarte', '?'], []).
template([buenas, noches], ['Buenas', 'noches', '!', 'Que', 'tengas', 'un', 'buen', 'descanso', '!'], []).
template([tengo, una, pregunta], ['Por', 'supuesto', ',', 'cual', 'es', 'tu', 'pregunta', '?'], []).
template([que, dia, es, hoy], ['Hoy', 'es', '_', '!', 'Espero', 'que', 'lo', 'disfrutes', '!'], []).
template([me, siento, feliz], ['¡Que', 'bueno', 'escuchar', 'eso', '!', 'Disfruta', 'tu', 'dia', '!'], []).
template([esta, lloviendo], ['Si', ',', 'es', 'un', 'buen', 'dia', 'para', 'quedarse', 'en', 'casa', '.'], []).
template([te, quiero, decir, algo], ['Claro', ',', 'estoy', 'aqui', 'para', 'escucharte', '.'], []).
template([estoy, aburrido], ['Vamos', 'a', 'encontrar', 'algo', 'divertido', 'para', 'hacer', '!'], []).
template([quiero, aprender, algo, nuevo], ['Genial', '!', 'Que', 'te', 'gustaria', 'aprender', 'hoy', '?'], []).
template([buenas, tardes], ['Buenas', 'tardes', '!', 'Como', 'ha', 'ido', 'tu', 'dia', '?'], []).



template([yo, pienso, que, _], [bueno, esa, es, tu, opinion], []).
template([porque, _], [esa, no, es, una, buena, razon, '.'], []).
template([i, have, s(_), with, s(_), '.'], ['You', have, to, deal, with, your, 0, and, your, 1, in, a, mature, way, '.'], [2, 4]).
template([i, s(_),  _], [i, can, recommend, you, a, book, about, that, issue], []).
template([please, s(_), _], ['No', i, can, not, help, ',', i, am, just, a, machine], []). 
		 template([tell, me, a, s(_), _], ['No', i, can, not, ',', i, am, bad, at, that], []).






% Templates de familia
template([quien, es, el, padre, de, s(_)], [flagfather], [5]).
template([quien, es, la, madre, de, s(_)], [flagmother], [5]).
template([quienes, son, los, hermanos, de, s(_)], [flagsiblings], [5]).
template([quienes, son, los, primos, de, s(_)], [flagcousins], [5]).
template([quien, es, el, abuelo, de, s(_)], [flaggrandfather], [5]).
template([quien, es, la, abuela, de, s(_)], [flaggrandmother], [5]).
template([quienes, son, los, tios, de, s(_)], [flaguncles], [5]).
template([quienes, son, las, tias, de, s(_)], [flagaunts], [5]).
template([quienes, son, los, nietos, de, s(_)], [flaggrandsons], [5]).
template([quienes, son, las, nietas, de, s(_)], [flaggranddaughters], [5]).
template([quienes, son, los, hijos, de, s(_)], [flagson], [5]).
template([quienes, son, las, hijas, de, s(_)], [flagdaughter], [5]).




% templates de resolver pregunta de medicos 

template([resuelve, problema, de, medicos, y, hospitales], [flagResolveProblem], [5]).
template([cual, es, la, especialidad, de, s(Nombre)], [flagFindEspecialidadMedico], [5]).
template([cual, es, el, hospital, de, s(Nombre)], [flagFindHospitalMedico], [5]).
template([cual, es, el, equipo, medico, de, s(Nombre)], [flagFindEquipoMedico], [6]).
template([cual, es, el, interes, de, investigacion, de, s(Nombre)], [flagFindInteresInvestigacion], [7]).



% templates de mascotas akinator

template([todos, los, perros, de, la, raza, s(Raza)],[flagtodosperros],[6]).
template([tiene, s(Nombre), la, caracteristica, de, ser, s(Caracteristica)], [flagcaracteristicaespecifica], [1, 6]).
template([cuantos, perros, son, s(Caracteristica)], [flagcantidadperros], [3]).

template([que, perros, de, la, raza, s(Raza), son, s(Caracteristica)], [flagperrosderaza], [5, 7]).
template([existe, algun, perro, que, sea, s(Caracteristica)], [flagexisteperro], [5]).
template([cual, es, el, nombre, del, perro, que, es, s(Caracteristica)], [flagnombreperro], [8]).
template([que, perros, no, son, s(Caracteristica)], [flagnoson], [4]).
template([que, caracteristicas, tiene, la, raza, s(Raza)], [flagcaracteristicasderaza], [5]).
template([informacion, de, s(Nombre)], [flaginformacion], [2]).


				  



template(_, ['Please', explain, a, little, more, '.'], []). 







% aqui meto familia 

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



% Respuestas especificas
respuesta(flagfather, [S], R) :- padre(R, S).
respuesta(flagmother, [S], R) :- madre(R, S).
respuesta(flagsiblings, [S], R) :- findall(X, hermanos(S, X), R).
respuesta(flagcousins, [S], R) :- findall(X, primos(S, X), R).
respuesta(flaggrandfather, [S], R) :- abuelo(R, S).
respuesta(flaggrandmother, [S], R) :- abuela(R, S).
respuesta(flaguncles, [S], R) :- findall(X, tio(X, S), R).
respuesta(flagaunts, [S], R) :- findall(X, tia(X, S), R).
respuesta(flaggrandsons, [S], R) :- findall(X, nieto(X, S), R).
respuesta(flaggranddaughters, [S], R) :- findall(X, nieta(X, S), R).
respuesta(flagson, [S], R) :- hijo(S, R).
respuesta(flagdaughter, [S], R) :- hija(S, R).



% Bandera: Hijos (son)
flagson(Person, Son) :-
    hijo(Person, Son).

% Bandera: Hijas (daughter)
flagdaughter(Person, Daughter) :-
    hija(Person, Daughter).

% Derivar hijo/hija a partir de padre/madre
hijo(PadreOMadre, Hijo) :-
    padre(PadreOMadre, Hijo), hombre(Hijo).
hijo(PadreOMadre, Hijo) :-
    madre(PadreOMadre, Hijo), hombre(Hijo).
hija(PadreOMadre, Hija) :-
    padre(PadreOMadre, Hija), mujer(Hija).
hija(PadreOMadre, Hija) :-
    madre(PadreOMadre, Hija), mujer(Hija).


% aqui termina mi familia 





% Hehos mascotas de akinator

mascota(jugueton, labrador, buddy).
mascota(tranquilo, labrador, lucy).
mascota(cazador, labrador, spot).
mascota(enojon, labrador, max).

mascota(leal, husky, mailo).
mascota(inteligente, husky, ace).
mascota(amigable, husky, bella).
mascota(resistente, husky, apollo).

mascota(curioso, salchicha, oliver).
mascota(jugueton, salchicha, molly).
mascota(rastreador, salchicha, charlie).
mascota(amistoso, salchicha, sadie).

mascota(activo, dalmata, pongo).
mascota(valiente, dalmata, manchas).
mascota(rapido, dalmata, daisy).
mascota(alerta, dalmata, rocky).

mascota(pequeno, chihuahua, minimi).
mascota(nervioso, chihuahua, nerviosin).
mascota(dormilon, chihuahua, oski).
mascota(energetico, chihuahua, pirinola).


% A qui termiana Hehos mascotas de akinator





% Hechos iniciales
doctores([ana, bruno, carla, diego, elena]).
especialidades([cardiologia, neurologia, oncologia, pediatria, dermatologia]).
hospitales([general, regional, universitario, privado, militar]).
equipos([ecografo, resonancia, tomografo, dermatoscopio, electrocardiografo]).
intereses([genetica, farmacologia, inmunologia, bioetica, microbiologia]).

% Definición de permutacion/2
permutacion([], []).
permutacion(Lista, [Elemento|PermutacionResto]) :-
    select(Elemento, Lista, ListaSinElemento),
    permutacion(ListaSinElemento, PermutacionResto).

% Solución del problema
resolver(Resultado) :-
    % Definimos los atributos de cada doctor
    Resultado = [
        [ana, EspecialidadAna, HospitalAna, EquipoAna, InteresAna],
        [bruno, EspecialidadBruno, HospitalBruno, EquipoBruno, InteresBruno],
        [carla, EspecialidadCarla, HospitalCarla, EquipoCarla, InteresCarla],
        [diego, EspecialidadDiego, HospitalDiego, EquipoDiego, InteresDiego],
        [elena, EspecialidadElena, HospitalElena, EquipoElena, InteresElena]
    ],

    % Restricciones básicas
    especialidades(Especialidades), permutacion(Especialidades, [EspecialidadAna, EspecialidadBruno, EspecialidadCarla, EspecialidadDiego, EspecialidadElena]),
    hospitales(Hospitales), permutacion(Hospitales, [HospitalAna, HospitalBruno, HospitalCarla, HospitalDiego, HospitalElena]),
    equipos(Equipos), permutacion(Equipos, [EquipoAna, EquipoBruno, EquipoCarla, EquipoDiego, EquipoElena]),
    intereses(Intereses), permutacion(Intereses, [InteresAna, InteresBruno, InteresCarla, InteresDiego, InteresElena]),

    % Aplicamos las pistas
    % 1. Carla no trabaja en el Hospital General ni en el Privado, y no estudia neurología.
    HospitalCarla \= general, HospitalCarla \= privado, EspecialidadCarla \= neurologia,

    % 2. La persona que utiliza el electrocardiógrafo trabaja en cardiología en el Hospital Militar, pero no es Diego.
    member([_, cardiologia, militar, electrocardiografo, _], Resultado),
    not(member([diego, cardiologia, militar, electrocardiografo, _], Resultado)),

    % 3. Bruno está interesado en farmacología, pero no trabaja en el Hospital Regional ni en el Militar.
    InteresBruno = farmacologia, HospitalBruno \= regional, HospitalBruno \= militar,

    % 4. La persona que utiliza el ecógrafo trabaja en pediatría y no es del Hospital Universitario ni del Militar.
    member([_, pediatria, HospitalPediatria, ecografo, _], Resultado), HospitalPediatria \= universitario, HospitalPediatria \= militar,

    % 5. El especialista en oncología trabaja en el Hospital General y utiliza un tomógrafo.
    member([_, oncologia, general, tomografo, _], Resultado),

    % 6. El médico interesado en inmunología usa el resonador magnético, pero no es Elena.
    member([_, _, _, resonancia, inmunologia], Resultado), not(member([elena, _, _, resonancia, inmunologia], Resultado)),

    % 7. El médico del Hospital Regional se dedica a dermatología.
    member([_, dermatologia, regional, _, _], Resultado),

    % 8. Elena está interesada en bioética y no utiliza el electrocardiógrafo.
    InteresElena = bioetica, EquipoElena \= electrocardiografo,

    % 9. Diego es el experto en microbiología.
    InteresDiego = microbiologia,

    % 10. El médico del Hospital Universitario utiliza un dermatoscopio.
    member([_, _, universitario, dermatoscopio, _], Resultado).





elizaResolveProblem( R) :- resolver(Resultado),
                           R = ['Claro',  asi, se, organiza, el, hospital, Resultado].






% Lo que le gusta a eliza : flagLike
elizaLikes(X, R):- likes(X), R = ['Yeah', i, like, X].
elizaLikes(X, R):- \+likes(X), R = ['Nope', i, do, not, like, X].
likes(apples).
likes(ponies).
likes(zombies).
likes(manzanas).
likes(computadoras).
like(carros).



elizamiedos(_, R) :-
    findall(["Me da arto miedo ", Miedo], miedos(Miedo), Results), 
    flatten(Results, R).
miedos(prolog).
miedos(ecuaciones).
miedos(alcaraz).
miedos(programar).
miedos(mora).
miedos(chambear).

elizaquemegusta(_, R) :-
    findall(["A Eliza le gusta ", Gusto], likes(Gusto), Results), 
    flatten(Results, R).

elizatodosperros(Raza, R):- 
    findall(Nombre, mascota(_, Raza, Nombre), Nombres),
    (   Nombres \= [] % Verifica si la lista no está vacía
    ->  R = ['Si', estas, son, todos, los, perros, de, la, raza, Raza, ':', Nombres]
    ;   R = ['No', hay, perros, de, la, raza, Raza]
    ).

verifica_caracteristica(Nombre, Caracteristica, R):- 
    (   mascota(Caracteristica, _, Nombre)
    ->  R = ['Sí, ', Nombre, ' tiene la característica de ser ', Caracteristica]
    ;   R = ['No, ', Nombre, ' no tiene la característica de ser ', Caracteristica]).

cuenta_perros(Caracteristica, R):- 
    findall(Nombre, mascota(Caracteristica, _, Nombre), Perros),
    length(Perros, Cantidad),
    R = ['Hay ', Cantidad, ' perros que son ', Caracteristica].

lista_razas(R):- 
    setof(Raza, Caracteristica^Nombre^mascota(Caracteristica, Raza, Nombre), Razas),
    R = ['Las razas disponibles son: ', Razas].

perros_de_raza(Raza, Caracteristica, R):- 
    findall(Nombre, mascota(Caracteristica, Raza, Nombre), Nombres),
    R = ['Los perros de la raza ', Raza, ' que son ', Caracteristica, ' incluyen: ', Nombres].

existe_perro(Caracteristica, R):- 
    (   mascota(Caracteristica, _, _)
    ->  R = ['Sí, existe al menos un perro que es ', Caracteristica]
    ;   R = ['No, no existe ningún perro que sea ', Caracteristica]).

caracteristicas_de_raza(Raza, R):- 
    setof(Caracteristica, Nombre^mascota(Caracteristica, Raza, Nombre), Caracteristicas),
    R = ['Las características de la raza ', Raza, ' incluyen: ', Caracteristicas].

informacion_perro(Nombre, R):- 
    findall(Caracteristica-Raza, mascota(Caracteristica, Raza, Nombre), Informacion),
    R = ['La información de ', Nombre, ' incluye: ', Informacion].




% lo que hace eliza: flagDo
elizaDoes(X, R):- does(X), R = ['Yes', i, X, and, i, love, it].
elizaDoes(X, R):- \+does(X), R = ['No', i, do, not, X ,'.', it, is, too, hard, for, me].
does(study).
does(cook).
does(work).


% lo que es eliza: flagIs
elizaIs(X, R):- is0(X), R = ['Yes', yo, soy, X].
elizaIs(X, R):- \+is0(X), R = ['No', i, am, not, X].
is0(dumb).
is0(weird).
is0(nice).
is0(fine).
is0(happy).
is0(redundant).


match([],[]).
match([], _):- true.


match([S|Stim],[I|Input]) :-
	atom(S), % si I es un s(X) devuelve falso
	S == I,
	match(Stim, Input),!.


match([S|Stim],[_|Input]) :-
% I es un s(X), lo ignoro y continúo con el resto de la lista
	\+atom(S),
	match(Stim, Input),!.


replace0([], _, _, Resp, R):- append(Resp, [], R),!.


% Eliza likes:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagLike,
	elizaLikes(Atom, R).

% Reemplazo en la respuesta
replace0([], _, _, Resp, Resp).
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, _), % No es relevante el contenido del token aquí
    Resp = [flagquemegusta | _],
    elizaquemegusta(_, R), !.
 

% Reemplazo en la respuesta
replace0([], _, _, Resp, Resp).
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, _), % No es relevante el contenido del token aquí
    Resp = [flagmiedos | _],
    elizamiedos(_, R), !.

% Eliza does:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagDo,
	elizaDoes(Atom, R).





replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom), 
    nth0(0, Resp, X),
    X == flagtodosperros,
    elizatodosperros(Atom, R).


replace0([INombre, ICaracteristica|_], Input, _, Resp, R):-
    nth0(INombre, Input, AtomNombre),
    nth0(ICaracteristica, Input, AtomCaracteristica),
    nth0(0, Resp, X),
    X == flagcaracteristicaespecifica,
    verifica_caracteristica(AtomNombre, AtomCaracteristica, R).

replace0([ICaracteristica|_], Input, _, Resp, R):-
    nth0(ICaracteristica, Input, AtomCaracteristica),
    nth0(0, Resp, X),
    X == flagcantidadperros,
    cuenta_perros(AtomCaracteristica, R).

replace0([], _, _, Resp, R):-
    nth0(0, Resp, X),
    X == flagrazasdisponibles,
    lista_razas(R).

replace0([IRaza, ICaracteristica|_], Input, _, Resp, R):-
    nth0(IRaza, Input, AtomRaza),
    nth0(ICaracteristica, Input, AtomCaracteristica),
    nth0(0, Resp, X),
    X == flagperrosderaza,
    perros_de_raza(AtomRaza, AtomCaracteristica, R).

replace0([ICaracteristica|_], Input, _, Resp, R):-
    nth0(ICaracteristica, Input, AtomCaracteristica),
    nth0(0, Resp, X),
    X == flagexisteperro,
    existe_perro(AtomCaracteristica, R).

replace0([IRaza|_], Input, _, Resp, R):-
    nth0(IRaza, Input, AtomRaza),
    nth0(0, Resp, X),
    X == flagcaracteristicasderaza,
    caracteristicas_de_raza(AtomRaza, R).

replace0([INombre|_], Input, _, Resp, R):-
    nth0(INombre, Input, AtomNombre),
    nth0(0, Resp, X),
    X == flaginformacion,
    informacion_perro(AtomNombre, R).



% Manejo especifico para flagfather
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flagfather | _], 
    ( padre(Padre, Atom) -> 
        format(atom(R), 'El padre de ~w es ~w.', [Atom, Padre]) % Respuesta formateada
    ; 
        format(atom(R), 'Lo siento, no se quien es el padre de ~w.', [Atom]) % Caso donde no hay datos
    ), !.

% Manejo especifico para flagmother
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom), 
    Resp = [flagmother | _],
     ( madre(Madre, Atom) -> 
        format(atom(R), 'La madre de ~w es ~w.', [Atom, Madre]) % Respuesta formateada
    ; 
        format(atom(R), 'Lo siento, no se quien es la madre de ~w.', [Atom]) % Caso donde no hay datos
    ), !.

% Manejo especifico para hermanos
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom), % Obten el nombre de la persona
    Resp = [flagsiblings | _], 
    findall(Hermano, hermanos(Atom, Hermano), ListaHermanos), % Obten todos los hermanos
    ( ListaHermanos \= [] -> 
        atomic_list_concat(ListaHermanos, ', ', ListaHermanosStr), % Convierte la lista a cadena
        format(atom(R), 'Los hermanos de ~w son: ~w.', [Atom, ListaHermanosStr]) % Respuesta formateada
    ; 
        format(atom(R), 'Lo siento, no se quienes son los hermanos de ~w.', [Atom]) % Caso donde no hay datos
    ), !.

% Manejo especifico para primos
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom), % Obten el nombre de la persona
    Resp = [flagcousins | _], % Verifica que sea la bandera correcta
    findall(Primo, primos(Atom, Primo), ListaPrimos), % Obten todos los primos
    ( ListaPrimos \= [] -> 
        atomic_list_concat(ListaPrimos, ', ', ListaPrimosStr), % Convierte la lista a cadena
        format(atom(R), 'Los primos de ~w son: ~w.', [Atom, ListaPrimosStr]) % Respuesta formateada
    ; 
        format(atom(R), 'Lo siento, no se quienes son los primos de ~w.', [Atom]) % Caso donde no hay datos
    ), !.

% Manejo especifico para cada relacion
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flaggrandfather | _],
    ( abuelo(Abuelo, Atom) ->
        format(atom(R), 'El abuelo de ~w es ~w.', [Atom, Abuelo])
    ;
        format(atom(R), 'Lo siento, no se quien es el abuelo de ~w.', [Atom])
    ), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flaggrandmother | _],
    ( abuela(Abuela, Atom) ->
        format(atom(R), 'La abuela de ~w es ~w.', [Atom, Abuela])
    ;
        format(atom(R), 'Lo siento, no se quien es la abuela de ~w.', [Atom])
    ), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flaguncles | _],
    findall(Tio, tio(Tio, Atom), ListaTios),
    ( ListaTios \= [] ->
        atomic_list_concat(ListaTios, ', ', ListaTiosStr),
        format(atom(R), 'Los tios de ~w son: ~w.', [Atom, ListaTiosStr])
    ;
        format(atom(R), 'Lo siento, no se quienes son los tios de ~w.', [Atom])
    ), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flagaunts | _],
    findall(Tia, tia(Tia, Atom), ListaTias),
    ( ListaTias \= [] ->
        atomic_list_concat(ListaTias, ', ', ListaTiasStr),
        format(atom(R), 'Las tias de ~w son: ~w.', [Atom, ListaTiasStr])
    ;
        format(atom(R), 'Lo siento, no se quienes son las tias de ~w.', [Atom])
    ), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flaggrandsons | _],
    findall(Nieto, nieto(Nieto, Atom), ListaNietos),
    ( ListaNietos \= [] ->
        atomic_list_concat(ListaNietos, ', ', ListaNietosStr),
        format(atom(R), 'Los nietos de ~w son: ~w.', [Atom, ListaNietosStr])
    ;
        format(atom(R), 'Lo siento, no se quienes son los nietos de ~w.', [Atom])
    ), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flaggranddaughters | _],
    findall(Nieta, nieta(Nieta, Atom), ListaNietas),
    ( ListaNietas \= [] ->
        atomic_list_concat(ListaNietas, ', ', ListaNietasStr),
        format(atom(R), 'Las nietas de ~w son: ~w.', [Atom, ListaNietasStr])
    ;
        format(atom(R), 'Lo siento, no se quienes son las nietas de ~w.', [Atom])
    ), !.


replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flagson | _],
    findall(Son, flagson(Atom, Son), ListaHijos),
    ( ListaHijos \= [] ->
        atomic_list_concat(ListaHijos, ', ', ListaHijosStr),
        format(atom(R), 'Los hijos de ~w son: ~w.', [Atom, ListaHijosStr])
    ;
        format(atom(R), 'Lo siento, no se quienes son los hijos de ~w.', [Atom])
    ), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flagdaughter | _],
    findall(Daughter, flagdaughter(Atom, Daughter), ListaHijas),
    ( ListaHijas \= [] ->
        atomic_list_concat(ListaHijas, ', ', ListaHijasStr),
        format(atom(R), 'Las hijas de ~w son: ~w.', [Atom, ListaHijasStr])
    ;
        format(atom(R), 'Lo siento, no se quienes son las hijas de ~w.', [Atom])
    ), !.


replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flagmother | _], madre(Atom, R), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flagsiblings | _], findall(X, hermanos(Atom, X), R), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flagcousins | _], findall(X, primos(Atom, X), R), !.








replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Atom),
    nth0(0, Resp, X),   
    X == flagResolveProblem,
    elizaResolveProblem(R).

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Nombre),  
    nth0(0, Resp, X), 
    X == flagFindHospitalMedico,  
    resolver(Resultado),          
    (member([Nombre, _, Hospital, _, _], Resultado) -> 
        R = ['El hospital de', Nombre, 'es', Hospital]
    ;
        R = ['Lo siento, no encontre informacion para el medico llamado', Nombre]).

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Nombre),  
    nth0(0, Resp, X), 
    X == flagFindEspecialidadMedico,  
    resolver(Resultado),             
    (member([Nombre, Especialidad, _, _, _], Resultado) -> 
        R = ['La especialidad de', Nombre, 'es', Especialidad]
    ;   
        R = ['Lo siento, no encontre informacion sobre', Nombre]).

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Nombre),
    nth0(0, Resp, X),
    X == flagFindHospitalMedico, 
    resolver(Resultado),              
    (member([Nombre, _, Hospital, _, _], Resultado) -> 
        R = ['El hospital de', Nombre, 'es', Hospital]
    ;   
        R = ['Lo siento, no encontre informacion sobre', Nombre]).

% Encuentra el equipo medico del medico
replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Nombre),
    nth0(0, Resp, X), 
    X == flagFindEquipoMedico, 
    resolver(Resultado),              
    (member([Nombre, _, _, Equipo, _], Resultado) -> 
        R = ['El equipo medico de', Nombre, 'es', Equipo]
    ;   
        R = ['Lo siento, no encontre informacion sobre', Nombre]).

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Nombre),
    nth0(0, Resp, X), 
    X == flagFindInteresInvestigacion, 
    resolver(Resultado),              
    (member([Nombre, _, _, _, Interes], Resultado) -> 
        R = ['El interes de investigacion de', Nombre, 'es', Interes]
    ;   
        R = ['Lo siento, no encontre informacion sobre', Nombre]).











    % Eliza is:
    replace0([I|_], Input, _, Resp, R):-
        nth0(I, Input, Atom),
        nth0(0, Resp, X),
        X == flagIs,
        elizaIs(Atom, R).


replace0([I|Index], Input, N, Resp, R):-
	length(Index, M), M =:= 0,
	nth0(I, Input, Atom),
	select(N, Resp, Atom, R1), append(R1, [], R),!.


replace0([I|Index], Input, N, Resp, R):-
	nth0(I, Input, Atom),
	length(Index, M), M > 0,
	select(N, Resp, Atom, R1),
	N1 is N + 1,
	replace0(Index, Input, N1, R1, R),!.

