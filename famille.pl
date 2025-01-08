% Faits suppl�mentaires
homme(alex).
homme(henri).
femme(claire).
femme(anne).
parent(alex, marie).  % faits suppl�mentaires pour les r�gles de cousins
parent(claire, marie).
parent(henri, sophie).
parent(anne, sophie).
parent(marc, alex).
parent(jacques, claire).


% R�gles
p�re(X, Y) :- homme(X), parent(X, Y).
m�re(X, Y) :- femme(X), parent(X, Y).
grand_parent(X, Y) :- parent(X, Z), parent(Z, Y).
% R�gle pour les fr�res et s�urs
frere_soeur(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

ma_liste([pierre, marie, paul]).
[T�te | Queue] = [pierre, marie, paul].
longueur([], 0).  % La longueur d'une liste vide est 0
longueur([_ | Queue], N) :- longueur(Queue, N1), N is N1 + 1.
appartient(X, [X | _]).  % L'�l�ment X est dans la t�te de la liste
appartient(X, [_ | Queue]) :- appartient(X, Queue).  % Sinon, cherche dans la queue

oncle(X, Y) :- homme(X), frere_soeur(X, Z), parent(Z, Y).
tante(X, Y) :- femme(X), frere_soeur(X, Z), parent(Z, Y).

frere_soeur(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
cousin(X, Y) :- parent(P1, X), parent(P2, Y), frere_soeur(P1, P2).
