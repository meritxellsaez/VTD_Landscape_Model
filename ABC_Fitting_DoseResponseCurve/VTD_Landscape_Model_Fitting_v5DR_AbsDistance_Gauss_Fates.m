function [distances,fatesmatrix,errorcatched] = VTD_Landscape_Model_Fitting_v5DR_AbsDistance_Gauss_Fates(t0,dt,t1,times,samples,InitialCondition,nsimulations,paramsimulations,NoiseX,NoiseY,mutantstofit,nmutants,datamutants,NumClust,Initial)

errorcatched = 0;

simulations = zeros(2,times,samples);
fatesmatrix = zeros(nmutants,times,NumClust);


for mutantnumber = 1:nmutants

    simulations(:,:,1+nsimulations*(mutantnumber-1):nsimulations*mutantnumber) =...
        VTD_Landscape_Model_Fitting_v5DR_AbsDist_Gauss_Fates_EachMut(t0,dt,t1,InitialCondition,nsimulations,paramsimulations,NoiseX,NoiseY,mutantstofit(mutantnumber));
    
end

    
%% ClusterData

    Data = reshape(simulations, [2,times*samples])';
    
    try %The gmm fit of the simulations may not work in some cases
        gmfit = fitgmdist(Data, NumClust,'CovarianceType','full',...
            'SharedCovariance',false, 'Options',statset('MaxIter', 300), 'Start', Initial);
    catch
       distances = 100*ones(nmutants,1);
       fatesmatrix = [];
       errorcatched = 1;
       return;     
    end
    
    if max(vecnorm((gmfit.mu(1:6,:)-Initial.mu(1:6,:))'))>0.5 %Check that the states correspond to the predefined regions of the plane
       distances = 100*ones(nmutants,1);
       fatesmatrix = [];
       errorcatched = 1;
       return;
    end

%% Assign fates
    fatesaux = zeros(samples,times);

    for i=1:times
        fatesaux(:,i) = cluster(gmfit, squeeze(simulations(:,i,:))');
    end
   
    for mutantnumber = 1:nmutants
        for clusternumber = 1 :NumClust
            fatesmatrix(mutantnumber, :, clusternumber) = sum(fatesaux(1+nsimulations*(mutantnumber-1):nsimulations*mutantnumber,:)==clusternumber,1)/nsimulations;
        end
    end
    
%% Compute distance
    
    distances = sum(squeeze(sum(abs(datamutants - fatesmatrix),2)),2);
    
    
end

%VTD_Landscape_Model_Fitting_v5DR_AbsDistance_Gauss_Fates.m (c) by Elena
%Camacho Aguilar and Meritxell Saez Cornellana

%VTD_Landscape_Model_Fitting_v5DR_AbsDistance_Gauss_Fates.m is licensed under a
%Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) Unported License.

%You should have received a copy of the license along with this
%work.  If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.
