function alpha = getThrustLapse(h,v,a_b)
% formula from HOWE, based on BPR - please check
% not necessarily reliable above M=2.2, but whatever
% alpha = thrust ratio
% h = the altitude in m
% v = the velocity in ms^-1
% a_b = after burner, 1 or 0

BPR = 0.3; %from the rafael

[~, ~, ~, rho0] = atmosisa(0);
[~, a, ~, rho] = atmosisa(h);
[~, ~, ~, rho11] = atmosisa(11000);

sigma = rho / rho0;

M = v / a;

if M<=0.4
    if a_b==0
        K1=1;
        K2=0;
        K3=-0.2;
        K4=0.07;
    elseif a_b==1
        K1=1.32;
        K2=0.062;
        K3=-0.13;
        K4=-0.27;
        
    end
elseif M>0.4 && M<=0.9
    if a_b==0
        K1=0.856;
        K2=0.062;
        K3=0.16;
        K4=-0.23;
    elseif a_b==1
        K1=1.17;
        K2=-0.12;
        K3=0.25;
        K4=-0.17;
    end
elseif M>0.9
    if a_b==0
        K1=1;
        K2=-0.145;
        K3=0.5;
        K4=-0.05;
    elseif a_b==1
        K1=1.4;
        K2=0.03;
        K3=0.8;
        K4=0.4;
    end
end

%factor for afterburner (recheck when actual thrust values are found)
if a_b==1
    F_tau=1.3;
elseif a_b==0
    F_tau=1;
end

if M<0.9
    F_F0_M=F_tau*(K1+K2*BPR+(K3+K4*BPR)*M); %ratio due to mach
elseif M>0.9
    F_F0_M=F_tau*(K1+K2*BPR+(K3+K4*BPR)*(M-0.9)); %ratio due to mach
end

% account for altitude
s=0.8;
if h>11000
    sigma_11=rho11/rho0;
    F_F0_M=F_F0_M*sigma_11^s;
    s=1;
    sigma=rho/rho11;
end

alpha=F_F0_M*sigma^s;




end