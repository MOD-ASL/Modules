%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                             Smores Demo                           %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Create a Smores object
% Pass in the device name of the module as an argument.
% On OSX, this is usually /dev/tty.usbmodem1411. On Linux, this is usually
% /dev/ttyACMO. 
m1 = Smores('/dev/ttyACM0');
%% initDof:
% Use initDof to send the specified DoF to the zero position.  Also, when the
% module is turned on, it automatically does this for all dof.
m1.initDof('right');
pause(1);
m1.initDof('left');
pause(1);
m1.initDof('pan');
pause(1);
m1.initDof('tilt');
pause(1);
%% Attach bar to bottom
m1.magnetControl('bottom', 'on')
%% Create a drive1 object and do some driving!
d = Drive1(m1);
%%
m1.goToAngle('tilt', 0, 1);
pause(1);
% drive
d.drive(60, 'forward', 5);
d.turn(90, 1);
pause(0.5);
d.drive(60, 'forward', 5);
% Grab an object and lift it:
m1.magnetControl('top', 'on');
m1.goToAngle('tilt', -30, 1);
pause(1.1);
%
% drive back
d.drive(60, 'backward', 5);
pause(1);
d.turn(-90, 2);
pause(0.5);
d.turn(-90, 2);
pause(0.5);
d.drive(60, 'forward', 5);
pause(1);
m1.goToAngle('tilt', 0, 1);
pause(1);
m1.magnetControl('top', 'off');

