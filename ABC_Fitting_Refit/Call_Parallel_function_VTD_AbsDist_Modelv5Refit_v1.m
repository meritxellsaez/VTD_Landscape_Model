function struc = Call_Parallel_function_VTD_AbsDist_Modelv5Refit_v1(Mut,nbatch)

%%This first block will change in each iteration, updating the threshold
%%depending on the results. One can make the updating manual, dynamic or fix
%%everything from the start

EpTvector = [4];%Thresholds used for the ABC acceptance. Update 

names = cell(1,1);
names{1} = {'_Eps4'};%ending of saved files in different iterations

loopept=1;

namedata = {'20_11_11_5Mut_SENSITIVITYNEWPRIORS_ABCMv5_10000part_500sim_21par'};

pathtodata = '.';%path to the functions and data


%%What follows is fixed for all the fitting procedure
% Mutants to fit:
mutantstofit = [1,3,4,5,6]; %experimental conditions used in fitting as in VTD_Landscape_Model_Fitting_v5Refit_AbsDist_Gauss_Fates_EachMut

weightsdistances = ones(1,length(mutantstofit))/length(mutantstofit);

NoClassifiedOption = 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Number of particles:
Nmax = 10000;

% Number of jobs max:
jobmax = 200;    %Each task will compute Nmax/jobmax particles

% N jobs per batch:
njobsperbatch = 5; %There needs to be jobmax/njobsperbatch calls to Parallel_function_... functions

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Parameters to fit:
parfitnumbers = 3:22;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Model:
model = 'VTD_Landscape_Model_Fitting_v5Refit'; 

% ABC version:
ABCversion = 'ABC_SMC_Algorithm_OLCM_VTD_landscape_v5Refit_Gauss_AbsDistance';

% Vector of jobs for the batch:
jobsvector = ((nbatch-1)*njobsperbatch + 1): njobsperbatch*nbatch;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

struc = struct('pathtodata',pathtodata,'EpTvector',EpTvector,'names',names,'loopept',loopept,'Nmax',Nmax,'namedata',namedata,'mutantstofit',mutantstofit,'parfitnumbers',parfitnumbers,'model',model,'ABCversion',ABCversion,'jobsvector',jobsvector,'jobmax',jobmax,'weightsdistances',weightsdistances,'NoClassifiedOption',NoClassifiedOption);

end

%Call_Parallel_function_VTD_AbsDist_Modelv5Refit_v1.m (c) by Elena Camacho Aguilar

%Call_Parallel_function_VTD_AbsDist_Modelv5Refit_v1.m is licensed under a
%Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) Unported License.

%You should have received a copy of the license along with this
%work.  If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.