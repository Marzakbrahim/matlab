clear all
close all

%% Question 1 :
%Q1 : la matrice de Leslie A 
% A=[0        0.00102 0.08515 0.30574 0.40002 0.28061 0.15260 0.06420 0.01483 0.00089;
%    0.99670  0       0       0       0       0       0       0       0       0     ;
%    0        0.99837 0       0       0       0       0       0       0       0;
%    0        0       0.99780 0       0       0       0       0       0       0;
%    0        0       0       0.99672 0       0       0       0       0       0;
%    0        0       0       0       0.99607 0       0       0       0       0;
%    0        0       0       0       0       0.99472 0       0       0       0;
%    0        0       0       0       0       0       0.99240 0       0       0;
%    0        0       0       0       0       0       0       0.98867 0       0;
%    0        0       0       0       0       0       0       0       0.98274 0];


%%% ou on fait comme ça : 
F = [0, 0.00102, 0.08515, 0.30574, 0.40002, 0.28061, 0.15260, 0.06420, 0.01483, 0.00089]; % matrice de Fécondité
P = [0.99670, 0.99837, 0.99780, 0.99672, 0.99607, 0.99472, 0.99240, 0.98867, 0.98274]; % Matrice de Survie
A = [diag(P,-1)]; %  P est la sous diagonale et F  la première ligne de la Matrice de Leslie A
A(1,:) = F; %  matrice de Leslie A
%Question 2 : 

%eig(A) renvoie un vecteur colonne contenant les valeurs propres de la matrice carrée A.
% taux d'accroissement asymptotique est la valeur propre strictement supérieure en module à toutes les autres λ. 
taux1=max(abs(eig(A)));   %taux d'accroissement asymptotique
fprintf("Le taux d'accroissement asymptotique lambda1 de la population est : %d\n", taux1);


%Question 3 :
 lambda = maxk(abs(eig(A)),2); % affiche les deux plus grandes valeurs propres de A
taux2 = lambda(2);
rho = taux2/taux1; %vitesse de convergence à l'équilibre
fprintf("la vitesse de convergence à l’équilibre est : %d\n",rho); % ça m'a donné 7.684218e-01 : c'est proche de zéro


%Question 4 :

[W,D,V] = eig(A); %W=vecteur propre a droite,V=vectuer propre a gauche. 
Z=diag(D);
[m,i] = max(abs(Z));
W1 = W(:,i)/norm(W(:,i),1); %le vecteur propre est normalisé pour la norme 1
figure(4);
bar(W1);
xlabel('les tranches d’âge dans la population')
ylabel('la proportion')
title('Proportion de chaque tranche d ages dans la population');



%% Question 5 :
c1=V(:,i)'; %valeur reproductive
figure(2);
bar(c1);
xlabel('les tranches d’âge dans la population')
ylabel('les valeurs reproductives')


%% Question 6 :
PP=[prod(P)]; % ça sert à donner le produit d'éléments de p 
PP=cumprod(P); %cumprod premet d'utiliser le produit dans la formule qui donne R0 
R0=sum(F(1,2:end).*PP);% taux de reproduction
T=log(R0)/log(taux1);



%% Questions 7 et 8 :
S=(c1'*W1')/(c1*W1); % matrice de sensibilité

E=(1/taux1)*S.*A; % matrice d'élasticité
hold on
figure(3)
bar3(S)
bar(E)
legend('sensibilité','élasticité')
title('Sensibilité et Elasticité')
hold off


