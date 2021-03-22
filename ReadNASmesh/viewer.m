function []=viewer(filename)

%Load the data
load(filename);

%Color=[0.75 0.75 0.75]; 
Color='g';

Cut=find (t(4,:)>1);
t(:,Cut)=[];

for m=1:length(t)
    n=t(1:3,m);
    X(1:3,m)=p(1,n)';
    Y(1:3,m)=p(2,n)';
    Z(1:3,m)=p(3,n)';
end
g=fill3(X,Y,Z,Color);
    
axis('equal')
rotate3d on