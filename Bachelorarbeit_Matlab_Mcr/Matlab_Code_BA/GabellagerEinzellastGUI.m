function Mcr=GabellagerEinzellastGUI(L,psi,Iy,Iz,It,Iw,E,G,zPz) 
format short g

%Funktion bekommt alle Querschnittswerte,... aus GUI übergeben.
%Pz frei wählbar, kritisches Moment lastunabhängig ist.
Pz=221.63; %Pz in Feldmitte in [kN]

%========================================================================================
%Laden der benötigten Integralmatrizen
G11=integralmatrixGUI(1,1,0);
G111=integralmatrixGUI(1,1,1);
G112=integralmatrixGUI(1,1,2);
G22=integralmatrixGUI(2,2,0);
G00=integralmatrixGUI(0,0,0);
G021=integralmatrixGUI(0,2,1);
G02=integralmatrixGUI(0,2,0); 
G20=integralmatrixGUI(2,0,0);
G201=integralmatrixGUI(2,0,1);

%Berechnung der Forfaktoren
F1=1/(L/2)*(G*It); F2=1/(L/2)^3*(E*Iw); F3=1/(L/2)*(E*Iz); F4=1/(L/2)*(E*Iy); %Forfaktoren für Steifigkeitsmatrix

%===========================================================================================

%Erzeugen der Teilmatrizen:

%Steifigkeitsmatrix
Avv1=F2*G22+F1*G11;      %Bei den Matrizen z.B.: Avv1 steht die 1 für linkes und 2 für rechtes Teilsystem
Ann1=F3*G22;                  
Avv2=Avv1;
Ann2=Ann1;

%Belastungsmatrix
Bvv1=-1*(zeros(8));
Bnn1=-1*(zeros(8));                                  
Bvn1=-1*((Pz*L/4)*G021-psi*(Pz*L/8)*G02); %Momentenverlauf abhängig von gewähltem psi.
Bnv1=Bvn1.';

Bvv2=Bvv1;
Bnn2=Bnn1;
Bvn2=-1*((Pz*L/4-psi*(Pz*L/8))*G02-(Pz*L/4)*G021); %Momentenverlauf abhängig von gewähltem psi.
Bnv2=Bvn2.';
%============================================================================================

% Einführen der Randbedingungen:

% Randbedingungen für linken Systemabschnitt
% Für beidseitig Eingespannt wäre RB=[0,1,0,0,1,1,1,1]; 
RB=[0,1,1,0,0,1,1,1]; %Gelenkig
s=size(RB,2);
k=0;
for i=1:s
    if RB(1,i)==0                   %Streichen der Zeilen und Spalten
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
        k=k+1;
    end
end

% Randbedingungen für rechten Systemabschnitt
% Für beidseitig Eingespannt wäre RB=[1,0,0,0,1,1,1,1]; 
RB=[1,0,0,1,1,0,1,1]; %Gelenkig
s=size(RB,2);
k=0;
for i=1:s
    if RB(1,i)==0                      %Streichen der Zeilen und Spalten
        Bvv2(i-k,:)=[];
        Bvv2(:,i-k)=[];
        Bvn2(i-k,:)=[];
        Bvn2(:,i-k)=[];
        Bnv2(i-k,:)=[];
        Bnv2(:,i-k)=[];
        Bnn2(i-k,:)=[];
        Bnn2(:,i-k)=[];
        Avv2(i-k,:)=[];
        Avv2(:,i-k)=[];
        Ann2(i-k,:)=[];
        Ann2(:,i-k)=[];
        k=k+1;
    end
end
%============================================================================================

%Übergangsbedingungen:

%Erstellen der Systemmatrizen für die folgende Überlagerdung
n5=zeros(5);
Agross=[Avv1,n5,n5,n5;
    n5,Ann1,n5,n5;
    n5,n5,Avv2,n5;
    n5,n5,n5,Ann2];

Bgross=[Bvv1,Bvn1,n5,n5;
    Bnv1,Bnn1,n5,n5;
    n5,n5,Bvv2,Bvn2;
    n5,n5,Bnv2,Bnn2];

Bgross(1,1)=Bgross(1,1)+(zPz*Pz)*-1; %Addition der S-Matrix        

%Addition/ Subtraktion der Richtigen Zeilen und Spalten
%voneinander/aufeinander

Z=[1,2,3,4,5,6,7,8,9,10;                     %Zuordnungsmatrix Z
    11,-12,13,-15,-14,16,-17,18,-20,-19]; 

for i=1:10                                      
    for k=1:10
            if Z(2,k)<=0
                V=-1;
            else
                V=1;
            end
        if Z(2,i)>=0
    A(i,k)=Agross(Z(1,i),Z(1,k))+V*Agross(abs(Z(2,i)),abs(Z(2,k)));
    B(i,k)=Bgross(Z(1,i),Z(1,k))+V*Bgross(abs(Z(2,i)),abs(Z(2,k)));
        else
    A(i,k)=Agross(Z(1,i),Z(1,k))-V*Agross(abs(Z(2,i)),abs(Z(2,k)));
    B(i,k)=Bgross(Z(1,i),Z(1,k))-V*Bgross(abs(Z(2,i)),abs(Z(2,k)));
        end
        
    end
end

%============================================================================================

%Kleinsten Eigenwert Berechnen
Vki= abs(eigs(A,B,1,'SM'));
%============================================================================================
%Berechnung von Mcr
Mcr=((Pz*L)/4-psi*(Pz*L)/8)*Vki;
end
