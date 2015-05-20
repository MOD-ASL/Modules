%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                             Smores Demo                           %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Create a Smores object
% Pass in the device name of the module as an argument.
% On OSX, this is usually /dev/tty.usbmodem1411. On Linux, this is usually
% /dev/ttyACMO. 
m1 = Smores('com17');
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
%% demo
% drive

for i=1:2
    m1.setDofVelocity('left',30);
    pause(0.01);
    m1.moveDofVelocity('left');
    pause(5);
    m1.stopDofVelocity('left');
    pause(0.01);
    m1.setDofVelocity('left',60);
    pause(0.01);
    m1.moveDofVelocity('left');
    pause(5);
    m1.stopDofVelocity('left');
    pause(0.01);
end

