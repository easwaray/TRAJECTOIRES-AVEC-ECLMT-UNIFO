variables_plaque;
Srf=xlsread('AileBWB.xlsx');
Pt=[Srf(:,1),Srf(:,2),Srf(:,3)];
sz=size(Pt,1);

global Points_U Points_V Points_W Xin 

A = csvread(filename,1,0);
Pts = [A(:,24) A(:, 25) A(:, 26)]  ; % tableau des coordonnées des points du maillage
Mat_Vx =(A(:,2))./(A(:,1)); %vecteur colonne contenant les vitesses U en chaque point du maillage
Points_U = scatteredInterpolant(Pts, Mat_Vx, method); %interpolant de la vitesse U
Mat_Vy =(A(:,3))./(A(:,1)); %vecteur colonne contenant les vitesses V en chaque point du maillage
Points_V = scatteredInterpolant(Pts, Mat_Vy, method); %interpolant de la vitesse V
Mat_Vz =(A(:,4))./(A(:,1)); %vecteur colonne contenant les vitesses W en chaque point du maillage
Points_W = scatteredInterpolant(Pts, Mat_Vz, method); %interpolant de la vitesse W

%Génération des conditions aléatoires
q=str2num(C{1}{13});
if q<0
    disp('la valeur du nombre de trajectoires désirées doit être positive');
    return;
end
for i=1:q
    if q==1
        angles = [str2num(C{1}{14});str2num(C{1}{15});str2num(C{1}{16})]; %angles d'Euler initiaux (repère avion, rotations autour de z, y et x) en degrés
        [q10,q20,q30,q40]=quaternions(angles(1)*pi/180,-angles(2)*pi/180,-angles(3)*pi/180); %quaternions initiaux
        %Conditions initiales : [P0 Q0 R0 q10 q20 q30 q40  x0 u0  y0 v0 z0 w0 phi0 theta0 psi0]
        Xin=[str2num(C{1}{17}), str2num(C{1}{18}), str2num(C{1}{19}), q10, q20, q30, q40, str2num(C{1}{20}), str2num(C{1}{21}),  str2num(C{1}{22}), str2num(C{1}{23}), str2num(C{1}{24}), str2num(C{1}{25}), angles(1)*pi/180, -angles(2)*pi/180, -angles(3)*pi/180];
        
    elseif q~=1 
        CI=Pt(randi(sz),:);
        VI=[-0.7*rand,0,sign(CI(3))*0.7*rand];
        anglesI=[(rand-0.5)*randi(180),(rand-0.5)*randi(180),(rand-0.5)*randi(180)];
        [q1I,q2I,q3I,q4I]=quaternions(anglesI(1)*pi/180,-anglesI(2)*pi/180,-anglesI(3)*pi/180);
        Xin=[0,0,0,q1I,q2I,q3I,q4I,CI(1)+0.001*sign(CI(1)-17),VI(1),CI(2),VI(2),CI(3)+0.001*sign(CI(3)),VI(3),anglesI(1)*pi/180,-anglesI(2)*pi/180,-anglesI(3)*pi/180]
    end
    
principal_deterministe_plaque; % Appelle le main autant de fois que le nombre d'iterations
end