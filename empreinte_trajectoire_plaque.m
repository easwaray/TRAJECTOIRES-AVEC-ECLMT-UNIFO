function [Print]= empreinte_trajectoire_plaque(X,Y,Z,X_plan)
%Fonction qui renvoie les coordonn�es (Y_Print,Z_Print) du point d'intersection entre
%la trajectoire d�finie par les points contenus dans [X Y Z] et le plan de normale x positionn� � l'abscisse X_plan

A=find(X<X_plan);

if size(A,1)==size(X,1) %taille des points X (tq X<X_plan) = taille de la trajectoire 
    Print='NaN'
elseif size(A,1)==0 %aucun point X (tq X<X_plan), le plan est donc en amont de l'avion
    Print='NaN'
else
B=max(A);
Y_Print = ((Y(B+1)-Y(B))/(X(B+1)-X(B)))*(X_plan-X(B))+Y(B); %Calcul via l'�quation de la tangente au point le plus proche du plan
Z_Print = ((Z(B+1)-Z(B))/(X(B+1)-X(B)))*(X_plan-X(B))+Z(B);
Print = [Y_Print, Z_Print]
end

end
