function simulations = VTD_Landscape_Model_Pred_v5_AbsDist_Gauss_Fates_EachMut_sim(t0,dt,t1,InitialCondition,nsimulations,paramsimulations,NoiseX,NoiseY,mutantnumber, times)


%---------------------------------------------------------------------------------------------
%---------------------------------------------------------------------------------------------
if mutantnumber == 1        %NoChir
    
    tMediaChanges = [t0;24;t1]; % Times at which there was a media change (time in hours), and the final time
    nMediaChanges = length(tMediaChanges)-1;
    
    %                 WNT    FGF
    pMediaChanges = [  0      1   paramsimulations(3:end); ...
        0    0.9   paramsimulations(3:end)];
    
    Mmediachanges = [0; cumsum((tMediaChanges(2:end) - tMediaChanges(1:end-1))/dt)];
    
    simulations = simulationEulerVTD_vectorised_sim(t0,dt,times,nsimulations,InitialCondition,nMediaChanges,Mmediachanges,pMediaChanges,NoiseX,NoiseY);
    
    %---------------------------------------------------------------------------------------------
    %---------------------------------------------------------------------------------------------
    
elseif mutantnumber == 2    %Chir2-3
    
    tMediaChanges = [t0;24;t1]; % Times at which there was a media change (time in hours), and the final time
    nMediaChanges = length(tMediaChanges)-1;
    
    %                     WNT    FGF
    pMediaChanges = [  1      1   paramsimulations(3:end); ...
        0    0.9   paramsimulations(3:end)];
    
    Mmediachanges = [0; cumsum((tMediaChanges(2:end) - tMediaChanges(1:end-1))/dt)];
    
    simulations = simulationEulerVTD_vectorised_sim(t0,dt,times,nsimulations,InitialCondition,nMediaChanges,Mmediachanges,pMediaChanges,NoiseX,NoiseY);
    %---------------------------------------------------------------------------------------------
    %---------------------------------------------------------------------------------------------
    
elseif mutantnumber == 3    %Chir2-4
    
    tMediaChanges = [t0;24;48;t1]; % Times at which there was a media change (time in hours), and the final time
    nMediaChanges = length(tMediaChanges)-1;
    
    %                 WNT    FGF
    pMediaChanges = [  1      1   paramsimulations(3:end); ...
        1    0.9   paramsimulations(3:end); ...
        0    0.9   paramsimulations(3:end)];
    
    Mmediachanges = [0; cumsum((tMediaChanges(2:end) - tMediaChanges(1:end-1))/dt)];
    
    simulations = simulationEulerVTD_vectorised_sim(t0,dt,times,nsimulations,InitialCondition,nMediaChanges,Mmediachanges,pMediaChanges,NoiseX,NoiseY);
    
    %---------------------------------------------------------------------------------------------
    %---------------------------------------------------------------------------------------------
    
elseif mutantnumber == 4    %Chir2-5
    
    tMediaChanges = [t0;24;t1]; % Times at which there was a media change (time in hours), and the final time
    nMediaChanges = length(tMediaChanges)-1;
    
    %                 WNT    FGF
    pMediaChanges = [  1      1   paramsimulations(3:end); ...
        1    0.9   paramsimulations(3:end)];
    
    Mmediachanges = [0; cumsum((tMediaChanges(2:end) - tMediaChanges(1:end-1))/dt)];
    
    simulations = simulationEulerVTD_vectorised_sim(t0,dt,times,nsimulations,InitialCondition,nMediaChanges,Mmediachanges,pMediaChanges,NoiseX,NoiseY);
    
    %---------------------------------------------------------------------------------------------
    %---------------------------------------------------------------------------------------------
    
elseif mutantnumber == 5    %Chir2-5_FGF2-3
    
    tMediaChanges = [t0;24;t1]; % Times at which there was a media change (time in hours), and the final time
    nMediaChanges = length(tMediaChanges)-1;
    
    %                 WNT    FGF
    pMediaChanges = [  1      1   paramsimulations(3:end); ...
        1      0   paramsimulations(3:end)];
    
    Mmediachanges = [0; cumsum((tMediaChanges(2:end) - tMediaChanges(1:end-1))/dt)];
    
    simulations = simulationEulerVTD_vectorised_sim(t0,dt,times,nsimulations,InitialCondition,nMediaChanges,Mmediachanges,pMediaChanges,NoiseX,NoiseY);
    %---------------------------------------------------------------------------------------------
    %---------------------------------------------------------------------------------------------
    
elseif mutantnumber == 6    %Chir2-5_FGF2-4
    
    tMediaChanges = [t0;48;t1]; % Times at which there was a media change (time in hours), and the final time
    nMediaChanges = length(tMediaChanges)-1;
    
    %                 WNT    FGF
    pMediaChanges = [  1      1   paramsimulations(3:end); ...
        1      0   paramsimulations(3:end)];
    
    Mmediachanges = [0; cumsum((tMediaChanges(2:end) - tMediaChanges(1:end-1))/dt)];
    
    simulations = simulationEulerVTD_vectorised_sim(t0,dt,times,nsimulations,InitialCondition,nMediaChanges,Mmediachanges,pMediaChanges,NoiseX,NoiseY);
    %---------------------------------------------------------------------------------------------
    %---------------------------------------------------------------------------------------------
    
    
elseif mutantnumber == 7    %Chir2-5_FGF2-5
    
    tMediaChanges = [t0;t1]; % Times at which there was a media change (time in hours), and the final time
    nMediaChanges = length(tMediaChanges)-1;
    
    %                 WNT    FGF
    pMediaChanges = [  1      1   paramsimulations(3:end)];
    
    Mmediachanges = [0; cumsum((tMediaChanges(2:end) - tMediaChanges(1:end-1))/dt)];
    
    simulations = simulationEulerVTD_vectorised_sim(t0,dt,times,nsimulations,InitialCondition,nMediaChanges,Mmediachanges,pMediaChanges,NoiseX,NoiseY);
    
    %---------------------------------------------------------------------------------------------
    %---------------------------------------------------------------------------------------------
    
end
end

%VTD_Landscape_Model_Pred_v5_AbsDistance_Gauss_Fates_GenSim.m (c) by
%Meritxell Saez Cornellana and Elena Camacho Aguilar

%VTD_Landscape_Model_Pred_v5_AbsDistance_Gauss_Fates_GenSim.m is licensed under a
%Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) Unported License.

%You should have received a copy of the license along with this
%work.  If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.