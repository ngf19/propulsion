%% Master script for engine sizing - NGF19
%  Use this script to call all functions for engine sizing.
%
%  Written by A.Bates for NGF19 Prop and Sys Team ICL Aero GDP 2018/19.

%                       ** Begin Script **

%% Clear command window and workspace, close all figures:
clc();
clear();

close all;

%% Adding to path:
addpath functions;

%% Params:
T2W = 0.815657;
Wto = 30227 * 9.81;
Tsl = T2W * Wto;
Ne = 2;
%% Design Conditions:
m0 = 1.3 * 134 * Ne; %kg/s from Mikey
M0 = 1.9;
h0 = 15240;
% (Optimised for supercruise at cruise altitude)

%% Critical Stages of Flight:

load(getCritStages(Tsl, Wto));

Amax = getMaxInletArea(m0, 3, 18400);
