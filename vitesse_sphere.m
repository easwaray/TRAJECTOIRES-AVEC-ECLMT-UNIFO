function  [Uq] = vitesse_sphere(Xq, Yq, Zq, component) %fonction qui renvoie les composantes de vitesse aux points (Xq, Yq, Zq) connaissant les vitesses 
%aux points du maillage

global Points_U Points_V Points_W

fileID = fopen('Choix_valeurs.txt');
C = textscan(fileID,'%s %n %n %n %n','Delimiter',',','CommentStyle','//');
fclose(fileID);

o=str2num(C{1}{45});
if o==0

Vxq = Points_U(Xq, Yq, Zq); %Vitesse U interpolee au point (Xq, Yq, Zq)
Vyq = Points_V(Xq, Yq, Zq); %Vitesse V interpolee au point (Xq, Yq, Zq)
Vzq = Points_W(Xq, Yq, Zq); %Vitesse W interpolee au point (Xq, Yq, Zq)

V= [Vxq;Vyq;Vzq];

if component == 1
   Uq = V(1)
end
if component == 2 
   Uq = V(2)
end
if component == 3
   Uq = V(3)
end 

elseif o==1
Vxq = str2num(C{1}{46});
Vyq = str2num(C{1}{47});
Vzq = str2num(C{1}{48});

V= [Vxq;Vyq;Vzq];

if component == 1
   Uq = V(1)
end
if component == 2 
   Uq = V(2)
end
if component == 3
   Uq = V(3)
end 
end
end

