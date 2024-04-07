depart :- 
    deviner(Langage),
    write('Le langage devine est : '),
    write(Langage),
    undo,
    nl.

deviner(prolog) :- prolog, !.
deviner(ruby) :- ruby, !.
deviner(java) :- java, !.
deviner(csharp) :- csharp, !.
deviner(cpp) :- cpp, !.
deviner(rust) :- rust, !.
deviner(python) :- python, !.
deviner(c) :- c, !.
deviner(sql) :- sql, !.
deviner(xml) :- xml, !.
deviner(css) :- css, !.
deviner(html) :- html, !.
deviner(kotlin) :- kotlin, !.
deviner(swift) :- swift, !.
deviner(inconnu).

prolog :-
    backend,
    algorithme,
    processeur.

ruby :-
    backend,
    algorithme,
    objet,
    modifiable.

java :-
    (backend, algorithme, objet, client_lourds, oracle); (frontend, mobile, android, ancien_android).

csharp :-
    backend,
    algorithme,
    objet,
    client_lourds,
    microsoft.

cpp :-
    backend,
    algorithme,
    objet,
    performant,
    ancien.

rust :-
    backend,
    algorithme,
    objet,
    performant,
    recent.

python :-
    backend,
    algorithme,
    facile.

c :-
    backend,
    algorithme,
    doyen.

sql :- 
    backend,
    bdd,
    non_balise.

xml :-
    backend,
    bdd,
    balise.

css :-
    frontend,
    web,
    style.

html :- 
    frontend,
    web,
    structure.

kotlin :-
    frontend,
    mobile,
    android,
    nouveau_android.

swift :-
    frontend,
    mobile,
    ios.

:- dynamic oui/1, non/1.

backend :- verifier(est_un_langage_backend).
frontend :- verifier(est_un_langage_frontend).
algorithme :- verifier(est_un_langage_algorithmique).
processeur :- verifier(est_branche_sur_le_processeur).
modifiable :- verifier(est_facilement_modifiable).
objet :- verifier(est_un_langage_objet).
doyen :- verifier(est_le_doyen_de_beaucoup_de_langages).
client_lourds :- verifier(est_utilise_pour_du_client_lourd).
performant :- verifier(est_considere_comme_performant).
facile :- verifier(est_facile_d_utilisation).
oracle :- verifier(a_ete_cree_par_oracle).
microsoft :- verifier(a_ete_cree_par_microsoft).
ancien :- verifier(est_un_langage_ancien).
recent :- verifier(est_un_langage_recent).
bdd :- verifier(est_un_langage_de_base_de_donnees).
balise :- verifier(est_un_langage_balise).
non_balise :- verifier(n_est_pas_un_langage_balise).
web :- verifier(est_un_langage_web).
style :- verifier(est_utilise_pour_du_style).
structure :- verifier(est_utiliser_pour_de_la_structure).
mobile :- verifier(est_utilise_pour_du_mobile).
android :- verifier(est_utilise_pour_android).
ios :- verifier(est_utilise_pour_ios).
ancien_android :- verifier(etait_utilise_avant_kotlin).
nouveau_android :- verifier(remplace_java_en_android).


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

% Si oui -> true, sinon on teste non, si oui -> fail (false), si non -> demander
verifier(X) :- 
    oui(X) -> true; 
    non(X) -> false;
    demander(X).

undo :- retract(oui(_)),fail.
undo :- retract(non(_)),fail.
undo.