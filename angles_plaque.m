function [alpha,beta] = angles_plaque(u,v,w, vf,vyf,wf) %calcule lesangles du vent relatif en degrés

%Calcul des composantes de la vitesse relative
urel=vf-u;
vyrel=vyf-v;
wrel=wf-w;

%Calcule la vitesse relative de la particule
vrel=sqrt(urel^2+vyrel^2+wrel^2);

%angles du vent relatif en degrés
alpha =asind(wrel/vrel);
beta = acosd(urel/(vrel*cosd(alpha)+1e-12));

end
