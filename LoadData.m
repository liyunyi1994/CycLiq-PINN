clc
clear

rng('shuffle');
randE = rand(1e5,1);

epoch = 0;
load DataTorUD
LoadSub
load DataTorRand
LoadSub
load DataTorCD
LoadSub
load DataTriUD
LoadSub
load DataTriRand
LoadSub
load DataTriCD
LoadSub
load DataAxiUD
LoadSub
load DataAxiRand
LoadSub
load DataAxiCD
LoadSub

p0   = p0';
p1   = p1';
den  = den';
drn  = drn';
Dir  = Dir';
Dreg = Dreg';
Drer = Drer';
dv   = dv';
H    = H';
L    = L';

j = 0;
tr_epoch = 0;
te_epoch = 0;
for i = 1:epoch
    if L(i) >= 1e-8
        j = j+1;
        if randE(j) <= 0.7
            tr_epoch = tr_epoch+1;
            tr_p0(tr_epoch,:)   = p0(i,:);
            tr_p1(tr_epoch,:)   = p1(i,:);
            tr_den(tr_epoch,:)  = den(i,:);
            tr_drn(tr_epoch,:)  = drn(i,:);
            tr_D(tr_epoch,:)    = Dir(i,:)+Dreg(i,:)+Drer(i,:);
            tr_dv(tr_epoch,:)   = dv(i,:);
            tr_H(tr_epoch,:)    = H(i,:);
            tr_L(tr_epoch,:)    = L(i,:);
            tr_S0(tr_epoch,:)   = S0(i,:);
            tr_dS(tr_epoch,:)   = dS(i,:);
            tr_E0(tr_epoch,:)   = E0(i,:);
            tr_dE(tr_epoch,:)   = dE(i,:);
            tr_dEp(tr_epoch,:)  = dEp(i,:);
            tr_Int0(tr_epoch,:) = Int0(i,:);
            tr_Int(tr_epoch,:)  = Int(i,:);
            tr_nor(tr_epoch,:)  = nor(i,:);
        end
        if (randE(j) >= 0.7) && (L(i) >= 1e-6)
            te_epoch = te_epoch+1;
            te_p0(te_epoch,:)   = p0(i,:);
            te_p1(te_epoch,:)   = p1(i,:);
            te_den(te_epoch,:)  = den(i,:);
            te_drn(te_epoch,:)  = drn(i,:);
            te_D(te_epoch,:)    = Dir(i,:)+Dreg(i,:)+Drer(i,:);
            te_dv(te_epoch,:)   = dv(i,:);
            te_H(te_epoch,:)    = H(i,:);
            te_L(te_epoch,:)    = L(i,:);
            te_S0(te_epoch,:)   = S0(i,:);
            te_dS(te_epoch,:)   = dS(i,:);
            te_E0(te_epoch,:)   = E0(i,:);
            te_dE(te_epoch,:)   = dE(i,:);
            te_dEp(te_epoch,:)  = dEp(i,:);
            te_Int0(te_epoch,:) = Int0(i,:);
            te_Int(te_epoch,:)  = Int(i,:);
            te_nor(te_epoch,:)  = nor(i,:);
        end
    end
end

save('DataTrain.mat','tr_p0','tr_p1','tr_den','tr_drn','tr_D','tr_dv',...
    'tr_H','tr_L','tr_S0','tr_dS','tr_E0','tr_dE','tr_dEp','tr_Int0','tr_Int','tr_nor','tr_epoch');
save('DataTest.mat','te_p0','te_p1','te_den','te_drn','te_D','te_dv',...
    'te_H','te_L','te_S0','te_dS','te_E0','te_dE','te_dEp','te_Int0','te_Int','te_nor','te_epoch');