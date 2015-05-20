% Drive1.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

classdef Drive1
    properties
       module
       epsilon
    end
    
    methods
        function obj = Drive1(module)
            % Object constructor.  module and backModule should be
            % Smores objects.
            obj.module = module;
            obj.epsilon = 1; % parameter for about-equals checking, in degrees.
        end
        %function neutralPosition(obj)
        %    % Sends the cluster to its neutral position, ready to drive.
        %    % tilts:
        %    obj.module.goToAngle('tilt', 75);
        %    %obj.backModule.goToAngle('tilt', 75);
        %    % pans:
        %    obj.module.goToAngle('pan', 0);
        %    %obj.backModule.goToAngle('pan', 0);
        %end
        function drive(obj, thetaDot, direction, duration)
            % Makes the car drive with wheel angular velocity thetaDot (in
            % degrees/sec) for theta degrees.  Direction must be 'forward'
            % or 'backward'.
            %% Argument checking:
            assert(thetaDot>0, 'thetaDot must be >0');
            %assert(theta>0, 'theta Must be >0');
            if( strcmp(direction,'forward') )
                dir = 1;
            elseif( strcmp(direction, 'backward') )
                dir = -1;
            else
                assert(false, 'direction must be "forward" or "backward"');
            end
            %%
            
            % Set velocities:
            obj.module.setDofVelocity('left',thetaDot*dir);
            pause(0.01);
            obj.module.setDofVelocity('right',-thetaDot*dir);
            pause(0.01);
            % start wheels moving:
            obj.module.moveDofVelocity('left');
            pause(0.01);
            obj.module.moveDofVelocity('right');
            pause(0.01);
            % wait: for it to get there:
            pause(duration);
            % stop all wheels
            obj.stopAllWheels();
            
            %{
            if(strcmp(direction, 'forward'))
                rightDir = 'cw';
                leftDir = 'ccw';
            elseif(strcmp(direction, 'backward'))
                rightDir = 'ccw';
                leftDir = 'cw';
            end
            obj.module.moveDofTime('right', rightDir, thetaDot, duration);
            obj.module.moveDofTime('left', leftDir, thetaDot, duration);
            %}
        end
        function turn(obj, theta, duration)
            % turn in place.  Theta is measured clockwise
            pause(0.01);
            current_left = obj.module.getDofState('left');
            current_left = current_left.current_position;
            pause(0.01);
            current_right = obj.module.getDofState('right');
            current_right = current_right.current_position;
            obj.module.goToAngle('right', current_right+theta, duration);
            pause(0.01);
            obj.module.goToAngle('left', current_left+theta, duration);
            pause(duration);
        end
        %
        function stopAllWheels(obj)
            % Stops all wheels spinning
            obj.module.stopDofVelocity('left');
            pause(0.01);
            obj.module.stopDofVelocity('right');
            %obj.backModule.stopVelocity('left');
            %obj.backModule.stopVelocity('right');
        end
        %
        function waitUntilPositionReached(obj, module, dof_name, targetAngleDegrees)
            % waitUntilDofPositionReached(dof_name, targetAngleDegrees): This
            % function waits (does nothing) until specified dof of 
            % specified module reaches specified angle in degrees, then returns.
            angle = module.getDofState(dof_name);
            angle = angle.current_position;
            while( abs( angle-targetAngleDegrees ) > obj.epsilon)
                pause(0.01)
                angle = obj.module.getDofState(dof_name);
                angle = angle.current_position;
            end
        end
    end 
end
