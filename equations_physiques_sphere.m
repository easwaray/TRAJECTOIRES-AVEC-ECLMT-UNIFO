function [dx] = equations_physiques_sphere (t,x);

variables_sphere;

% Masse de la sphere
mice=rhoShimoi*4./3.*pi*(dsp/2.)^3.;

% moment d'inertie pour une sphere
I=mice*2./5.*(dsp/2.)^2.;

% dérivées et variables
% x(1) = x
% x(2) = Vx=u
% x(3) = y
% x(4) = Vy=v
% x(5) = z
% x(6) = Vz=w
% x(7) = theta, the angle of the geometry in x,z coordinate
% x(8) = omega = dtheta/dt

% definition des composantes de la vitesse de l'écoulement
Vf = vitesse_sphere(x(1),x(3), x(5),1) ; % freestream  x velocity
vyf = vitesse_sphere(x(1),x(3),x(5),2) ; % freestream y velocity
Wf = vitesse_sphere(x(1),x(3),x(5),3)  ; % freestream z velocity

% angles du vent relatif relatif
[alpha1, betha1]=angles_sphere(x(2), x(4),x(6), Vf, vyf, Wf);

% force en X, sphere
FD =ForceX_sphere(Vf, vyf,Wf,rhoair,muair,x(2),x(4),x(6),dsp,alpha1, betha1);

% force en Y, sphere
FY = ForceY_sphere(Vf,vyf,Wf,rhoair,muair,x(2),x(4),x(6),dsp,alpha1, betha1);

% force en Z, sphere
FP = ForceZ_sphere(Vf,vyf,Wf,rhoair,muair,x(2),x(4),x(6),dsp,alpha1);

% Moment, sphere
Mt = 0.0d0;

% Trajectoire X
dx(1,1)=x(2);       %dx/dt=u     
dx(2,1)=FD/mice;      %du/dt=Fx/mice

%Trajectoire Y
dx(3,1)=x(4);
dx(4,1)=FY/mice;

% trajectoire Z
dx(5,1)=x(6);      %dz/dt=w       
dx(6,1)=FP/mice-g ;   %dw/dt=Fz/mice - g

% theta angle avec l'horizontale
dx(7,1)=x(8)*180/pi; %dtheta/dt=omega (theta en degré)     
dx(8,1)=(Mt/(I)); %% domega/dt=My/Iy


end



