# Interpolation-applied-on-images
In rezolvarea temei s-a urmarit implementarea a doi algoritmi
faimosi, Algebraic(Algebraic.m) si Iterative(Iterative.m).

Algoritmul Iterative deschide fisierul si citeste datele din el, linie 
cu linie si se contruieste matricea de adiacenta A,matricea K (matricea cu numarul de legaturi) 
si matrice M folosind o functie de calculare a inversei lui K (Inversa). Se calculeaza R(t) si R(t + 1)
folosind formulele date, pana cand un epsilon dat este mai mic decat norma
diferentei R(t + 1) si R(t). In cazul de fata, R(t) = R1 si R(t + 1) = R.

Algoritmul Algebraic contine aceleasi instructiuni pana la calcularea vectorilor
de PageRank (matricile A, K si M se calculeaza la fel ca la Iterative), diferenta regasindu-se
la finalul portiunii de cod, reprezentata de aplicarea formulei specifice pentru aflarea vectorului R.

Functia PR_Inv.m calculeaza inversa unei matrici folosind algoritmul Gram-Schmidt
(care descompune o matrice in Q si R) si rezolva sistemul superior triangulat de 
la laborator cu ajutorul functiei SST.m pentru aflarea inversei matricei R.

In functia PageRank.m, se creeaza fisierul de iesire in care se scriu pe rand numarul de noduri,
vectorul R1 rezultat in urma aplicarii agoritmului Iterative, vectorul R2 in urma aplicarii 
algoritmului Algebraic. Dupa toate acestea se sorteaza vectorul R2 in ordine descrescatoare
folosindu-se una dintre functiile predefinite de biblioteca Matlab/Octave si retinandu-se
intr-un vector si pozitiile initiale din vectorul nesortat. Dupa calcularea gradului de apartenenta,
apeland chiar functia Apartenenta.m, se introduc datele, pe rand, in fisierul de iesire, respectandu-se
formatul impus.
