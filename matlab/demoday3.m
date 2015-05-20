figure;
hold on
axis([-1.5 1.5 -1.5 1.5]);
axis square
plot(0,0,'ro');
title ('click to set velocity. click outside to quit')
hold off

maxSpeed = 30;
x = 0;
y = 0;
while (x<1.5) && (x>-1.5) && (y<1.5) && (y>-1.5)
    [x,y]=ginput(1);
    cla
    hold on
    plot(0,0,'ro');
    plot([0,x],[0,y],'b-');
    hold off
    
    m1.stopDofVelocity('left');
    pause(0.01);
    m1.stopDofVelocity('right');
    pause(0.01);
    
    m1.setDofVelocity('left',maxSpeed*y+maxSpeed*x/2);
    pause(0.01);
    m1.setDofVelocity('right',-maxSpeed*y);
    pause(0.01);
    
    m1.moveDofVelocity('left');
    pause(0.01);
    m1.moveDofVelocity('right');
    pause(0.01);
    
end

m1.stopDofVelocity('left');
pause(0.01);
m1.stopDofVelocity('right');
pause(0.01);
    
close all