%% Master script for engine sizing - NGF19
%  Use this script to call all functions for engine sizing.
%
%  Written by A.Bates for NGF19 Prop and Sys Team ICL Aero GDP 2018/19.

%                       ** Begin Script **

%% Clear command window and workspace, close all figures:
clc();
clear();

close all;

%% Params:
T2W = 0.815657;
Wto = 30227;
Tsl = T2W * Wto;

%% Critical Stages of Flight:

load(getCritStages(Tsl));