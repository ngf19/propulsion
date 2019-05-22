function A0Ref = getA0Ref(m, M, h)
%GETA0REF Returns the A0 required for opitmal operation at design
%conditions.
%   Based on Mattingley, Section 6.2.4.
%   %INPUTS:    - m - mass flow rate [kg/s]
%               - M - Mach number []
%               - h - altitude [m]

[~, a, ~, rho] = atmosisa(h);

A0Ref = m / (rho * M * a);

end

