function simulations = VTD_Landscape_Model_Fitting_v5_AbsDist_Gauss_Fates_EachMut(t0,dt,t1,InitialCondition,nsimulations,paramsimulations,NoiseX,NoiseY,mutantnumber)

%Specify signaling conditions for the initial training
%---------------------------------------------------------------------------------------------
%---------------------------------------------------------------------------------------------
if mutantnumber == 1        %NoC_180814
    
    tMediaChanges = [t0;24;t1]; % Times at which there was a media change (time in hours), and the final time
    nMediaChanges = length(tMediaChanges)-1;
    
    %                 WNT    FGF  %Replace first two elements of vector to choose signals
    pMediaChanges = [  0      1   paramsimulations(3:end); ...
        0    0.9   paramsimulations(3:end)];
    
    Mmediachanges = [0; cumsum((tMediaChanges(2:end) - tMediaChanges(1:end-1))/dt)];
    
    simulations = simulationEulerVTD_vectorised_v2(t0,dt,t1,nsimulations,InitialCondition,nMediaChanges,Mmediachanges,pMediaChanges,NoiseX,NoiseY);
    
    
    %---------------------------------------------------------------------------------------------
    %---------------------------------------------------------------------------------------------
    
elseif mutantnumber == 2    %C23_180814
    
    tMediaChanges = [t0;24;t1]; % Times at which there was a media change (time in hours), and the final time
    nMediaChanges = length(tMediaChanges)-1;
    
    %                     WNT    FGF
    pMediaChanges = [  1      1   paramsimulations(3:end); ...
        0    0.9   paramsimulations(3:end)];
    
    Mmediachanges = [0; cumsum((tMediaChanges(2:end) - tMediaChanges(1:end-1))/dt)];
    
    simulations = simulationEulerVTD_vectorised_v2(t0,dt,t1,nsimulations,InitialCondition,nMediaChanges,Mmediachanges,pMediaChanges,NoiseX,NoiseY);
    
    %---------------------------------------------------------------------------------------------
    %---------------------------------------------------------------------------------------------
    
elseif mutantnumber == 3    %C24_180814
    
    tMediaChanges = [t0;24;48;t1]; % Times at which there was a media change (time in hours), and the final time
    nMediaChanges = length(tMediaChanges)-1;
    
    %                 WNT    FGF
    pMediaChanges = [  1      1   paramsimulations(3:end); ...
        1    0.9   paramsimulations(3:end); ...
        0    0.9   paramsimulations(3:end)];
    
    Mmediachanges = [0; cumsum((tMediaChanges(2:end) - tMediaChanges(1:end-1))/dt)];
    
    simulations = simulationEulerVTD_vectorised_v2(t0,dt,t1,nsimulations,InitialCondition,nMediaChanges,Mmediachanges,pMediaChanges,NoiseX,NoiseY);
    
    %---------------------------------------------------------------------------------------------
    %---------------------------------------------------------------------------------------------
    
elseif mutantnumber == 4    %C25_180814
    
    tMediaChanges = [t0;24;t1]; % Times at which there was a media change (time in hours), and the final time
    nMediaChanges = length(tMediaChanges)-1;
    
    %                 WNT    FGF
    pMediaChanges = [  1      1   paramsimulations(3:end); ...
        1    0.9   paramsimulations(3:end)];
    
    Mmediachanges = [0; cumsum((tMediaChanges(2:end) - tMediaChanges(1:end-1))/dt)];
    
    simulations = simulationEulerVTD_vectorised_v2(t0,dt,t1,nsimulations,InitialCondition,nMediaChanges,Mmediachanges,pMediaChanges,NoiseX,NoiseY);
    
    %---------------------------------------------------------------------------------------------
    %---------------------------------------------------------------------------------------------
    
elseif mutantnumber == 5    %C25_F23_180814
    
    tMediaChanges = [t0;24;t1]; % Times at which there was a media change (time in hours), and the final time
    nMediaChanges = length(tMediaChanges)-1;
    
    %                 WNT    FGF
    pMediaChanges = [  1      1   paramsimulations(3:end); ...
        1      0   paramsimulations(3:end)];
    
    Mmediachanges = [0; cumsum((tMediaChanges(2:end) - tMediaChanges(1:end-1))/dt)];
    
    simulations = simulationEulerVTD_vectorised_v2(t0,dt,t1,nsimulations,InitialCondition,nMediaChanges,Mmediachanges,pMediaChanges,NoiseX,NoiseY);
    
    %---------------------------------------------------------------------------------------------
    %---------------------------------------------------------------------------------------------
    
elseif mutantnumber == 6    %C25_F24_180814
    
    tMediaChanges = [t0;48;t1]; % Times at which there was a media change (time in hours), and the final time
    nMediaChanges = length(tMediaChanges)-1;
    
    %                 WNT    FGF
    pMediaChanges = [  1      1   paramsimulations(3:end); ...
        1      0   paramsimulations(3:end)];
    
    Mmediachanges = [0; cumsum((tMediaChanges(2:end) - tMediaChanges(1:end-1))/dt)];
    
    simulations = simulationEulerVTD_vectorised_v2(t0,dt,t1,nsimulations,InitialCondition,nMediaChanges,Mmediachanges,pMediaChanges,NoiseX,NoiseY);
    
    %---------------------------------------------------------------------------------------------
    %---------------------------------------------------------------------------------------------
    
elseif mutantnumber == 7    %C25_F25_180814
    
    tMediaChanges = [t0;t1]; % Times at which there was a media change (time in hours), and the final time
    nMediaChanges = length(tMediaChanges)-1;
    
    %                 WNT    FGF
    pMediaChanges = [  1      1   paramsimulations(3:end)];
    
    Mmediachanges = [0; cumsum((tMediaChanges(2:end) - tMediaChanges(1:end-1))/dt)];
    
    simulations = simulationEulerVTD_vectorised_v2(t0,dt,t1,nsimulations,InitialCondition,nMediaChanges,Mmediachanges,pMediaChanges,NoiseX,NoiseY);
    
    %---------------------------------------------------------------------------------------------
    %---------------------------------------------------------------------------------------------
end

%VTD_Landscape_Model_Fitting_v5_AbsDist_Gauss_Fates_EachMut.m(c) by Elena Camacho Aguilar and Meritxell Saez Cornellana

%VTD_Landscape_Model_Fitting_v5_AbsDist_Gauss_Fates_EachMut.m is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) Unported License.

%You should have received a copy of the license along with this
%work.  If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.
