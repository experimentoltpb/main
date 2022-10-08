% *% Boxplot de RTs por bloco para os dois grupos*

% for i = 1:size(ZC,1);
%    
%     T(i)= ZC(i,7);
%    
%    
% end
% 
% a=1;
% 
% for par = 1:(size(ZC,1)/1000) ;
% A{par}=T(a:a+999); 
% 
% a=a+1000;
% 
% end
% 
% %Bloco 1-controle
% 
% AC1 = 0;
% for par = 1:(size(ZC,1)/1000);
%     for k = drange(1:334); %numero de jogadas do bloco
%         
%         AC1 = AC1 + A{par}(k); %AC1 -> Acur�cia do grupo controle no bloco 1. � a soma dos termos contidos no intervalo k para A{par}
%     end
%     
%     MAC1(par) = AC1/334;  %MAC1 � um vetor em que cada termo corresponde a m�dia de acur�cia de um participante no primeiro bloco.
%     AC1=0;
% 
% end
% %Bloco 2-controle
% 
% AC2 = 0;
% for par = 1:(size(ZC,1)/1000);
%     for k = drange(335:668); 
%         
%         AC2 = AC2 + A{par}(k); 
%     end
%     
%     MAC2(par) = AC2/334;  
%     AC2=0;
% end
% 
% %Bloco 3-controle
% 
% AC3 = 0;
% for par = 1:(size(ZC,1)/1000);
%     for k = drange(669:1000); 
%         
%         AC3 = AC3 + A{par}(k); 
%     end
%     
%     MAC3(par) = AC3/332;  
%     AC3=0;
% end
% 
% for i = 1:size(ZL,1);
%     
%     T2(i)= ZL(i,7);
% end     
% a=1;
% 
% for par = 1:(size(ZL,1)/1000) ;
% A{par}=T2(a:a+999); %Cria um vetor para cada participante contendo seus tempos de resposta
% 
% 
% a=a+1000;
% 
% end
% %Bloco 1-ltpb
% 
% AC4 = 0;
% for par = 1:(size(ZL,1)/1000);
%     for k = drange(1:334); %numero de jogadas do bloco
%         
%         AC4 = AC4 + A{par}(k); %AC4 -> tempos do grupo controle no bloco 1. � a soma dos termos contidos no intervalo k para A{par}
%     end
%     
%     MAC4(par) = AC4/334;  %MAC1 � um vetor em que cada termo corresponde a m�dia de tempos de um participante no primeiro bloco.
%     AC4=0;
% 
% end
% %Bloco 2-ltpb
% 
% AC5 = 0;
% for par = 1:(size(ZL,1)/1000);
%     for k = drange(335:668); 
%         
%         AC5 = AC5 + A{par}(k); 
%     end
%     
%     MAC5(par) = AC5/334;  
%     AC5=0;
% end
% 
% %Bloco 3-ltpb
% 
% AC6 = 0;
% for par = 1:(size(ZL,1)/1000);
%     for k = drange(669:1000); 
%         
%         AC6 = AC6 + A{par}(k); 
%     end
%     
%     MAC6(par) = AC6/332;  
%     AC6=0;
% end
% 
% %Boxplot
% TMA=[MAC1 MAC4];
% TMB=[MAC2 MAC5];
% TMC=[MAC3 MAC6];
% MACT2 = [TMA TMB TMC]; %ordena dados em uma matriz para que o comando do boxplot possa funcionar.
% 
% grp =[zeros(1,7),ones(1,8),2*ones(1,7),3*ones(1,8),4*ones(1,7),5*ones(1,8)]; %grouping variable. Para casos em que as colunas que estamos comparando n�o tem o mesmo n�mero de individuos, colocamos tudo em uma linha e usamos essa nota��o pra discernir quais valores s�o de quais grupos. Valores iguais pertencem ao mesmo grupo. Um valor para cada coluna.
% %o segundo argumento das fun��es �mpares � o n�mero de partcipantes no
% %grupo controle e o segundo argumento das fun��es pares � o n�mero de
% %participantes do grupo LTPB
% 
% BMACT2 = boxplot(MACT2,grp); %boxplot mostrando evolu��o ao longo dos blocos.
% 
% title(strcat('Distribui��o dos tempos de resposta dos grupos em cada bloco'));
% ylabel("Tempos");
% ylim([0 2.5])
% yticks([0:0.2:2.5])
% xticks([1 2 3 4 5 6])
% xticklabels({'1� Bloco - Controle','1� Bloco - LTPB', '2� Bloco - Controle', '2� Bloco - LTPB','3� Bloco - Controle', '3� Bloco - LTPB'})
% xline(2.5)
% xline(4.5)
% 
% grp2=[zeros(1,7),ones(1,8)];
% 
% %compara��o entre grupos bloco 1
% CxL1=kruskalwallis(TMA, grp2);
% % 
% % %compara��o entre grupos bloco 2
% % CxL2=kruskalwallis(TMB,grp2);%2
% % % 
% % %compara��o entre grupos bloco 3
% % CxL3=kruskalwallis(TMC, grp2);%3
% % 
% % grp3 = [zeros(1,7),ones(1,7)];
% % TMD=[MAC1 MAC3];%compara��o grupo controle bloco 1&3
% % C1xC3 = kruskalwallis(TMD, grp3);%4
% % 
% % grp4 = [zeros(1,8),ones(1,8)];
% % TME=[MAC4 MAC6];
% % L1xL3=kruskalwallis(TME, grp4); %5
% 
% Media_temporal_total_c = (MAC1 + MAC2 + MAC3)/3;
% Media_temporal_total_L = (MAC4 + MAC5 + MAC6)/3;
% 
% 
% TMF = [Media_temporal_total_c Media_temporal_total_L];
% % CTxLT = kruskalwallis(TMF, grp2);
% 
% 
% 
% % %%
% % %%Construindo calculo da performance individual
% % p_mod=[0 1 0
% %     0 1 0
% %     0 0 1
% %     0 0 1
% %     0.7 0.3 0];
% % P_ctx=[0.23
% %     0.10
% %     0.10
% %     0.23
% %     0.33];
% % 
% % %Ocorrencia de cada contexto at� determinada jogada 
% % Q=repmat(0,5,1000);
% % for mc = drange(1:5)
% %     for j = drange(1:1000)
% %         if ct_pos(mc,j) ~= 0
% %             Q(mc,ct_pos(mc,j))=1;
% %             q(mc,j)=sum(Q(mc,1:j));
% %         elseif  ct_pos(mc,j) == 0
% %     q(mc,j)=sum(Q(mc,1:j));
% %         end
% %     end
% % end    
% % %matriz representa as vezes que o participante escolhe a resposta A dado contexto A  
% % 
% % for nc= drange(1:5)
% %     Qz=repmat(0,3,1000);
% %     qz=repmat(0,3,1000);
% %     for jk = drange(335:1000)
% %         if Q(nc,jk) == 1 
% %             if Z(jk+1,8)==0 
% %                 Qz(1,jk)= 1;
% %             elseif Z(jk+1,8)== 1
% %                 Qz(2,jk)= 1;
% %             elseif Z(jk+1,8)== 2     
% %                 Qz(3,jk)= 1;
% %             end
% %         end
% %         qz(1,jk)=sum(Qz(1,1:jk));
%         qz(2,jk)=sum(Qz(2,1:jk));
%         qz(3,jk)=sum(Qz(3,1:jk)); 
%     end
%     contz{nc}=qz;
% end
% 
% % calculo da probabilidade empirica para os ctx  
% for dc = drange(1:5)   
%     pz=repmat(0,3,666);
%     for kl=drange(1:666)
%         
%         pz(1,kl)=contz{dc}(1,kl+334)/q(dc,kl+334);  
%         pz(2,kl)=contz{dc}(2,kl+334)/q(dc,kl+334);
%         pz(3,kl)=contz{dc}(3,kl+334)/q(dc,kl+334); 
%     end
%     conty{dc}=pz;
% end  
%  
% %OBS LIDAR COM O ERRO DE QUANDOA DIVISÃO D�? 0/0
% 
% 
% %calculo do indice de performance dos contextos 
% PI=repmat(0,5,666);
% for lc = drange(1:5)   
%     for kt=drange(1:666)
%         PI(lc,kt)=1-((abs(conty{lc}(1,kt)-p_mod(lc,1))+abs(conty{lc}(2,kt)-p_mod(lc,2))+abs(conty{lc}(3,kt)- p_mod(lc,3)))/2);
%     end
% end
% 
% PIt=repmat(0,5,666);
% for tc = drange(1:5)
%     for bk = drange(1:666)
%         PIt(tc,bk)=PI(tc,bk)*P_ctx(tc);    
%     end 
% end
% PI_final=sum(PIt);
% %Construindo o grafico de análise de performance
% x = linspace(335,1000,666);
% xlim ([335 1000])
% xticks([335:50:1000])
% 
% title(strcat('Performance individual', Name))
%  
% xlabel("N�mero da Jogada")
% 
% 
% yyaxis left
% ac=plot(x,PI_final,'LineWidth',2.5,'MarkerSize',2.5, 'DisplayName', 'Performance', 'color', [0 0 1]);
% ylim([0 1])
% ylabel('performance')
% xline(334,'--','DisplayName','Intervalo 1');
% xline(668,'--','DisplayName','Intervalo 2');
%  
% yyaxis right 
% ct=plot(x,t(335:1000),'LineWidth',0.001,'MarkerSize',2.5, 'DisplayName', 'Contextos', 'color', [1 0 0]);
% ylim([0 0.2])
% yticks([0:0.05:0.2])
% ylabel("Propor��o de contextos infrequentes")

