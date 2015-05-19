%%
%m1 = Smores('/dev/tty.usbmodem1411');
%% Attach bottom to something metal
m1.magnetControl('bottom', 'on');
%% Attach metal bar to top
m1.magnetControl('top', 'on');
%%
numCurls = input('How many bicep curls? ');
angle = 45; %deg
duration = 1; %sec
for i=1:numCurls
    m1.moveDofPosition('tilt', 0, angle, 0,0, 0,0, duration);
    pause(duration+0.5);
    m1.moveDofPosition('tilt', angle, 0, 0,0, 0,0, duration);
    pause(duration+1);
end
% Celebrate!
m1.moveDofPosition('pan', 0, 180, 0,180/3, 0,0, 3);
pause(3);
m1.moveDofPosition('pan', 180, 360, 180/3,0, 0,0, 3);
