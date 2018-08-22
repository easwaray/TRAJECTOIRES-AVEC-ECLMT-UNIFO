|**********************************************************|
|             SIMULATION DE TRAJECTOIRES 3D                |
|**********************************************************|

Bienvenue dans cette simulation de trajectoires 3D.
Ce programme vous permet de simuler une trajectoire 
déterminée, ou bien plusieurs aléatoires. Entrée : fichier 
texte "Choix_valeurs.txt", Sortie : figures de la trajectoire 
et de l'empreinte de la particule de glace sphérique ou sous 
forme de plaque plane. 

Se conférer au mémoire de maîtrise de M.Kévin IGNATOWICZ
"Simulation de trajectoires 3D de plaques planes avec
introduction d’un modèle de moment dynamique" dans lequel 
se trouvent des explications sur la physique de ce code de 
calcul, les hypothèses simplificatrices, et d'autres 
diverses précisions.

************************************************************

Pour utiliser ce code de calcul, vous aurez besoin du programme 
Matlab PROGRAMME_UTILISATEUR.m, ainsi que du document texte 
Choix_valeurs.txt. 

1ère étape : Ouvrir le document texte Choix_valeurs.txt et
suivre les indications. Le remplissage de ce document, 
permettra de choisir la géomètrie d'étude (plaque plane ou 
sphère), la mèthode d'interpolation des vitesses, le choix 
du modèle de moment (uniquement pour la plaque), diverses
données géométriques et physiques, le temps de simulation, 
le pas de temps, l'abscisse du plan de visualisation des 
traces, le nombre de trajectoires voulues (si vous désirez 
plusieurs trajectoires, celles-ci seront générées
aléatoirement), les conditions initiales (dans le cas d'une 
unique trajectoire), l'écoulement (soit un écoulement CFD, soir un écoulement uniforme)

2ème étape : Lancer le programme Matlab PROGRAMME_UTILISATEUR.m
Á noter que dans le cas d'un grand nombre de trajectoires 
(>100), l'execution du programme prend plusieurs heures.


Note important : Afin de vérifier le bon fonctionnement du 
programme, deux cas tests sont disponibles, un pour la 
plaque plane et un pour la sphère respectivement dans les 
dossiers "Cas test plaque" et "Cas test sphère".





