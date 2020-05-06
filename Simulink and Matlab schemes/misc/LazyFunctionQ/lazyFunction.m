%load
close all
clc
x=out.xOut;
xDot=out.xDotOut;
t=out.time;
q=out.qOut;
%set params
maxDelta=0.001 %movement threshold for when the robot is considered static, default=0.001
minS=3  %minimal time[s] the robot needs to stand still to record the point, default=3
minCount=100*minS;
%filter data
Wn = 5/100; % Normalized cutoff frequency
[Fb,Fa]=butter(4,Wn);
xDot=filter(Fb,Fa,xDot);
x=filter(Fb,Fa,x);
%%
%plot
figure();
subplot(2,1,1);
plot(t,x);
title("position");
legend('x','y','z','eulerZ','eulerY','eulerX');
subplot(2,1,2);
plot(t,xDot);
title("velocity");
legend('x','y','z','eulerZ','eulerY','eulerX');
text=strcat("position and velocity");
sgtitle(text,'FontSize',14);
set(gcf, 'Position', get(0, 'Screensize'));
%%
%find stopped points
clear idx
found=0;
for idx=1:length(t)
    if mean(xDot(idx,:))<maxDelta
        if idx==1
            count(idx)=1;
        else
            count(idx)=count(idx-1)+1;
        end
    else
        count(idx)=0;
    end
    
end
count(idx+1)=0;
pts=zeros(1,6);
%isolate maximums
for idx=minCount:length(t)+1
    if abs(count(idx)-count(idx-1))>minCount-1
        found=found+1;
        idxFound(found)=idx-1;
        pts(found,:)=x(idx-1,:);
    end
end
%plot found points
figure()
countVec=minCount*ones(length(t),1);
plot(t,count([1:length(count)-1]),t,countVec,t(idxFound),count(idxFound),'o');
legend('count','threshold','found Points');
pts