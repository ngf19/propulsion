function beta = getFuelFraction(stage, combat)
%GETFUELFRACTION Returns fuel fraction for a given stage:
%   Stage - Integer (>1) referencing stage of mission profile required.
%   Combat - 1 or 0 whether or not combat values are required:

fuelFractions =    [0.983700000000000    
                    0.967665690000000
                    0.930243250501720
                    0.839860916403899
                    0.790219862901405
                    0.777828839732827
                    0.764143659200891
                    0.758421282707563
                    0.745077560229131
                    0.745077560229131
                    0.672685904669042
                    0.659162538802579];

combatFractions =  [0.7860
                    0.7682
                    0.7550];                
if (combat == 1 && stage <= length(combatFractions))                
    beta = combatFractions(stage);
elseif (combat == 0 && stage <= length(fuelFractions))
    beta = fuelFractions(stage);
else
    disp("ERROR in function 'getFuelFraction', Fuel fraction for non-existant mission stage requested, returned beta = 1");
    beta = 1;
end
                
end

