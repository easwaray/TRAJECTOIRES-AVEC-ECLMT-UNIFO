variables_sphere;
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


s=str2num(C{1}{36});
if s<0
    disp('la valeur du nombre de trajectoires désirées doit être positive');
    return;
end
for i=1:s
    if s==1
        Xin=[str2num(C{1}{37}),str2num(C{1}{38}),str2num(C{1}{39}),str2num(C{1}{40}),str2num(C{1}{41}),str2num(C{1}{42}),str2num(C{1}{43}),str2num(C{1}{44})]; %[X0;u0;Y0;v0;Z0;w0;tetha0;omega0];
        
    elseif s~=1
        CI=Pt(randi(sz),:);
        VI=[-0.5*rand,0,sign(CI(3))*0.7];
        Xin=[CI(1),VI(1),CI(2),VI(2),CI(3)+0.001*sign(CI(3)),VI(3),0,0]
    end
    
principal_deterministe_sphere;
end