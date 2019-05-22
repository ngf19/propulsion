function Treq = getThrustRequired(T2W, W, alpha)
%GETTHRUSTCRI Gives required thrust at altitude using thrust at sea level.

Treq = T2W * W * alpha;
end

