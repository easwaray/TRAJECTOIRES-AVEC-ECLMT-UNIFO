fileID = fopen('Choix_valeurs.txt');
C = textscan(fileID,'%s','CommentStyle','//');
fclose(fileID);


filename = 'Clip_BWB08.csv'; %Fichier CFD donnant l'écoulement
B = csvread('surface_BWB.csv',1,0); % Surface de travail
BWB=alphaShape(B(:,24), B(:,25), B(:,26),2);
method = C{1}{26}; % Méthode d'interpolation pour les vitesses
X_Plan =str2num(C{1}{27}); %Abscisse (m) du plan de normale x dans lequel on veut visualiser l'intersection avec les trajectoires
if X_Plan<0
    disp('la valeur de X_Plan doit être positive');
    return;
end
%temps de simulation
tmax=str2num(C{1}{28});
if tmax<0
    disp('la valeur du temps de simulation doit être positive');
    return;
end
%pas de temps
deltat=str2num(C{1}{29});
if deltat<0
    disp('la valeur du pas de temps doit être positive');
    return;
end
g=str2num(C{1}{30}); %gravité
if g<0
    disp('la valeur de g doit être positive');
    return;
end
rhoShimoi=str2num(C{1}{31}); % masse vol de la glace kg/m^3 annoncee par Koji Shimoi
if rhoShimoi<0
    disp('la valeur de rhoShimoi doit être positive');
    return; 
end    
rhoPlastique=str2num(C{1}{32}); % masse volumique du plastique(kg/m^3)
if rhoPlastique<0
    disp('la valeur de rhoPlastique doit être positive');
    return; 
end    
%%constante pour une sphere
dsp=str2num(C{1}{33}) ;% diametre
if dsp<0
    disp('la valeur du diamètre de la sphère doit être positive');
    return; 
end    
muair=str2num(C{1}{34}); % viscosite de l'air
if muair<0
    disp('la valeur de muair doit être positive');
    return; 
end   
rhoair= str2num(C{1}{35}); %Rho2D(filename, x(1),x(3),method); % densite de l'air (kg/m^3)
if rhoair<0
    disp('la valeur de rhoair doit être positive');
    return;
end


