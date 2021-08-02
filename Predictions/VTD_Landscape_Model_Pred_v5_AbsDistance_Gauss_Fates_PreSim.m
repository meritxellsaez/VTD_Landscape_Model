function [simulations,fatesmatrix,errorcatched,paramcatched] = VTD_Landscape_Model_Pred_v5_AbsDistance_Gauss_Fates_PreSim(t0,dt,t1,times,samples,InitialCondition,nsimulations,paramsimulations,NoiseX,NoiseY,mutantstofit,nmutants,NumClust,gmfit)

errorcatched = 0;
paramcatched = [];

simulations = zeros(2,times,samples);
fatesmatrix = zeros(nmutants,times,NumClust);


for mutantnumber = 1:nmutants

    simulations(:,:,1+nsimulations*(mutantnumber-1):nsimulations*mutantnumber) =...
        VTD_Landscape_Model_Pred_v5_AbsDistance_Gauss_Fates_EachMut(t0,dt,t1,InitialCondition,nsimulations,paramsimulations,NoiseX,NoiseY,mutantstofit(mutantnumber));
end

    

%% Assign fates using originally computed gmm
    fatesaux = zeros(samples,times);
    for i=1:times
        fatesaux(:,i) = cluster(gmfit, squeeze(simulations(:,i,:))');
    end
    for mutantnumber = 1:nmutants
        for clusternumber = 1 :NumClust
            fatesmatrix(mutantnumber, :, clusternumber) = sum(fatesaux(1+nsimulations*(mutantnumber-1):nsimulations*mutantnumber,:)==clusternumber,1)/nsimulations;
        end
    end
        
    
end



%VTD_Landscape_Model_Pred_v5_AbsDistance_Gauss_Fates_PreSim.m (c) by Elena
%Camacho Aguilar and Meritxell Saez Cornellana

%VTD_Landscape_Model_Pred_v5_AbsDistance_Gauss_Fates_PreSim.m is licensed under a
%Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) Unported License.

%You should have received a copy of the license along with this
%work.  If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.