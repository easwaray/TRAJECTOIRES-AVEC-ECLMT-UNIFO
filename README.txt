|**********************************************************|
|             SIMULATION DE TRAJECTOIRES 3D                |
|**********************************************************|

Bienvenue dans cette simulation de trajectoires 3D.
Ce programme vous permet de simuler une trajectoire 
d�termin�e, ou bien plusieurs al�atoires. Entr�e : fichier 
texte "Choix_valeurs.txt", Sortie : figures de la trajectoire 
et de l'empreinte de la particule de glace sph�rique ou sous 
forme de plaque plane. 

Se conf�rer au m�moire de ma�trise de M.K�vin IGNATOWICZ
"Simulation de trajectoires 3D de plaques planes avec
introduction d�un mod�le de moment dynamique" dans lequel 
se trouvent des explications sur la physique de ce code de 
calcul, les hypoth�ses simplificatrices, et d'autres 
diverses pr�cisions.

************************************************************

Pour utiliser ce code de calcul, vous aurez besoin du programme 
Matlab PROGRAMME_UTILISATEUR.m, ainsi que du document texte 
Choix_valeurs.txt. 

1�re �tape : Ouvrir le document texte Choix_valeurs.txt et
suivre les indications. Le remplissage de ce document, 
permettra de choisir la g�om�trie d'�tude (plaque plane ou 
sph�re), la m�thode d'interpolation des vitesses, le choix 
du mod�le de moment (uniquement pour la plaque), diverses
donn�es g�om�triques et physiques, le temps de simulation, 
le pas de temps, l'abscisse du plan de visualisation des 
traces, le nombre de trajectoires voulues (si vous d�sirez 
plusieurs trajectoires, celles-ci seront g�n�r�es
al�atoirement), les conditions initiales (dans le cas d'une 
unique trajectoire), l'�coulement (soit un �coulement CFD, soir un �coulement uniforme)

2�me �tape : Lancer le programme Matlab PROGRAMME_UTILISATEUR.m
� noter que dans le cas d'un grand nombre de trajectoires 
(>100), l'execution du programme prend plusieurs heures.


Note important : Afin de v�rifier le bon fonctionnement du 
programme, deux cas tests sont disponibles, un pour la 
plaque plane et un pour la sph�re respectivement dans les 
dossiers "Cas test plaque" et "Cas test sph�re".





