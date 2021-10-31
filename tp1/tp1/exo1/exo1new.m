%%% j'ai utilisé besselzero pour trouver les 6 zéros presentés en vecteur y "besselzero(6,6,1)" 
y=[9.9361 13.5893 17.0038 20.3208 23.5861 26.8202]
for m= 1 : 6
for t= 1 : 6
for i= 1 : 6    
    z = besselj(m,y(i),1)*cos(y(i)*t);
end
end
end
figure 
plot(y,z)
