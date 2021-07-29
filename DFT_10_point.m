%verification of the final 10-point DFT algorithm given by equation (15)
clc
clear 

syms x0 x1 x2 x3 x4 x5 x6 x7 x8 x9
syms X0 X1 X2 X3 X4 X5 X6 X7 X8 X9 
syms a0 a1 a2 a3 a4 a5 a6 a7 a8 a9
syms A0 A1 A2 A3 A4 A5 A6 A7 A8 A9

x = [x0; x1; x2; x3; x4; x5; x6; x7; x8; x9];
X = [X0; X1; X2; X3; X4; X5; X6; X7; X8; X9];
a = [a0; a1; a2; a3; a4; a5; a6; a7; a8; a9];
A = [A0; A1; A2; A3; A4; A5; A6; A7; A8; A9];

w10=exp(-j*2*pi/10)

W10=[];
for k=0:9
W10 = [W10; [w10^(k*0) w10^(k*1) w10^(k*2) w10^(k*3) w10^(k*4) w10^(k*5) w10^(k*6) w10^(k*7) w10^(k*8) w10^(k*9)]];
end
 
 V10=[1 0 0 0 0 0 0 0 0 0;
     0 1 0 0 0 0 0 0 0 1;
     0 0 1 0 0 0 0 0 1 0;
     0 0 0 1 0 0 0 1 0 0;
     0 0 0 0 1 0 1 0 0 0;
     0 0 0 0 0 1 0 0 0 0;
     0 0 0 0 1 0 -1 0 0 0;
     0 0 0 1 0 0 0 -1 0 0;
     0 0 1 0 0 0 0 0 -1 0;
     0 1 0 0 0 0 0 0 0 -1]
  
  V10h=[1 0 0 0 0 1 0 0 0 0;
       0 1 0 0 1 0 0 0 0 0;
       0 0 1 1 0 0 0 0 0 0;
       0 0 1 -1 0 0 0 0 0 0;
       0 1 0 0 -1 0 0 0 0 0;
       1 0 0 0 0 -1 0 0 0 0;
       0 0 0 0 0 0 1 0 0 1;
       0 0 0 0 0 0 0 1 1 0;
       0 0 0 0 0 0 0 1 -1 0;
       0 0 0 0 0 0 1 0 0 -1]
 
 S10c = diag([1 1 1 -1 -1 1 1 1 1 -1])
 S10r = diag([1 1 -1 1 1 1 1 1 1 1])
 

T12x10=[1 0 0 0 0 0 0 0 0 0;
      0 0 1 0 1 0 0 0 0 0;
      0 0 1 0 -1 0 0 0 0 0;
      0 0 0 0 0 1 0 0 0 0;
      0 1 0 1 0 0 0 0 0 0;
      0 1 0 -1 0 0 0 0 0 0;
      0 0 0 0 0 0 0 -1 0 0;
      0 0 0 0 0 0 0 0 0 1;
      0 0 0 0 0 0 0 1 0 1;
      0 0 0 0 0 0 -1 0 0 0;
      0 0 0 0 0 0 0 0 1 0;
      0 0 0 0 0 0 1 0 1 0]
  
A14x12=[1 0 0 0 0 0 0 0 0 0 0 0;
     0 (a1+a2)/2 0 0 0 0 0 0 0 0 0 0;
     0 0 (a1-a2)/2 0 0 0 0 0 0 0 0 0;
     0 0 1 0 0 0 0 0 0 0 0 0;
     0 0 0 1 0 0 0 0 0 0 0 0;
     0 0 0 0 (a1+a2)/2 0 0 0 0 0 0 0;
     0 0 0 0 0 (a1-a2)/2 0 0 0 0 0 0;
     0 0 0 0 0 1 0 0 0 0 0 0;
     0 0 0 0 0 0 a3+a4 0 0 0 0 0;
     0 0 0 0 0 0 0 a3-a4 0 0 0 0;
     0 0 0 0 0 0 0 0 a4 0 0 0;
     0 0 0 0 0 0 0 0 0 a3+a4 0 0;
     0 0 0 0 0 0 0 0 0 0 a3-a4 0;
     0 0 0 0 0 0 0 0 0 0 0 a4]


T10x14 = [1 0 0 1 0 0 0 0 0 0 0 0 0 0;
        1 1 1 0 0 0 0 0 0 0 0 0 0 0;
       -1 1 -1 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 1 1 1 0 0 0 0 0 0 0;
        0 0 0 0 -1 1 -1 0 0 0 0 0 0 0;
        0 0 0 0 1 0 0 1 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 1 0 1 0 0 0;
        0 0 0 0 0 0 0 0 0 1 1 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 1 0 1;
        0 0 0 0 0 0 0 0 0 0 0 0 1 1]

display('verification of the algorithm (15)')
display(W10 - V10*V10h*S10r*T10x14*A14x12*T12x10*S10c*V10) 

%%
imag=1i
a1=cos(2*pi/5)
a2 = cos(pi/5)
a3 = imag*sin(2*pi/5)
a4 = imag*sin(pi/5)

A14x12=[1 0 0 0 0 0 0 0 0 0 0 0;
     0 (a1+a2)/2 0 0 0 0 0 0 0 0 0 0;
     0 0 (a1-a2)/2 0 0 0 0 0 0 0 0 0;
     0 0 1 0 0 0 0 0 0 0 0 0;
     0 0 0 1 0 0 0 0 0 0 0 0;
     0 0 0 0 (a1+a2)/2 0 0 0 0 0 0 0;
     0 0 0 0 0 (a1-a2)/2 0 0 0 0 0 0;
     0 0 0 0 0 1 0 0 0 0 0 0;
     0 0 0 0 0 0 a3+a4 0 0 0 0 0;
     0 0 0 0 0 0 0 a3-a4 0 0 0 0;
     0 0 0 0 0 0 0 0 a4 0 0 0;
     0 0 0 0 0 0 0 0 0 a3+a4 0 0;
     0 0 0 0 0 0 0 0 0 0 a3-a4 0;
     0 0 0 0 0 0 0 0 0 0 0 a4]

display('verification of the algorithm (15) for real values')
display(W10 - V10*V10h*S10r*T10x14*A14x12*T12x10*S10c*V10) 

