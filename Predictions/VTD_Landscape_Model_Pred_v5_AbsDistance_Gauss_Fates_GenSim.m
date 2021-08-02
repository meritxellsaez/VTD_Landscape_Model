function [simulations,fatesmatrix,errorcatched,paramcatched, gmfit] = VTD_Landscape_Model_Pred_v5_AbsDistance_Gauss_Fates_GenSim(t0,dt,t1,times,samples,InitialCondition,nsimulations,paramsimulations,NoiseX,NoiseY,mutantstofit,nmutants,NumClust,Initial)

errorcatched = 0;
paramcatched = [];

simulations = zeros(2+6+3,times,samples);
fatesmatrix = zeros(nmutants,times,NumClust);

%Generate simulations
for mutantnumber = 1:nmutants

    simulations(:,:,1+nsimulations*(mutantnumber-1):nsimulations*mutantnumber) =...
        VTD_Landscape_Model_Pred_v5_AbsDist_Gauss_Fates_EachMut_sim(t0,dt,t1,InitialCondition,nsimulations,paramsimulations,NoiseX,NoiseY,mutantstofit(mutantnumber), times);

end

    
%% ClusterData

    Data = reshape(simulations(1:2,:,:), [2,times*samples])';
    try
        gmfit = fitgmdist(Data, NumClust,'CovarianceType','full',...
            'SharedCovariance',false, 'Options',statset('MaxIter', 300), 'Start', Initial);
    catch
       
       fatesmatrix = [];
       errorcatched = 1;
       paramcatched = paramsimulations;
       return;     
    end

%% Assign fates
    fatesaux = zeros(samples,times);
    for i=1:times
        fatesaux(:,i) = cluster(gmfit, squeeze(simulations(1:2,i,:))');
    end
        
    for mutantnumber = 1:nmutants
        for clusternumber = 1 :NumClust
            fatesmatrix(mutantnumber, :, clusternumber) = sum(fatesaux(1+nsimulations*(mutantnumber-1):nsimulations*mutantnumber,:)==clusternumber,1)/nsimulations;
        end
    end
        
    
end

%VTD_Landscape_Model_Pred_v5_AbsDistance_Gauss_Fates_GenSim.m (c) by
%Meritxell Saez Cornellana and Elena Camacho Aguilar

%VTD_Landscape_Model_Pred_v5_AbsDistance_Gauss_Fates_GenSim.m is licensed under a
%Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) Unported License.

%You should have received a copy of the license along with this
%work.  If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.