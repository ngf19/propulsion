function fName = getCritStages(Tsl, WTO)
%GETCRITSTAGES Function returns details of critical mission stages defined
%by this function as matlab structures.
%   Outputs name of workspace where structures are saved.

fileName = "critStages.mat";

m2ft = 3.281;

instLosses = 9.09e-2;

%% Takeoff stage:
critStages(1).name = 'takeoff';
critStages(1).ref = 'a';
critStages(1).beta = getFuelFraction(1, 0);     %overall fuel fraction
critStages(1).M = 0.18;                         %Mach
critStages(1).h = 2e3 / m2ft;                   %altitude
critStages(1).a = 1160 / m2ft;                  %Speed of sound
critStages(1).ab = 1;                           %Afterburner yes (1) or no (0)
critStages(1).TL = 0.7795;

%% Supercruise stage:
critStages(2).name = 'supercruise';
critStages(2).ref = 'b';
critStages(2).beta = getFuelFraction(6, 0);     %overall fuel fraction
critStages(2).M = 1.9;                         %Mach
critStages(2).h = 50e3 / m2ft;                   %altitude
critStages(2).a = 294.9;                  %Speed of sound
critStages(2).ab = 0;                           %Afterburner yes (2) or no (0)
critStages(2).TL = 0.6628;

%% Combat Turn 1:
critStages(3).name = 'Combat Turn 1';
critStages(3).ref = 'c';
critStages(3).beta = getFuelFraction(1, 1);     %overall fuel fraction
critStages(3).M = 1.4;                         %Mach
critStages(3).h = 50e3 / m2ft;                   %altitude
critStages(3).a = 294.9;                  %Speed of sound
critStages(3).ab = 1;                           %Afterburner yes (3) or no (0)
critStages(3).TL = 0.6946;

%% Combat Turn 2:
% critStages(4).name = 'Combat Turn 2';
% critStages(4).ref = 'd';
% critStages(4).beta = getFuelFraction(2, 1);     %overall fuel fraction
% critStages(4).M = 0.9;                         %Mach
% critStages(4).h = 50e3 / m2ft;                   %altitude
% critStages(4).a = 294.9;                  %Speed of sound
% critStages(4).ab = 1;                           %Afterburner yes (4) or no (0)


%% Combat Acceleration:
critStages(4).name = 'Combat Acceleration';
critStages(4).ref = 'e';
critStages(4).beta = getFuelFraction(3, 1);     %overall fuel fraction
critStages(4).M = 1.2;                         %Mach
critStages(4).h = 50e3 / m2ft;                   %altitude
critStages(4).a = 294.9;                  %Speed of sound
critStages(4).ab = 1;                           %Afterburner yes (5) or no (0)
critStages(4).TL = 0.7;

%% Maximum Speed
critStages(5).name = 'Maximum Speed';
critStages(5).ref = 'f';
critStages(5).beta = getFuelFraction(3,1);     %overall fuel fraction
critStages(5).M = 3;                         %Mach
critStages(5).h = 50e3 / m2ft;                   %altitude
critStages(5).a = 294.9;                  %Speed of sound
critStages(5).ab = 1;                           %Afterburner yes (6) or no (0)
critStages(5).TL = 0.4429;

%% Calculation for each stage:
for i = 1:5

    critStages(i).v = critStages(i).M * critStages(i).a;    %velocity
    critStages(i).alpha = getThrustLapse(critStages(i).h, critStages(i).v, critStages(i).ab);   %thrust lapse
    critStages(i).Treq = getThrustRequired(critStages(i).TL, WTO, critStages(i).alpha);      %thrust required for stage
    critStages(i).Freq = critStages(i).Treq / (instLosses * 100);
    critStages(i).Fava = getThrustAvailable(Tsl, critStages(i).h);
    critStages(i).Frat = critStages(i).Freq / critStages(i).Fava;

end
    
save(fileName, 'critStages');

fName = fileName;

end

