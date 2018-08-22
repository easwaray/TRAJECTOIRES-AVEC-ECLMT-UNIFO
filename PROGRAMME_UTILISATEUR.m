fileID = fopen('Choix_valeurs.txt');
C = textscan(fileID,'%s %n %n %n %n','Delimiter',',','CommentStyle','//');
fclose(fileID);

r=str2num(C{1}{1});
if r==1
    run('Trace_BWB_plaque.m')
    run('principal_aleatoire_plaque.m')
    
elseif r==0
    run('Trace_BWB_sphere.m')
    run('principal_aleatoire_sphere.m')
   
end    