depart :- 
    deviner(Langage),
    write('Le langage devine est : '),
    write(Langage),
    nl,
    undo.

deviner(c) :- c, !.
deviner(python) :- python, !.
deviner(prolog) :- prolog, !.
deviner(javascript) :- javascript, !.
deviner(html) :- html, !.
deviner(inconnu).

c :- 
    compile, 
    ancien, 
    multiplateforme,
    backend,
    verifier(est_le_doyen_de_beaucoup_de_langages).

python :- 
    interprete,
    ancien,
    facile,
    backend.

prolog :- 
    (compile;
    interprete),
    ancien,
    multiplateforme,
    backend,
    verifier(branche_sur_le_processeur).

javascript :-
    interprete,
    ancien,
    web,
    backend.


html :-
    interprete; balise,
    web,
    frontend,
    facile.

:- dynamic oui/1, non/1.

compile :- verifier(utilise_compilateur).
interprete :- verifier(est_interprete).
balise :- verifier(est_balise).
ancien :- verifier(est_ancien).
web :- verifier(est_un_langage_web).
backend :- verifier(est_back_end).
frontend :- verifier(est_front_end).
facile :- verifier(repute_comme_facile).
multiplateforme :- verifier(est_multiplateforme).

demander(Question) :-
    write('Le langage '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == oui ; Response == o)
      ->
       assert(oui(Question)) ;
       assert(non(Question)), fail).

verifier(X) :- (oui(X) -> true; (non(X), fail; demander(X))).

undo :- retract(oui(_)),fail. 
undo :- retract(non(_)),fail.
undo.