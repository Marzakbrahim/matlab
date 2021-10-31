clear all
close all

%Exo4

r=2.9;

%% Question 1
S=max(0,(r-1)/r); % On définit le point s de l'énoncé
L=[];  % on crée deux listes vides que l'on nomme L et K
K=[];
for r = 0.1:0.1:3; % on délimite les valeurs que peut prendre r.
    f=@ (x) r*x*(1-x); % on définit la fonction f 
    s=fzero(@(x) f(x)-x,0.5); % on cherche les points fixes de f
    L=[L,s]; 
    df=@(x) r*(1-2*x); % on définit la dérivée de f
    abs_deriv=(abs(df(s))<1); % on considère les valeurs qui vérifient /f'(s)/<1
    K=[K,abs_deriv];
    
    
end

%% Question 2
N0=0.9;
N1=N0;
r=2.9;
f=@ (x) r*x*(1-x);
e=abs(N0-f(N0));
t=1;
I=[]; % I donne les itérés de la suite Nt

while (t<30) && (e>10e-6) % on calcule les itérés de Nt jusqu'au premier temps t
    N0=N1;
    N1=f(N0);
    I=[I,N0];
    e=abs(N1-N0);
    t=t+1;
end

%On trace les figures souhaitées
hold on
figure(1)
plot(1:t-1,I)    % Nt en fonction de t 
plot(1:30,1:30)  % x=y
plot(I(1:1),I(1:1))
xlabel('x')
ylabel('y')
title('pour r=2.9 graphe des Nt en fonction de t et graphe de f')

%%%% On change la valeur de r dans le code pour tracer les autres courbes.
