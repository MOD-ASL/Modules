%%
m1.setDofVelocity('right', 100);
m1.setDofVelocity('left', -100);
%%
m1.moveDofVelocity('right');
m1.moveDofVelocity('left');
%%
m1.stopDofVelocity('right');
m1.stopDofVelocity('left');
%%%%%%%%
%% Steer: left
m1.moveDofPosition('pan', 20, -20, 0,0, 0,0, 1);
%% steer right:
m1.moveDofPosition('pan', -20, 20, 0,0, 0,0, 1);