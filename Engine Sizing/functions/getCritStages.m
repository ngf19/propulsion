function fName = getCritStages(Tsl)
%GETCRITSTAGES Function returns details of critical mission stages defined
%by this function as matlab structures.
%   Outputs name of workspace where structures are saved.

fileName = "critStages.mat";

m2ft = 3.281;

%% Takeoff stage:
critStages(1).name = 'takeoff';
critStages(1).ref = 'a';
critStages(1).beta = getFuelFraction(1, 0);     %overall fuel fraction
critStages(1).M = 0.18;                         %Mach
critStages(1).h = 2e3 / m2ft;                   %altitude
critStages(1).a = 1160 / m2ft;                  %Speed of sound
critStages(1).ab = 1;                           %Afterburner yes (1) or no (0)
critStages(1).v = critStages(1).M * critStages(1).a;    %velocity
critStages(1).alpha = getThrustLapse(critStages(1).h, critStages(1).v, critStages(1).ab);   %thrust lapse
critStages(1).T = getThrustRequired(Tsl, critStages(1).alpha);      %thrust required for stage

%% Supercruise stage:
critStages(2).name = 'supercruise';
critStages(2).ref = 'b';
critStages(2).beta = getFuelFraction(6, 0);     %overall fuel fraction
critStages(2).M = 1.9;                         %Mach
critStages(2).h = 50e3 / m2ft;                   %altitude
critStages(2).a = 294.9;                  %Speed of sound
critStages(2).ab = 0;                           %Afterburner yes (2) or no (0)
critStages(2).v = critStages(2).M * critStages(2).a;    %velocity
critStages(2).alpha = getThrustLapse(critStages(2).h, critStages(2).v, critStages(2).ab);   %thrust lapse
critStages(2).T = getThrustRequired(Tsl, critStages(2).alpha);      %thrust required for stage

%% Combat Turn 1:
critStages(3).name = 'Combat Turn 1';
critStages(3).ref = 'c';
critStages(3).beta = getFuelFraction(1, 1);     %overall fuel fraction
critStages(3).M = 1.6;                         %Mach
critStages(3).h = 50e3 / m2ft;                   %altitude
critStages(3).a = 294.9;                  %Speed of sound
critStages(3).ab = 1;                           %Afterburner yes (3) or no (0)
critStages(3).v = critStages(3).M * critStages(3).a;    %velocity
critStages(3).alpha = getThrustLapse(critStages(3).h, critStages(3).v, critStages(3).ab);   %thrust lapse
critStages(3).T = getThrustRequired(Tsl, critStages(3).alpha);      %thrust required for stage

%% Combat Turn 2:
critStages(4).name = 'Combat Turn 2';
critStages(4).ref = 'd';
critStages(4).beta = getFuelFraction(2, 1);     %overall fuel fraction
critStages(4).M = 0.9;                         %Mach
critStages(4).h = 50e3 / m2ft;                   %altitude
critStages(4).a = 294.9;                  %Speed of sound
critStages(4).ab = 1;                           %Afterburner yes (4) or no (0)
critStages(4).v = critStages(4).M * critStages(4).a;    %velocity
critStages(4).alpha = getThrustLapse(critStages(4).h, critStages(4).v, critStages(4).ab);   %thrust lapse
critStages(4).T = getThrustRequired(Tsl, critStages(4).alpha);      %thrust required for stage

%% Combat Acceleration:
critStages(5).name = 'Combat Acceleration';
critStages(5).ref = 'e';
critStages(5).beta = getFuelFraction(3, 1);     %overall fuel fraction
critStages(5).M = 1.2;                         %Mach
critStages(5).h = 50e3 / m2ft;                   %altitude
critStages(5).a = 294.9;                  %Speed of sound
critStages(5).ab = 1;                           %Afterburner yes (5) or no (0)
critStages(5).v = critStages(5).M * critStages(5).a;    %velocity
critStages(5).alpha = getThrustLapse(critStages(5).h, critStages(5).v, critStages(5).ab);   %thrust lapse
critStages(5).T = getThrustRequired(Tsl, critStages(5).alpha);      %thrust required for stage

%% Maximum Speed
critStages(6).name = 'Maximum Speed';
critStages(6).ref = 'f';
critStages(6).beta = getFuelFraction(3,1);     %overall fuel fraction
critStages(6).M = 3;                         %Mach
critStages(6).h = 50e3 / m2ft;                   %altitude
critStages(6).a = 294.9;                  %Speed of sound
critStages(6).ab = 1;                           %Afterburner yes (6) or no (0)
critStages(6).v = critStages(6).M * critStages(6).a;    %velocity
critStages(6).alpha = getThrustLapse(critStages(6).h, critStages(6).v, critStages(6).ab);   %thrust lapse
critStages(6).T = getThrustRequired(Tsl, critStages(6).alpha);      %thrust required for stage

save(fileName, 'critStages');

fName = fileName;

end

