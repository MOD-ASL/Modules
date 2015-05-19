%%
%m1 = Smores('/dev/tty.usbmodem1411');
%% Drive forward
speed = 100;
pauseTime = 0.01;
m1.setDofVelocity('right', -speed);
pause(pauseTime)
m1.setDofVelocity('left', speed);
pause(pauseTime)
% start
m1.moveDofVelocity('right');
pause(pauseTime)
m1.moveDofVelocity('left');
pause(pauseTime)
% stop after 3 seconds
pause(3);
m1.stopDofVelocity('right');
pause(pauseTime);
m1.stopDofVelocity('left');
pause(pauseTime);
%% Grab the weight
m1.magnetControl('top', 'on');
pause(0.5);
%% Drive back
speed = -speed;
pauseTime = 0.01;
m1.setDofVelocity('right', -speed);
pause(pauseTime)
m1.setDofVelocity('left', speed);
pause(pauseTime)
% start
m1.moveDofVelocity('right');
pause(pauseTime)
m1.moveDofVelocity('left');
pause(pauseTime)
% Release after 2 seconds:
% stop after 3 seconds
pause(3);
m1.stopDofVelocity('right');
pause(pauseTime);
m1.stopDofVelocity('left');
pause(pauseTime);
%% Now go back and let go:
speed = 100;
pauseTime = 0.01;
m1.setDofVelocity('right', -speed);
pause(pauseTime)
m1.setDofVelocity('left', speed);
pause(pauseTime)
% start
m1.moveDofVelocity('right');
pause(pauseTime)
m1.moveDofVelocity('left');
pause(pauseTime)
% stop after 3 seconds
pause(3);
m1.stopDofVelocity('right');
pause(pauseTime);
m1.stopDofVelocity('left');
pause(pauseTime);
%% release the weight
m1.magnetControl('top', 'off');
pause(0.5)
%% Drive back
speed = -speed;
pauseTime = 0.01;
m1.setDofVelocity('right', -speed);
pause(pauseTime)
m1.setDofVelocity('left', speed);
pause(pauseTime)
% start
m1.moveDofVelocity('right');
pause(pauseTime)
m1.moveDofVelocity('left');
pause(pauseTime)
% Release after 2 seconds:
% stop after 3 seconds
pause(3);
m1.stopDofVelocity('right');
pause(pauseTime);
m1.stopDofVelocity('left');
pause(pauseTime);