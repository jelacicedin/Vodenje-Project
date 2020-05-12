function [x,y,z,th1,th2,th3] = operationalInterpolate(X,ac,alfac,tfinal)

n = size(X,2);

if length(tfinal) == 1
    tfinal = ones(n-1,1)*tfinal;
end

x1 = X(1,:);
x2 = X(2,:);
x3 = X(3,:);
theta1 = X(4,:);
theta2 = X(5,:);
theta3 = X(6,:);

EPSILON = 0.001;

Xtrajec = [X(:,1)];

for i = 1:n-1
    tcx1 = tfinal(i)/2 -0.5*sqrt((tfinal(i)^2*ac-4*(x1(i+1)-x1(i)))/ac);
    tcx2 = tfinal(i)/2 -0.5*sqrt((tfinal(i)^2*ac-4*(x2(i+1)-x2(i)))/ac);
    tcx3 = tfinal(i)/2 -0.5*sqrt((tfinal(i)^2*ac-4*(x3(i+1)-x3(i)))/ac);
    tctheta1 = tfinal(i)/2 -0.5*sqrt((tfinal(i)^2*alfac-4*(theta1(i+1)-theta1(i)))/alfac);
    tctheta2 = tfinal(i)/2 -0.5*sqrt((tfinal(i)^2*alfac-4*(theta2(i+1)-theta2(i)))/alfac);
    tctheta3 = tfinal(i)/2 -0.5*sqrt((tfinal(i)^2*alfac-4*(theta3(i+1)-theta3(i)))/alfac);
    
    p1i = x1(i);
    p1f = x1(i+1);
    p2i = x2(i);
    p2f = x2(i+1);
    p3i = x3(i);
    p3f = x3(i+1);
    p4i = theta1(i);
    p4f = theta1(i+1);
    p5i = theta2(i);
    p5f = theta2(i+1);
    p6i = theta3(i);
    p6f = theta3(i+1);
    
    p1 = p1i;
    p2 = p2i;
    p3 = p3i;
    p4 = p4i;
    p5 = p5i;
    p6 = p6i;
    
    
    for t = 0:0.01:tfinal(i)
    
        if t<tcx1
            p1 = p1i+0.5*ac*t^2;
        end
        if t<(tfinal(i)-tcx1)&&t>=tcx1
            p1 = p1i+ac*tcx1*(t-tcx1/2);
        end
        if t>(tfinal(i)-tcx1)
            p1 = p1f-0.5*ac*(t-tfinal(i))^2;
        end
        
        if t<tcx2
            p2 = p2i+0.5*ac*t^2;
        end
        if t<(tfinal(i)-tcx2)&&t>=tcx2
            p2 = p2i+ac*tcx2*(t-tcx2/2);
        end
        if t>(tfinal(i)-tcx2)
            p2 = p2f-0.5*ac*(t-tfinal(i))^2;
        end
        
        if t<tcx3
            p3 = p3i+0.5*ac*t^2;
        end
        if t<(tfinal(i)-tcx3)&&t>=tcx3
            p3 = p3i+ac*tcx3*(t-tcx3/2);
        end
        if t>(tfinal(i)-tcx3)
            p3 = p3f-0.5*ac*(t-tfinal(i))^2;
        end
        
        if t<tctheta1
            p4 = p4i+0.5*alfac*t^2;
        end
        if t<(tfinal(i)-tctheta1)&&t>=tctheta1
            p4 = p4i+alfac*tctheta1*(t-tctheta1/2);
        end
        if t>(tfinal(i)-tctheta1)
            p4 = p4f-0.5*alfac*(t-tfinal(i))^2;
        end
        
        if t<tctheta2
            p5 = p5i+0.5*alfac*t^2;
        end
        if t<(tfinal(i)-tctheta2)&&t>=tctheta2
            p5 = p5i+alfac*tctheta2*(t-tctheta2/2);
        end
        if t>(tfinal(i)-tctheta2)
            p5 = p5f-0.5*alfac*(t-tfinal(i))^2;
        end
        
        if t<tctheta3
            p6 = p6i+0.5*alfac*t^2;
        end
        if t<(tfinal(i)-tctheta3)&&t>=tctheta3
            p6 = p6i+alfac*tctheta3*(t-tctheta3/2);
        end
        if t>(tfinal(i)-tctheta3)
            p6 = p6f-0.5*alfac*(t-tfinal(i))^2;
        end
        
        Xtrajec = [Xtrajec [p1; p2; p3; p4; p5; p6]];
    end

end

finalDurationOfMotion = size(Xtrajec,2)*0.01;
timeVector = (0:0.01:finalDurationOfMotion-0.01)';

x = [timeVector Xtrajec(1,:)'];
y = [timeVector Xtrajec(2,:)'];
z = [timeVector Xtrajec(3,:)'];
th1 = [timeVector Xtrajec(4,:)'];
th2 = [timeVector Xtrajec(5,:)'];
th3 = [timeVector Xtrajec(6,:)'];

end

