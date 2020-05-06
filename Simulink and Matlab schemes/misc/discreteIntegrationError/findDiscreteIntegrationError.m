clear all
close all
sim_startQ=0;
sim_startTime=0;
sim_endTime=15;
deltaT=sim_endTime-sim_startTime;
endQ=[0.2:0.2:10];
sizeQ=size(endQ,2);
Acc=[0.2:0.2:20];
sizeA=size(Acc,2);
if isfile("disIntErr.mat")
    load("disIntErr.mat");
    disp("file loaded");
else
    disp("no file found, calculating a new one");
    results=zeros(4,sizeQ*sizeA);
    w=waitbar(0,"starting");
    for ii=1:sizeQ
        for jj=1:sizeA
            txt=strcat("working ",num2str((ii-1)*sizeA+jj),"/",num2str(sizeQ*sizeA));
            sim_endQ=endQ(ii);
            sim_Acc=Acc(jj);
            waitbar(((ii-1)*sizeA+jj)/(sizeQ*sizeA),w,txt);
            sim('InterpolationQerr.slx');
            %figure()
            %plot([1:length(xOut)],xOut);
            results(1,ii)=max(xOut);  %spike
            results(2,ii)=sim_endQ;       %desired endQ
            results(3,ii)=sim_Acc;        %provided Acc
            results(4,ii)=results(1,ii)-results(2,ii); %error at the end
        end
    end
    waitbar(1,w,"saving to mat file");
    save('disIntErr.mat','results');
    close(w);
end
figure()
plot(results(2,:),results(4,:));
title("error(endQ)");
xlabel("endQ");
ylabel("error");
figure()
plot(results(3,:),results(4,:));
title("error(Acc)");
xlabel("Acc");
ylabel("error");