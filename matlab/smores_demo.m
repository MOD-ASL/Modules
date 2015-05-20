%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                             Smores Demo                           %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Create a Smores object
% Pass in the device name of the module as an argument.
% On OSX, this is usually /dev/tty.usbmodem1411. On Linux, this is usually
% /dev/ttyACMO. 
m1 = Smores('com17');
%% Query the module for its state
% The degrees of freedom are named 'left', 'right', 'pan', and 'tilt.'
leftStateStuct = m1.getDofState('left');
%% initDof:
% Use initDof to send the specified DoF to the zero position.  Also, when the
% module is turned on, it automatically does this for all dof.
m1.initDof('right');
m1.initDof('left');
m1.initDof('pan');
m1.initDof('tilt');
%%
pause(1);
%% moveDofPosition:
% moveDofPosition commands a feedback-controlled motion from a start state
% to an end state.

% Move each Dof from zero to 30 degrees and back:
angle = 30;   % degrees
duration = 1; % seconds
dof='right';
m1.moveDofPosition(dof, 0, angle, 0, 0, 0, 0, duration);
pause(duration + 1);
m1.moveDofPosition(dof, angle, 0, 0, 0, 0, 0, duration);
pause(duration + 1);
% Note: The 'pause' commands in this code are necessary.  The module can
% only handle one trajectory at a time - any new incoming trajectory
% supercedes the existing trajectory, so if two are commanded in succession
% with no pause, the second overwrites the first.
%% Velocity control:
% First, configure a DoF for velocity control using the setDofVelocity
% function:
m1.setDofVelocity('left', 40); % degrees /second
% Start the motion with moveDofVelocity:
m1.moveDofVelocity('left');
% Let it go as long as you like:
pause(6);
% stop with stopDofVelocity:
m1.stopDofVelocity('left');
%%
pause(0.5);
leftPosition = m1.getDofState('left');
leftPosition = leftPosition.current_position;
m1.moveDofPosition('left', leftPosition, 0, 0,0, 0,0, 2);
pause(1);
%% Magnet control:
% The magnetControl function turns magnets on and off.  The faces are named
% 'left', 'right', 'top', and 'bottom'.
m1.magnetControl('top', 'on');
pause(2);
m1.magnetControl('top', 'off');