
function Parallel_function_VTD_Refit(n)

% Details for batch
struc = Call_Parallel_function_VTD_AbsDist_Modelv5Refit_v1(n);

% Number of parallel computations:
jobmax = struc.jobmax;
jobsvector = struc.jobsvector;
EpTvector = struc.EpTvector;
names = struc.names;
loopept=struc.loopept;
% Number of particles:
Nmax = struc.Nmax;
namedata = struc.namedata;
model = struc.model;
ABCversion = struc.ABCversion;
weightsdistances = struc.weightsdistances;
pathtodata = struc.pathtodata;
mutantstofit = struc.mutantstofit;
parfitnumbers = struc.parfitnumbers;
EpT = EpTvector(1:loopept);
namenewdata = [namedata,names{loopept}];
NoClassifiedOption = struc.NoClassifiedOption;
%Random number generator stream:
nthresholdsEpT = length(EpT);
streamnum = 2*nthresholdsEpT-1;
nparfit = length(parfitnumbers);
T = length(EpT)-1;
Tmax = length(EpT);
Numberofparticleseachjob = Nmax/jobmax;
covarianceOLCMhandle = str2func(strcat(model,'_CovarianceMatricesOLCM'));
% Check if we have previous data
if T==0
    PreviousData=[];
    CovarianceMatricesParticles = [];
else
    load([pathtodata,'/',namedata],'ParticlesMatrix')
    PreviousData = ParticlesMatrix{1,T};
    CovarianceMatricesParticles = feval(covarianceOLCMhandle,PreviousData,parfitnumbers,nparfit,Nmax,EpT(T+1));
end
% Create job in cluster:
p = parcluster('local');
Jobs = createJob(p);
for jobnum = jobsvector
    createTask(Jobs,str2func(ABCversion),0,{mutantstofit,parfitnumbers,EpT,T,Tmax,Nmax,Numberofparticleseachjob,PreviousData,namenewdata,CovarianceMatricesParticles,NoClassifiedOption,weightsdistances,streamnum,jobnum});
    disp(['Job ',num2str(jobnum),' created']);
end
disp('Submiting job.......................')
submit(Jobs);
disp('Submitted!')
disp('Waiting for it to finish............')
wait(Jobs);
delete(Jobs)
clear Jobs
disp('Finished!')
exit
end

%Parallel_function_VTD_Refit.m (c) by Elena Camacho Aguilar

%Parallel_function_VTD_Refit.m is licensed under a
%Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) Unported License.

%You should have received a copy of the license along with this
%work.  If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.
