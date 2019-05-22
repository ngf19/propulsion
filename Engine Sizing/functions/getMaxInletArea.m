function A1 = getMaxInletArea(m, M, h)
%GETINLETAREA Returns the inlet area required for an aircraft engine.
%   Based on Mattingley, Section 6.2.4.
%   %INPUTS:    - m - Max mass flow rate [kg/s]
%               - M - Max Mach number []
%               - h - Max altitude [m]
%
%                       ** Begin Function **

%Discretise M and h:
M = linspace(0, M, 100)';
h = linspace(0, h, 6);

[~, a, ~, rho] = atmosisa(h);

A = m ./ ((rho .* a) .* M);

plot(M, A);
legend(cellstr(num2str(round(h' / 1000, 1) * 1000)))

hold on;

env = getFlightEnvelope(m);

plot(env(:,1), env(:,2), 'k');
ylim([0,10]);
%% Estimate subsonic area bound (move to seperate function):
% Assume 4% safety margin at M1 = 0.8 to allow for boundary layer
% displacement.
% A1 sizing point (from Fig 6.11 Mattingley) = 1.07
% Choked area ratio for M1 = 0.8 is 1.038.

%A_subsonic = 1.04 * 1.038 * 1.07;

[~,A1] = ginput(1);
end

