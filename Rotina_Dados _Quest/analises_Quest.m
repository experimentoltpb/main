f_control='C:\Users\vinivius valent\Documents\GitHub\main\Rotina_Dados _Quest\Quests_Control.csv';
d_control = readcell(f_control);
Q_control=d_control(1:9,1:10);
f_ltpb='C:\Users\vinivius valent\Documents\GitHub\main\Rotina_Dados _Quest\Quests_LTPB.csv';
d_ltpb = readcell(f_ltpb);
Q_ltpb=d_ltpb(1:9,1:12);

%%
[filepath,name,ext] = fileparts(f_ltpb);%Mudar de acordo com o arquivo
pa = 8;
%%
%Compara��o idades (Willcoxon test)

[age_p,age_h]= ranksum(cell2mat(Q_control(2:9,3)),cell2mat(Q_ltpb(2:9,3)));

%%
%compara��o cogtel(Willcoxon test)

[cogtel_p,cogtel_h]= ranksum(cell2mat(Q_control(2:9,8)),cell2mat(Q_ltpb(2:9,8)));


%%
%compara��o lateralidade(Willcoxon test)

[lat_p,lat_h]= ranksum(cell2mat(Q_control(2:9,9)),cell2mat(Q_ltpb(2:9,9)));



%%
%compara�ao familiaridade(chi-squared)
cfam_m = 0;
cfam_a = 0;
cfam_n = 0;
lfam_m = 0;
lfam_a = 0;
lfam_n = 0;
for i =drange(1:9) ;
    if  isequal(Q_control(i,7),{'Muita'  }) 
        cfam_m = cfam_m + 1;
    elseif  isequal(Q_control(i,7),{'Alguma' })    
        cfam_a = cfam_a + 1 ;
    elseif isequal(Q_control(i,7),{'Nenhuma'})   
        cfam_n = cfam_n + 1;
    end
end
Cfam_freq=[cfam_m,cfam_a,cfam_n];%ocorrencia de respostas muita, alguma e nenhuma
%Cfam_chi=chi2gof(Cfam_freq)

for i =drange(1:9) ;
    if  isequal(Q_ltpb(i,7),{'Muita'  }) 
        lfam_m = lfam_m + 1;
    elseif  isequal(Q_ltpb(i,7),{'Alguma' })    
        lfam_a = lfam_a + 1 ;
    elseif isequal(Q_ltpb(i,7),{'Nenhuma'})   
        lfam_n = lfam_n + 1;
    end
end
Lfam_freq=[lfam_m,lfam_a,lfam_n];
%Lfam_chi=chi2gof(Lfam_freq)
[tbl,chi2stat,pval] = crosstab(Cfam_freq,Lfam_freq)


%%
%compara�ao escolaridade(chi-squared)
cesc_em = 0;
cesc_es = 0;
cesc_pos = 0;
lesc_em = 0;
lesc_es = 0;
lesc_pos = 0;
for i =drange(1:9) ;
    if  isequal(Q_control(i,5),{'Ensino médio completo'  }) 
        cesc_em = cesc_em + 1;
    elseif  isequal(Q_control(i,5),{'Ensino superior completo'})    
       cesc_es =cesc_es + 1 ;
    elseif isequal(Q_control(i,5),{'Pós-graduação'        })   
        cesc_pos = cesc_pos + 1;
    end
end
Cesc_freq=[cesc_em,cesc_es,cesc_pos];%ocorrencia de respostas muita, alguma e nenhuma
%Cesc_chi=chi2gof(Cesc_freq)
for i =drange(1:9) ;
    if  isequal(Q_ltpb(i,5),{'Ensino médio completo'  }) 
        lesc_em = lesc_em + 1;
    elseif  isequal(Q_ltpb(i,5),{'Ensino superior completo'})    
        lesc_es = lesc_es + 1 ;
    elseif isequal(Q_ltpb(i,5),{'Pós-graduação'        })   
        lesc_pos = lesc_pos + 1;
    end
end
Lesc_freq=[lesc_em,lesc_es,lesc_pos];
%Lesc_chi=chi2gof(Lesc_freq)
[tbl,chi2stat,pval] = crosstab(Cesc_freq,Lesc_freq)

