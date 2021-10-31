clear all
%question 1 :
% la méthode donnees = readmatrix('PopUSA.txt') ne marchait pas.
donnees = [
1790   3929214;
1800   5236631;
1810   7239881;  % commentaire
1820   9638453;
1830   12866020;
1840   17069453;
1850   23191876;
1860   31443321;
1870   38558371;
1880   49371340;
1890   62979766;
1900   76212168;
1910   92228531;
1920   106021568;
1930   123202660;
1940   132165129;
1950   151325798;
1960   179323175;
1970   203211926;
1980   226545805;
1990   248709873;
2000   281421906;
2010   308745538;
2020   331449281];
T_donnees=donnees(:,1)'; % ça donne les données de la colonne 1 c-à-d le temps.
N_donnees=donnees(:,2)'; % ça donne les données de la colonne   2 c-à-d la population dans ce temps.
figure(1) 
clf % clf nous aide à supprimer les figures précédentes et quand j'exécute j'obtiens que ma figure.
plot(T_donnees,N_donnees,'*-') % ça sert à tracer la courbe N_donnees en fonction de T_donnees.
xlabel('L années')  % les x de la representation graphique (çe les donne un nom dans la figure).
ylabel('Taille de la Population')  % les y de la representation graphique (çe les donne un nom dans la figure).
title('Croissance de la population USA entre 1790 et 2010')  % ça sert à donner un titre au graphe
legend('taille de la population') % ça nous aide plutôt quand on a deux courbes au même temps (pour lesdifférencier).

figure(2) 
clf  
semilogy(T_donnees,N_donnees,'r*-') % équivant à utiliser plot et mettre log(N_donnees) dedans. 
xlabel('Année')  
ylabel('log(N donnees)') 
title('Représentation en échelle logarithmique')
legend('log de donnees')
% %%%%%%%%% question 2 :
% %%%% a :
% @ : function handle (autre syntaxe);
S=@(R,N0) sum (abs(N_donnees-R.^T_donnees*N0).^2); 
S(1,2)
% Nt=R^t*N0 ==> ln(Nt)=tln(R)+ln(N0) ==>
n_donnees = log(N_donnees);
S_log = @(r,N0) sum(abs(n_donnees-N0-r.*T_donnees).^2);
grad_S_log = @(r,N0) [-2*sum(n_donnees-N0-r*T_donnees);...
    -2*sum(T_data.*(n_donnees-N0-r.*T_donnees))];

A = [length(n_donnees), sum(T_donnees); sum(T_donnees), sum(T_donnees.^2)];
b = [sum(n_donnees); sum(T_donnees.*n_donnees)];
X = [1;2];
A*X\b;
X = (A\b)
Y = exp(X)
%pour afficher le N0 on fait format long et en dessous Y
format long 
Y;
% %%%% c  :
N0=Y(1);
r= Y(2);
N_T = N0*r.^(T_donnees); % calcul le taille de la population au temps T_donnees.
%%%%%%%%%%%%%%%%%

% hold on sert à tracer 2 courbes au même temps ET ça nous aide à comparer les données observées et
% les données calculée.
figure(3)
clf
hold on 
plot(T_donnees,N_donnees)
plot(T_donnees,N_T)
xlabel('Année(temps)') 
ylabel('nombre individus') 
title('Représentation en échelle logarithmique')
legend('taille de la population observée','taille de la population calculées')
hold off
