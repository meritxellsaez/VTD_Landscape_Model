
%Load the parameters accepted in the last round of the Refit fitting algorithm
load('20_11_11_5Mut_SENSITIVITYNEWPRIORS_ABCMv5_10000part_500sim_21par_Eps4_Eps3p38_Eps2p92_Eps2p51_Eps2p21Eps1p99_Eps1p82_Eps1p7_Eps1p62_Eps1p55_Eps1p5_Eps1p45.mat',...
    'ParticlesMatrixaux');

numPart = size(ParticlesMatrixaux,1); %Change to use a subset of the particles

%%Set global constants for the simulation process

%Time step:
dt = 0.01;

%Time for solution approximation:
t0 = 0;
t1 = 3*24;
tspan=t0:dt:t1;

%Number of subintervals:
M = (t1-t0)/dt;

%Times to be saved
times = floor(t1/12+1); 


%Number of simulations:
nsimulations = 500;

%%Parameters
%     1   2    3       4    5     6     7     8     9    10    11    12     13   14   15    16    17    18    19    20  21  22
%  p=[WNT,FGF,p011, p012, p013, p014, t001, t002, p111, p112, p113, p114, t101, t102,p101, p102, p103, p104, t011, t012, M, D];

npar=22;

%Initial condition:
y0 = [-1 0]';

%Model name:
model = 'VTD_Landscape_Model_Pred_v5';
syms x y;

%Number of mutants:
mutantstofit=[1,2,3,4,5,6,7];
nmutants = length(mutantstofit);

%Samples
samples = nsimulations*nmutants;

%Parameters that give an error in gm:
errorparams = [];

%Clustering parameters
NumDims = 2;
NumClust = 7;
Initial.mu = [-0.5,0; 0,-0.5; 1,1.2; 0,-3; 2,-3; 1,-1; 1,-2];%initial condition for the clustering so we know the population correspondence
Initial.Sigma = zeros(NumDims,NumDims,NumClust);
for i = 1:NumClust
    Initial.Sigma(:,:,i) = 0.25*eye(NumDims,NumDims);
end
Initial.ComponentProportion = (1./NumClust)*ones(1,NumClust);



%Distance function handle:
distancehandle = str2func(strcat(model,'_AbsDistance_Gauss_Fates_GenSim'));

%Initialise variables
NewData = zeros(numPart, npar);
NewFates = zeros(nmutants,times,NumClust,numPart); %NewFates(i,j,k,m) is the proportion of cells in cluster k at time j in Experiment i when using particle m.
MixedGaussian = cell(1, numPart);
PartToUse = 1:numPart;%Change to a subset of indices if not all particles used

Particles = ParticlesMatrixaux(PartToUse,1:npar);

%simulate the particles:
%-------------------
p = parcluster('local');
parfor i=1:numPart
    paramaux = Particles(i,:);
    paramsimulations = paramaux;
    
    %Generate initial condition
    [y0, InitialCondition] = VTD_Landscape_Model_Fitting_v5_InitialCondition(x,y,paramaux,nsimulations,dt);
    
    NoiseX = randn(M,nsimulations)*sqrt(2*paramaux(end)*dt);
    NoiseY = randn(M,nsimulations)*sqrt(2*paramaux(end)*dt);
    
    paramsimulations(9:12) = paramaux(9:12)-paramaux(3:6);%w1
    paramsimulations(15:18) = paramaux(9:12)-paramaux(15:18);%w2
    paramsimulations(3:6) =  paramaux(3:6)-paramsimulations(15:18);%w0
    
    %Compute trajectories (not used here), proportions and gmm clustering function
    [~,fatesmatrix,errorcatched,paramcatched, gmfit] = feval(distancehandle,t0,dt,t1,times,samples,InitialCondition,nsimulations,paramsimulations,NoiseX,NoiseY,mutantstofit,nmutants,NumClust,Initial);
    disp(num2str(i));
    
    if (errorcatched==0)
        %Save the data in the matrix:
        NewData(i,:) = paramaux;
        NewFates(:,:,:,i) = fatesmatrix;
        MixedGaussian{i} = gmfit;
    else
        errorparams = [errorparams;paramcatched];
    end
    
    
end

save('/home/meritxellsaez/VTD_3way/Prediction/Reference_Set_Clusteringv5_Refit.mat', 'NewData', 'NewFates', 'errorparams','MixedGaussian', '-v7.3');

%Simulate_all_mutants_Refit.m (c) by Meritxell Saez Cornellana

%Simulate_all_mutants_Refit.m is licensed under a
%Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) Unported License.

%You should have received a copy of the license along with this
%work.  If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.