%%
%Compara��o tempos de cada grupo entre os blocos(Kruskal-Wallis test)


for i = 1:size(ZC,1);
   
    T(i)= ZC(i,7);
   
end

a=1;

for par = 1:(size(ZC,1)/1000) ;
A{par}=T(a:a+999); 

a=a+1000;

end

%Bloco 1-controle

AC1 = 0;
for par = 1:(size(ZC,1)/1000);
    for k = drange(1:334); %numero de jogadas do bloco
        
        AC1 = AC1 + A{par}(k); %AC1 -> Acur�cia do grupo controle no bloco 1. � a soma dos termos contidos no intervalo k para A{par}
    end
    
    MAC1(par) = AC1;  %MAC1 � um vetor em que cada termo corresponde a m�dia de acur�cia de um participante no primeiro bloco.
    AC1=0;

end
%Bloco 2-controle

AC2 = 0;
for par = 1:(size(ZC,1)/1000);
    for k = drange(335:668); 
        
        AC2 = AC2 + A{par}(k); 
    end
    
    MAC2(par) = AC2;  
    AC2=0;
end

%Bloco 3-controle

AC3 = 0;
for par = 1:(size(ZC,1)/1000);
    for k = drange(669:1000); 
        
        AC3 = AC3 + A{par}(k); 
    end
    
    MAC3(par) = AC3;  
    AC3=0;
end

for i = 1:size(ZL,1);
    
    T2(i)= ZL(i,7);
end     
a=1;

for par = 1:(size(ZL,1)/1000) ;
A{par}=T2(a:a+999); %Cria um vetor para cada participante contendo seus tempos de resposta


a=a+1000;

end
%Bloco 1-ltpb

AC4 = 0;
for par = 1:(size(ZL,1)/1000);
    for k = drange(1:334); %numero de jogadas do bloco
        
        AC4 = AC4 + A{par}(k); %AC4 -> tempos do grupo controle no bloco 1. � a soma dos termos contidos no intervalo k para A{par}
    end
    
    MAC4(par) = AC4;  %MAC1 � um vetor em que cada termo corresponde a m�dia de tempos de um participante no primeiro bloco.
    AC4=0;

end
%Bloco 2-ltpb

AC5 = 0;
for par = 1:(size(ZL,1)/1000);
    for k = drange(335:668); 
        
        AC5 = AC5 + A{par}(k); 
    end
    
    MAC5(par) = AC5;  
    AC5=0;
end

%Bloco 3-ltpb

AC6 = 0;
for par = 1:(size(ZL,1)/1000);
    for k = drange(669:1000); 
        
        AC6 = AC6 + A{par}(k); 
    end
    
    MAC6(par) = AC6;  
    AC6=0;
end
%% Rodar o c�digo analises e graficos antes de realizar a analise dos tempos
% TMA=[MAC1;MAC4];%compara��o entre grupos bloco 1 
% CxL1=kruskalwallis(TMA.');%1
% 
% TMB=[MAC2;MAC5];%compara��o entre grupos bloco 2
% CxL2=kruskalwallis(TMB.');%2
% 
% TMC=[MAC3;MAC6];%compara��o entre grupos bloco 3
% CxL3=kruskalwallis(TMC.');%3

% TMD=[MAC1,MAC2];%compara��o grupo controle bloco 1&2
% C1xC2=kruskalwallis(TMD.');%4
% % 
% TME=[MAC1,MAC3];%compara��o grupo controle bloco 1&3
% C1xC3=kruskalwallis(TME.');%5
% 
% TMF=[MAC2,MAC3];%compara��o grupo controle bloco 2%3
% C2xC3=kruskalwallis(TMF.');%6

% TMG=[MAC4,MAC5];%compara��o grupo ltpb bloco 1&2
% L1xL2=kruskalwallis(TMG.');%7
%  
% TMH=[MAC4,MAC6];%compara��o grupo ltpb bloco 1&3
% L1xL3=kruskalwallis(TMH.');%8
% % 
% TMI=[MAC5,MAC6];%compara��o grupo ltpb bloco 2&3
% L2xL3=kruskalwallis(TMI.');%9

