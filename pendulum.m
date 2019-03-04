%Constants of system
m = 1;
g = 9.8;
r = 1;
c = 0.5;
w0 = 0;
th0 = 180;

%Linearized State Space
A = [0   1; 
    g/r -c];
B = [0; 
    1/(m*r^2)];
C = [1 0];
D = 0;

%Penalty Matrix5
Q = [1 0; 
     0 10];
R = 10;  

%LQR
[K,~,~] = lqr(A,B,Q,R);
sys = ss((A-B*K),B,C,D);
x0 = [th0;w0];
initial(sys,x0);
hold on
% for i=-5:5
%     %Penalty Matrix5
%     Q = [power(10,i)*1 0; 
%            0 1];
%     R = power(10,-i)*1;
% 
%     %LQR
%     [K,~,~] = lqr(A,B,Q,R);
%     sys = ss((A-B*K),B,C,D);
%     x0 = [th0;w0];
%     initial(sys,x0);
%     hold on
% end
% legend('i=-5','i=-4','i=-3','i=-2','i=-1','i=0','i=1','i=2','i=3','i=4','i=5');
