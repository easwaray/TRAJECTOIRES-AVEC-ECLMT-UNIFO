function [x, y, z]=angles_euler(q1,q2,q3,q4) %conversion des angles quaternions en angles d'Euler
        %calcule theta en radian
        y= asin(-2.*(q2.*q4-q1.*q3));
        %calcule psi en radian
        x= acos((q1.^2+q2.^2-q3.^2-q4.^2)./cos(y)).*sign(2.*(q2.*q3+q1.*q4));
        %calcule phi en radian
        z= acos((q1.^2-q2.^2-q3.^2+q4.^2)./cos(y)).*sign(2.*(q3.*q4+q1.*q2));
end

