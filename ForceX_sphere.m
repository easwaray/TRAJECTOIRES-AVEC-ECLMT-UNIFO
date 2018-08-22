function  [Fx_sp] = ForceX_sphere(Vf,vyf,Wf,rhoair,muair,u,v,w,dsp,alpha,betha)

% Équations de traînée de la sphère
% Calcul de la force selon X
% la traînée est parallèle à la vitesse relative
% la portance est perpendiculaire à la vitesse relative

% calcul de la vitesse relative
vrel=sqrt((Vf-u).^2 + (vyf-v).^2 + (Wf-w).^2 );

% calcul du nombre de Reynolds
Re=rhoair*dsp*vrel/muair;

% calcul des coefficients de traînée et de portance
Cd = CD_sphere(Re);
Cl = 0.0d0;

%Calcul de la force dans la direction x l'angle du vent relatif est pris en
%compte, alpha et betha sont les angles du vent relatif
Afront= pi*dsp.^2/4.0;
if Vf-u==0
    a=1;
else a=sign(Vf-u);
end
Fx_sp= a*0.5*rhoair*Afront*vrel.^2.0*(Cd.*cosd(betha)*cosd(alpha));

end
