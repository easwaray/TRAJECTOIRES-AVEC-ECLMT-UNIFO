function [ q1,q2,q3,q4 ] = quaternions( psi, theta, phi )
%Calcule les valeurs des quaternions q1, q2, q3, q4 à partir des angles d'Euler
%x(1)=q1, x(2)=q2, x(3)=q3, x(4)=q4
%D'après la publication de Suarez(Wichita)

q1=cos(phi/2.0)*cos(theta/2.0)*cos(psi/2)+sin(phi/2)*sin(theta/2)*sin(psi/2);
q2=cos(phi/2.0)*sin(theta/2.0)*sin(psi/2)-sin(phi/2)*cos(theta/2)*cos(psi/2);
q3=-cos(phi/2.0)*sin(theta/2.0)*cos(psi/2)-sin(phi/2)*cos(theta/2)*sin(psi/2);
q4=sin(phi/2.0)*sin(theta/2.0)*cos(psi/2)-cos(phi/2)*cos(theta/2)*sin(psi/2);    

end

