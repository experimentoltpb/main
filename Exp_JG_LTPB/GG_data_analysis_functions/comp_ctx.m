% function [stats] =  comp_ctx (data_control, data_LTPB, from_t, to_t)
%
% This function recieves the data from both groups of the experiment and
% returns a figure for each data matrix containing all of the context
% trees of the group, one tree for each participant.
% The function also returns the mode tree for each group.
%
% INPUT:
%
% data_control = data matrix from the control group.
%
% data_ltpb = data matrix from the LTPB group.
%
% OUTPUT:
% 
% tau_estC = each cell of this variable is a list of the contexts that are
% present in the tree of one of the participants of the control group.
% The column number represents the identification of the participant of whom the
% tree belongs.
%
% tau_estL = each cell of this variable is a list of the contexts that are
% present in the tree of one of the participants of the LTPB group.
% The column number represents the identification of the participant of whom the
% tree belongs.
%
% mode_tauC = list of contexts present in the mode tree of the control
% group.
%
% mode_tauL = list of contexts present in the mode tree of the LTPB
% group.
%
% 26/01/2023 by Pedro R. Pinheiro

%function [stats] =  comp_ctx (data_control, data_LTPB, from_t, to_t)

%end

control_n = (size(data_control,1)/1000) ;
LTPB_n = (size(data_LTPB,1)/1000);
sig_dif = 1;
test = 0;
acsis = [];
x_name = '';
y_name = "Mean Response Time (s)";
grp =[ones(1,control_n),2*ones(1,LTPB_n)]; 


from_t = 1;
to_t = 1000;

%ctx_row = 1;

for ctx_row = 1:5 %number of contexts

    if ctx_row == 1 %w=0
        [mctx_RT_control, mctx_RT_LTPB] = create_mean_RTs_ctx (data_control, data_LTPB, from_t, to_t, ctx_row);
        RTC = [mctx_RT_control mctx_RT_LTPB];
        tit = 'Distribution of the Mean Response Times of each group for w = 0';
        figure
        sbox_comp(grp', RTC',  x_name, y_name, tit,{}, sig_dif, test, acsis)
        ylim([0 2.5])
        yticks([0:0.2:2.5])
        xline(1.5)
        xticks([1 2])
        xticklabels({'Control','LTPB'})
    end
if ctx_row == 2 %w=01
        [mctx_RT_control, mctx_RT_LTPB] = create_mean_RTs_ctx (data_control, data_LTPB, from_t, to_t, ctx_row);
        RTC = [mctx_RT_control mctx_RT_LTPB];
        tit = 'Distribution of the Mean Response Times of each group for w = 01';
        figure
        sbox_comp(grp', RTC',  x_name, y_name, tit,{}, sig_dif, test, acsis)
        ylim([0 2.5])
        yticks([0:0.2:2.5])
        xline(1.5)
        xticks([1 2])
        xticklabels({'Control','LTPB'})
end

if ctx_row == 3 %w=11
        [mctx_RT_control, mctx_RT_LTPB] = create_mean_RTs_ctx (data_control, data_LTPB, from_t, to_t, ctx_row);
        RTC = [mctx_RT_control mctx_RT_LTPB];
        tit = 'Distribution of the Mean Response Times of each group for w = 11';
        figure
        sbox_comp(grp', RTC',  x_name, y_name, tit,{}, sig_dif, test, acsis)
        ylim([0 2.5])
        yticks([0:0.2:2.5])
        xline(1.5)
        xticks([1 2])
        xticklabels({'Control','LTPB'})
end

if ctx_row == 4 %w=21
        [mctx_RT_control, mctx_RT_LTPB] = create_mean_RTs_ctx (data_control, data_LTPB, from_t, to_t, ctx_row);
        RTC = [mctx_RT_control mctx_RT_LTPB];
        tit = 'Distribution of the Mean Response Times of each group for w = 21';
        figure
        sbox_comp(grp', RTC',  x_name, y_name, tit,{}, sig_dif, test, acsis)
        ylim([0 2.5])
        yticks([0:0.2:2.5])
        xline(1.5)
        xticks([1 2])
        xticklabels({'Control','LTPB'})
end

if ctx_row == 5 %w=2
        [mctx_RT_control, mctx_RT_LTPB] = create_mean_RTs_ctx (data_control, data_LTPB, from_t, to_t, ctx_row);
        RTC = [mctx_RT_control mctx_RT_LTPB];
        tit = 'Distribution of the Mean Response Times of each group for w = 2';
        figure
        sbox_comp(grp', RTC',  x_name, y_name, tit,{}, sig_dif, test, acsis)
        ylim([0 2.5])
        yticks([0:0.2:2.5])
        xline(1.5)
        xticks([1 2])
        xticklabels({'Control','LTPB'})
end

end
function [mctx_RT_control, mctx_RT_LTPB] = create_mean_RTs_ctx (data_control, data_LTPB, from_t, to_t, ctx_row) % This function produces a list for each group containg
%the mean RTs in a given context for every participant of the group.
%"ctx_row" is the corresponding row to the context that you wish to
%analyze in the ct_pos matrix.



tree_file_address= "C:\Users\Pedro_R\Desktop\Projeto\Code_exp_ltpb\git\files_for_reference\tree_behave12.txt"; %change this to match your machine
for i = 1:size(data_control,1)

    T1(i)= data_control(i,7);


end

a=1;

for par = 1:(size(data_control,1)/1000) 
RT1{par}=T1(a:a+999); 

a=a+1000;

end

for i = 1:size(data_LTPB,1)

    T2(i)= data_LTPB(i,7);
end     
a=1;

for par = 1:(size(data_LTPB,1)/1000) 
RT2{par}=T2(a:a+999); 


a=a+1000;

end

% Making the control group mean RT list

for par = 1:(size(data_control,1)/1000)
 
[~,~,~,~,~,ct_pos]= rtanderperctx(data_control,par,from_t,to_t,tree_file_address,0,12);

ctx_p = nonzeros(ct_pos (ctx_row,:)).'; % "nonzeros' removes excess zeros after the last ocurrence of the context
ctx_RT = zeros(1, size(ctx_p,2)); %the code return an incorret list for the last participant if this line is omitted (?)

for i = 1: size(ctx_p,2)
    ctx_RT (i) = RT1{par}(ctx_p(i)+1); %every RT of a participant after a context
end

mctx_RT_control (par) = mean(ctx_RT);

end

% Making the LTPB group mean RT list

for par = 1:(size(data_LTPB,1)/1000)
 
[~,~,~,~,~,ct_pos]= rtanderperctx(data_LTPB,par,from_t,to_t,tree_file_address,0,12);

ctx_p = nonzeros(ct_pos (ctx_row,:)).'; % "nonzeros' removes excess zeros after the last ocurrence of the context
ctx_RT = zeros(1, size(ctx_p,2)); %the code return an incorret list for the last participant if this line is omitted (?)

for i = 1: size(ctx_p,2)
    ctx_RT (i) = RT2{par}(ctx_p(i)+1); %every RT of a participant after a context
end

mctx_RT_LTPB (par) = mean(ctx_RT);

end
end