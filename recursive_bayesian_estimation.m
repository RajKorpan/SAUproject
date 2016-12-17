% Script that was used while testing the algorithms to figure out how to do Bayesian updating in Matlab

x=transpose(tlines);

Sa=(1:0.05:2.5);
Sb=(-0.75:0.05:0.75);

L=length(Sa);
Pr=ones(L,L);
Po=ones(L,L);

Pr=Pr/sum(sum(Pr));
Po=Po/sum(sum(Po));

[a,b]=find(Po==max(max(Po)));
sest=[Sa(a);Sb(b)];

K=[0.1,0;0,0.1];
for n=2:length(x);
    Pr=Po;
    m=0*Pr;    
    for i=1:length(Pr)
       for j=1:length(Pr)
           me=[Sa(i);Sb(j)];
           m(i,j) = 1/sqrt((2*pi)^2*det(K)) * exp(-(x(:,n)-me)'*inv(K)*(x(:,n)-me)/2); %Compute likelihood            
           m(i,j) = m(i,j) * Pr(i,j); % Combine this likelihood with the prior    
       end;
    end;
    Po=m/sum(sum(m)); %normalize this distribution to make it a proper probability distribution.
    [a,b]=find(Po==max(max(Po)));  % Get the peak value; it's most likely location of the Quail.
    sest=[Sa(a);Sb(b)];  %A store the coordinates of this location in the bushes
end;