function [A1] = getInletArea()
%GETINLETAREA Returns the inlet area required for an aircraft engine.
%   Based on Mattingley, Section 6.2.4.
    
%                       ** Begin Function **

%% Estimate subsonic area bound:
% Assume 4% safety margin at M1 = 0.8 to allow for boundary layer
% displacement.
% A1 sizing point (from Fig 6.11 Mattingley) = 1.07
% Choked area ratio for M1 = 0.8 is 1.038.

A_subsonic = 1.04 * 1.038 * 1.07;


end

