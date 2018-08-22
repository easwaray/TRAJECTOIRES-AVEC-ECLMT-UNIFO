fileID = fopen('Choix_valeurs.txt');
C = textscan(fileID,'%s','CommentStyle','//');
fclose(fileID);


filename='Clip_BWB08.csv'; %Fichier CFD contenant les données de l'écoulement
B = csvread('Surface_BWB.csv',1,0); %Fichier contenant les coordonnées des points de la surface de l'avion
BWB=alphaShape(B(:,24), B(:,25), B(:,26),2); %Définition de l'AlphaShape 
method = C{1}{2}; %linear, nearest ou natural. Méthode pour l'interpolation des vitesses
choix_moment = str2num(C{1}{3}) ; % 1 : Richards; 2 : Tachikawa
SR=str2num(C{1}{4}); %1,2 Surface Ratio de la plaque
if SR<0
    disp('la valeur de SR doit être positive');
    return; 
end
L=str2num(C{1}{5});  % Longueur de la plaque (m)
if L<0
    disp('la valeur de L doit être positive');
    return; 
end
l=L/SR ; %Largeur de la plaque (m), calculée automatiquement avec le SR    
e=str2num(C{1}{6}); %épaisseur de la plaque (m)
if e<0
    disp('la valeur de e doit être positive');
    return; 
end
g=str2num(C{1}{7});  %gravité (m/s2)
if g<0
    disp('la valeur de g doit être positive');
    return; 
end
rhoShimoi=str2num(C{1}{8}); %masse volumique de la glace (kg/m3)
if rhoShimoi<0
    disp('la valeur de rhoShimoi doit être positive');
    return; 
end
mass=rhoShimoi*L*l*e; %masse de la plaque (kg)
rhoair=str2num(C{1}{9}); %masse volumique de l'air (kg/m3)
if rhoair<0
    disp('la valeur de rhoair doit être positive');
    return;
end
X_Plan=str2num(C{1}{10}); %Abscisse (m) du plan de normale x dans lequel on veut visualiser l'intersection avec les trajectoires
if X_Plan<0
    disp('la valeur de X_Plan doit être positive');
    return;
end    
%temps de simulation
tmax=str2num(C{1}{11});
if tmax<0
    disp('la valeur du temps de simulation doit être positive');
    return;
end
%nous forçons l'écriture à un intervalle deltat pas de temps
deltat=str2num(C{1}{12});
if deltat<0
    disp('la valeur du pas de temps doit être positive');
    return;
end

%calcul de la matrice d'inertie de la plaque  
Ixx=1/12*mass*(l^2+e^2);
Iyy=1/12*mass*(L^2+e^2);
Izz=1/12*mass*(l^2+L^2);
Iplate=diag([Ixx; Iyy; Izz]); % matrice d'inertie de la plaque
invIplate=inv(Iplate);  % inverse de la matrice d'inertie

% Choix de la base de donnée de Richards pour avoir le CN correspondant au SR choisi
if SR == 1
    data_CN = importdata('sr1.txt');
elseif SR==2
    data_CN = importdata('sr2.txt');
elseif SR == 4
    data_CN = importdata('sr4.txt');
end

alp = data_CN(:,1); % angle d'attaque de l'écoulement
bet = data_CN(:,3); % angle d'inclinaison de l'écoulement 

Cn = data_CN(:,2);
Vq = scatteredInterpolant(alp,bet,Cn); %interpolant du CN