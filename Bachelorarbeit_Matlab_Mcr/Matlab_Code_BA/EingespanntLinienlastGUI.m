function Mcr=EingespanntLinienlastGUI(L,psi,Iy,Iz,It,Iw,E,G,zpz)
format short g

%Funktion bekommt alle Querschnittswerte,... aus GUI übergeben.
%pz frei wählbar, kritisches Moment lastunabhängig ist.
pz=50; %konstante Linienlast pz über gesamtes Feld in [kN/cm]

%========================================================================================

G11=integralmatrixGUI(1,1,0);
G111=integralmatrixGUI(1,1,1);
G112=integralmatrixGUI(1,1,2);
G22=integralmatrixGUI(2,2,0);
G00=integralmatrixGUI(0,0,0);
G021=integralmatrixGUI(0,2,1);
G022=integralmatrixGUI(0,2,2);
G02=integralmatrixGUI(0,2,0); 
G20=integralmatrixGUI(2,0,0);
G201=integralmatrixGUI(2,0,1);

%Forfaktoren
F1=1/(L)*(G*It); F2=1/(L)^3*(E*Iw); F3=1/(L)*(E*Iz); F4=1/(L)*(E*Iy); %Forfaktoren für Steifigkeitsmatrix
F5=L*(pz*zpz);
%===========================================================================================

%Teilmatrizen
Avv1=F2*G22+F1*G11;
Ann1=F3*G22;
Anv1=zeros(8);
Avn1=zeros(8);

Bvv1=-1*(F5*G00);
Bnn1=-1*(zeros(8));
Bvn1=-1*(-(pz*L^2/2)*G022+(pz*L^2/2)*G021-psi*(pz*L^2/12)*G02);
Bnv1=Bvn1.';

%Randbedingungen

%RB=[0,0,1,1,0,0,1,1]; %Beidseitig Gelenkig
RB=[0,0,0,0,1,1,1,1]; %Beidseitig Eingespannt
s=size(RB,2);
k=0;
for i=1:s
    if RB(1,i)==0
        Bvv1(i-k,:)=[];
        Bvv1(:,i-k)=[];
        Bvn1(i-k,:)=[];
        Bvn1(:,i-k)=[];
        Bnv1(i-k,:)=[];
        Bnv1(:,i-k)=[];
        Bnn1(i-k,:)=[];
        Bnn1(:,i-k)=[];
        Avv1(i-k,:)=[];
        Avv1(:,i-k)=[];
        Ann1(i-k,:)=[];
        Ann1(:,i-k)=[];        
        Anv1(i-k,:)=[];
        Anv1(:,i-k)=[];
        Avn1(i-k,:)=[];
        Avn1(:,i-k)=[];
        k=k+1;
    end
end
A=[Avv1,Avn1;
    Anv1,Ann1];
B=[Bvv1,Bvn1;
    Bnv1,Bnn1];

%Kleinsten Eigenwert Berechnen
Vki= abs(eigs(A,B,1,'SM'));
%============================================================================================
Mcr=((pz*L^2)/8-psi*(pz*L^2)/12)*Vki;
end