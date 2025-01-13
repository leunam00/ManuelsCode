function  A=integralmatrixGUI(AbleitungF1,AbleitungF2,Vorfaktor)

% AbleitungF1: Ableitungsgrad des Ersten Polynoms
% AbleitungF2: Ableitungsgrad des zweiten Polynoms
% Vorfaktor: Polynomgrad des vorangestellten Ceta ( entweder 0,1 oder 2)


%  H=[1,0,0,-10,15,-6;            %H ist die Hemitesche Polynommatrix 5. Grades
%     0,0,0,10,-15,6;
%     0,1,0,-6,8,-3;
%     0,0,0,-4,7,-3;
%     0,0,0.5,-1.5,1.5,-0.5;      
%     0,0,0,0.5,-1,0.5];


H=[1,0,0,0,-35,84,-70,20;         %H ist die Hemitesche Polynommatrix 7. Grades
    0,0,0,0,35,-84,70,-20;
    0,1,0,0,-20,45,-36,10;
    0,0,0,0,-15,39,-34,10;
    0,0,0.5,0,-5,10,-7.5,2;
    0,0,0,0,2.5,-7,6.5,-2;
    0,0,0,1/6,-2/3,1,-2/3,1/6;
    0,0,0,0,-1/6,0.5,-0.5,1/6];
%------------------------------------------------
p=size(H,2);

%Erstellen der Vorfaktormatrizen für die 1. und 2. Ableitung
VorfaktorErsteAbl=[0:1:p-1];
VorfaktorErsteAblMatrix=repmat(VorfaktorErsteAbl,p,1);
VorfaktorZweiteAbl=zeros(1,p);
for i=1:p-1
VorfaktorZweiteAbl(1,i+1)=VorfaktorErsteAbl(1,i).*VorfaktorErsteAbl(1,i+1);
end
VorfaktorZweiteAblMatrix=repmat(VorfaktorZweiteAbl,p,1);
%----------------------------------------------------------------------   


integralmatrix=zeros(p,p);
B=zeros(p,2*p-1);
t=0;


for s=1:p %Spalte in die am Ende eingefügt wird
if AbleitungF1==0                                %Multiplikation der Vorfaktoren 
    Hvorfaktor=H;                                %mit der H-Matrix für die verschiedenen Ableitungen
elseif AbleitungF1==1                            %mit der die Funktion aufgerufen wird
    Hvorfaktor=H.*VorfaktorErsteAblMatrix;
elseif AbleitungF1==2
    Hvorfaktor=H.*VorfaktorZweiteAblMatrix;
end

if AbleitungF2==0
    HB=H;
elseif AbleitungF2==1
    HB=H.*VorfaktorErsteAblMatrix;
elseif AbleitungF2==2
    HB=H.*VorfaktorZweiteAblMatrix;
end

if AbleitungF1+AbleitungF2==0
Wannbruchstartet=0;
elseif AbleitungF1+AbleitungF2==1
Wannbruchstartet=1;
elseif AbleitungF1+AbleitungF2==2
Wannbruchstartet=2; 
elseif AbleitungF1+AbleitungF2==3
Wannbruchstartet=3;     
elseif AbleitungF1+AbleitungF2==4
Wannbruchstartet=4;     
end

if Vorfaktor==1
    Wannbruchstartet=Wannbruchstartet-1;
elseif Vorfaktor==2
    Wannbruchstartet=Wannbruchstartet-2;
end

for i=1:p
    for j=1:p
        B(i,j+t)=HB(s,j);
    end
    if t<=p
    t=t+1;
    else
        break;
    end    
end

Bruchvektor=zeros(2*p-1,1);

for k=1:2*p-1-Wannbruchstartet
    Bruchvektor(k+Wannbruchstartet,1)=1/k;
end
t=0;
A(:,s)=Hvorfaktor*B*Bruchvektor;                   %Spalten in Zeilen umwandeln
end

end