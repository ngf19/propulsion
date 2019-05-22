function Tava = getThrustAvailable(Tsl, h)
%GETTHRUSTAVAILABLE Returns thrust available at given altitude based on sea
%level thrust and density ratio:

[~, ~, ~, rhoSL] = atmosisa(0);
[~, ~, ~, rho] = atmosisa(h);

Tava = Tsl * rho / rhoSL;

end

