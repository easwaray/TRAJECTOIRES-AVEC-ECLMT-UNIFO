function  [Fz_sp] = ForceZ_sphere(Vf,vyf, Wf,rhoair,muair,u,v,w,dsp,alpha)

% Équations statique et de traînée de la sphère
% Calcul de la force selon Z
% la traînée est parallèle à la vitesse relative
% la portance est perpendiculaire à la vitesse relative
%g=9.81 m/s²


% calcul de la vitesse relative 
vrel=sqrt((Vf-u).^2 + (vyf-v).^2 + (Wf-w).^2 );

% calcul du nombre de Reynolds
Re=rhoair*dsp*vrel/muair;

% calcul des coefficients de traînée et de portance
Cd = CD_sphere(Re);
Cl = 0.0d0;

%Calcul de la force dans la direction z l'angle du vent relatif est pris en
%compte, alpha et betha sont les angles du vent relatif
Afront= pi*dsp.^2/4.0;
Fz_sp= 0.5*rhoair*Afront*vrel.^2.0*(Cd*sind(alpha));

end
