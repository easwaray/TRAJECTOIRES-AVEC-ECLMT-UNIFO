function [alpha,betha] = angles_sphere(u,v, w, vf,vyf, wf)
% Calcule la vitesse relative de la particule

% Composantes de la vitesse relative :
urel=vf-u;
vr= vyf-v; 
wrel=wf-w;

% Norme de la vitesse relative
vrel = sqrt(urel.^2+vr.^2+wrel.^2)

% angles du vent relatif en degres
alpha = asind(wrel/vrel); %angle d'attaque par rapport au plan XY
betha = asind(vr/(vrel*cosd(alpha)+1e-12));%angle d'inclinaison, par rapport au plan XZ

end
