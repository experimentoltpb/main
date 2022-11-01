for i = 1:size(data_LTPB,1)

    T2(i)= data_LTPB(i,7);
end     
a=1;

for par = 1:(size(data_LTPB,1)/1000) 
    RT2{par}=T2(a:a+999); 

    a=a+1000;

end

for par = 1:(size(data_LTPB,1)/1000)
     GTML(par) = mean(RT2{par}); %global temporal means LTPB
end

Pain_Intensity = [7.25, 4.25, 5.33, 3.5, 2.25, 6, 6, 4.75, 0.25];


RTxI = [GTML.' Pain_Intensity.'];

[R,PValue] = corrplot(RTxI);