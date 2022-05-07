function [z_i,z_q,y_i,y_q,y,yf,z,bezkostasef]=costasloop(sigBPSK,t,fS,fvz,fc,paramfilt)


N=length(sigBPSK)

BnT=0.5;
bn=BnT*fS; 
ksi=1/sqrt(2);
wn=8*ksi*bn;
%
K=4*bn;
Ta=K/wn^2;

%filtr smycky
lf_num=1;
lf_denum=[1 Ta];

%dolni propusti ve vetvich
%[lp_num,lp_denum] = butter(2,8*fS/fvz);
%[lp_2_num,lp_2_denum] = butter(2,8*fS/fvz);

[lp_num,lp_denum] = butter(2,paramfilt);
[lp_2_num,lp_2_denum] = butter(2,paramfilt);


%
vco_num=[1/fvz];
vco_denum=[1 -1];

%pocatecni podminky
iIN=[0 0];iOUT=0;qIN=[0 0];qOUT=0;zIN=0;zOUT=0;yIN=0;yOUT=0;yyIN=[0 0];yyOUT=[0 0];%pocatecni podminky filtru
iINbk=iIN;
iOUTbk=iOUT;


%nastaveni pocatecnich vektoru
i_phase=zeros(1,N+1);
q_phase=zeros(1,N+1);
z_i=ones(1,N+1); 
z_q=zeros(1,N+1);
z=zeros(1,N+1);
y=zeros(1,N+1);
yf=zeros(1,N+1);
y_i=zeros(1,N+1);
y_q=zeros(1,N+1);
out_phase=zeros(1,N+1);
demoddata=zeros(1,N+1);


    
    %   -------    smycka
    for i=2:N-1
        omega=2*pi*fc*t(i);
        bezkostase(i)=2*sigBPSK(i-1).*cos(omega);
        [bezkostasef(i),iOUTbk]=filter(lp_num,lp_denum,bezkostase(i),iINbk);
        % nasobeni cosinem
        z_i(i)=2*sigBPSK(i-1).*i_phase(i-1);
        % nasobeni sinem
        z_q(i)=2*sigBPSK(i-1).*q_phase(i-1);
        % filtrovani I slozky
        [y_i(i),iOUT]=filter(lp_num,lp_denum,z_i(i),iIN);
        demoddata(i)=sign(y_i(i));
        % filtrovani Q slozky
        [y_q(i),qOUT]=filter(lp_num,lp_denum,z_q(i),qIN);
        
        % fazovy zdvojovac
        y(i)=y_i(i)*y_q(i);
        % filtr LP3
        [yf(i),yOUT]=filter(lf_num,lf_denum,y(i),yIN);%filtr smycky
        % integrator
        [z(i),zOUT]=filter(vco_num,vco_denum,K*yf(i),zIN);%integrator
        % zmena cos(+ faze)
        i_phase(i)=cos(omega+z(i));
        % zmena sin(+ faze)
        q_phase(i)=-sin(omega+z(i));
        % nove pocatecni podminky filtru = koncove podminky filtru
        iIN=iOUT;qIN=qOUT;zIN=zOUT;yIN=yOUT;iINbk=iOUTbk;
        out_phase(i)=z(i-1);
    end
