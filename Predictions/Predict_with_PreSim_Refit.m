%It uses previoulsy computed gmm clustering function to assign cell identity to simulated cells 
load('Reference_Set_Clusteringv5_Refit.mat','NewData', 'MixedGaussian');


Particles = NewData(1:10000,:); %Change to predict for a subset of the parameters
numPart = size(Particles,1);
NumClust = MixedGaussian{1}.NumComponents;


%Time step:
dt = 0.01;

%Time for solution approximation:
t0 = 0;
t1 = 3*24;

%Number of subintervals:
M = (t1-t0)/dt;

%Times
times = t1/12+1;


%Number of simulations:
nsimulations = 500;

%     1   2    3       4    5     6     7     8     9    10    11    12     13   14   15    16    17    18    19    20  21  22
%  p=[WNT,FGF,p011, p012, p013, p014, t001, t002, p111, p112, p113, p114, t101, t102,p101, p102, p103, p104, t011, t012, M, D];
npar=22;


%Initial condition:
y0 = [-1 0]';

%Model name:
model = 'VTD_Landscape_Model_Pred_v5';
syms x y;

%Number of mutants:
mutantstofit=14:20; %Choose mutants to simulate
nmutants = length(mutantstofit);


%Samples
samples = nsimulations*nmutants;


%Parameters that give an error in gm:
errorparams = [];

%Distance function handle:
distancehandle = str2func(strcat(model,'_AbsDistance_Gauss_Fates_PreSim'));

%New cell in the particles matrix:
%---------------------------------
NewData = zeros(numPart, npar);
NewFates = zeros(nmutants,times,NumClust,numPart); %NewFates(i,j,k,m) is the proportion of cells in cluster k at time j in Experiment i when using particle m.


disp('Start parallel pool');
p = parcluster('local');
parfor i=1:numPart
    paramaux = Particles(i,:);
    paramsimulations = paramaux;
    
    %Compute initial condition
    [y0, InitialCondition] = VTD_Landscape_Model_Fitting_v5_InitialCondition(x,y,paramaux,nsimulations,dt);
    
    NoiseX = randn(M,nsimulations)*sqrt(2*paramaux(end)*dt);
    NoiseY = randn(M,nsimulations)*sqrt(2*paramaux(end)*dt);
    
    paramsimulations(9:12) = paramaux(9:12)-paramaux(3:6);%w1
    paramsimulations(15:18) = paramaux(9:12)-paramaux(15:18);%w2
    paramsimulations(3:6) =  paramaux(3:6)-paramsimulations(15:18);%w0
    
    %Simulate specified experimental conditions  
    [~,fatesmatrix,errorcatched,paramcatched] = feval(distancehandle,t0,dt,t1,times,samples,InitialCondition,nsimulations,paramsimulations,NoiseX,NoiseY,mutantstofit,nmutants,NumClust, MixedGaussian{i});
    
    
    if (errorcatched==0)
        %Save the data in the matrix:
        NewData(i,:) = paramaux;
        NewFates(:,:,:,i) = fatesmatrix;
    else
        errorparams = [errorparams;paramcatched];
    end
    
    
end

save('Predictions_Refit.mat','NewFates','errorparams', 'mutantstofit','-v7.3')



%Predict_with_PreSim_Refit.m (c) by Elena
%Camacho Aguilar and Meritxell Saez Cornellana

%Predict_with_PreSim_Refit.m is licensed under a
%Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) Unported License.

%You should have received a copy of the license along with this
%work.  If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.
