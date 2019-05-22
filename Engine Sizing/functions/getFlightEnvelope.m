function envelope = getFlightEnvelope(m)
%GETFLIGHTENVELOPE Returns series of points to be plotted of flight
%envelope for altitude vs Mach.

%Minimum time to climb profile (Mattingley Fig3.E2)
climbV =    [950 ,   0    ; 
            950 ,   11000;
            1050,   11000;
            1050,   11250;
            1200,   11250;
            1450,   15240];
            %1575,   18250];

[~, climba, ~, rho] = atmosisa(climbV(:,2));
        
climbM = climbV(:,1) / 2.281 ./  climba';
climbM = ones(6,1) * 0.85;
climbA = m ./ ((rho .* climba)' .* climbM);
envelope = [climbM, climbA];

end

