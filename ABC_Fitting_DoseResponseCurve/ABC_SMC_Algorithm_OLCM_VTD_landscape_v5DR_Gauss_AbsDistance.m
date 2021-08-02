function ABC_SMC_Algorithm_OLCM_VTD_landscape_v5DR_Gauss_AbsDistance(mutantstofit,parfitnumbers,EpT,T,Tmax,Nmax,Numberofparticleseachjob,PreviousData,namenewdata,CovarianceMatricesParticles,NoClassifiedOption,weightsdistances,streamnum,jobnum)
try
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %
    %                         ABC SMC ALGORITHM
    %                   Optimal Local Covariance Matrix
    %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                               INPUT VARIABLES
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % * *mutantstofit*: Vector containing the number of the mutants that we are
    % going to fit.
    % * *parfitnumbers*: Vector containing the number of the parameters that we
    % are going to fit.
    % * *EpT*: Vector containing the thresholds that we are going to use for
    % the algorithm.
    % * *T*: Number of steps that we have done in the thresholds. For computing the first
    % threshold, T=0. For the second threshold, T=1.
    % * *Tmax*: Number of maximum number of steps in thresholds. For computing
    % one threshold, Tmax=1. For the second one, Tmax=2.
    % * *Nmax*: Number of total particles that we are considering.
    % * *jobnum*: Number of the parallel subset of particles that we are
    % computing.
    % * *Numberofparticleseachjob*: Number of particles that we will compute in
    % this job.
    % * *PreviousData*: Matrix containing the particles and distances from the
    % previous iteration.
    % * *namenewdata* : Name of the Workspace of the new data set.
    % * *CovarianceMatricesParticles*: Local covariance matrix of the normal
    % perturbation kernel for each particle.
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                               CONSTANTS
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
        
    %Maximum number of steps:
    MaxStep = 1.e6;
    
    %Set the stream of random number generators:
    %-------------------------------------------
    
    reset(RandStream.getGlobalStream) %reset the random stream
    
    substreamnum = jobnum; %number of substream
    
    cmrg = RandStream.create('mrg32k3a','NumStreams',100,'StreamIndices',streamnum);
    RandStream.setGlobalStream(cmrg)
    cmrg.Substream = substreamnum;
    
    % To solve critical points equations
    syms x y
    
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
    
    %Number of parameters:
    npar = 24;
    
    %     1   2    3       4    5     6     7     8     9    10    11    12     13   14   15    16    17    18    19    20  21  22
    %  p=[WNT,FGF,p011, p012, p013, p014, t001, t002, p111, p112, p113, p114, t101, t102,p101, p102, p103, p104, t011, t012, M, D];
    
    
    %Number of parameters to fit:
    nparfit = length(parfitnumbers);
    
    %Initial parameters:
    %initpar = [0,   1,   1,0,0.2,-2,0.5,0.3, 0.6,0.5,-0.5,-1.6,0.,0., -9.4,-4.5,0,-1.6,0.,0.,20, 1,0.5,0.01];
    
    %Initial condition:
    y0 = [-0.5 0]';
    
    %Model name:
    model = 'VTD_Landscape_Model_Fitting_v5DR';
    
    
    %Number of mutants:
    nmutants = length(mutantstofit);
    
    %Samples
    samples = nsimulations*nmutants;
    
    
    %Load data for clustering: 
    load('DataProp150420_ClusteredDataWithThd_DRfit.mat','DataToFit')
    
    %Clustering parameters
    NumDims = 2;
    NumClust = 7;
    Initial.mu = [-0.5,0; 0,-0.5; 1,1.2; 0,-3; 2,-3; 1,-1; 1,-2];
    Initial.Sigma = zeros(NumDims,NumDims,NumClust);
    for i = 1:NumClust
        Initial.Sigma(:,:,i) = 0.25*eye(NumDims,NumDims);
    end
    Initial.ComponentProportion = (1./NumClust)*ones(1,NumClust);
      
    
    %DON'T NEED TO CHANGE:
    %---------------------
    
    %Priors function handle:
    priorshandle = str2func(strcat(model,'_Priors')); 
    
    %Distance function handle:
    distancehandle = str2func(strcat(model,'_AbsDistance_Gauss_Fates'));
    
    %Density function prior handle:
    evalpriorshandle = str2func(strcat(model,'_EvalPriors')); 
    
    %Density function kernel handle:
    evalkernelhandle = str2func(strcat(model,'_EvalKernels')); 
    
    
    if isfile([namenewdata,'_',num2str(jobnum, '%02d'),'.mat'])%Load partial results if execution was interrupted
        load([namenewdata,'_',num2str(jobnum, '%02d'),'.mat'],'NewData','NewFates');
        N= size(NewData,1);
        if N==Numberofparticleseachjob
            return;
        end
        substreamnum = jobnum+200;
        cmrg.Substream = substreamnum;
    else
        
        N = 0;
        NewData = [];
        NewFates = zeros(nmutants,times,NumClust,Numberofparticleseachjob); %NewFates(i,j,k,m) is the proportion of cells in cluster k at time j in Experiment i when using particle m.
        
    end
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                               SAMPLER T=0
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    if T==0
        tic
        
        %Update threshold number:
        %------------------------
        
        T = T+1;
        i = 0;
        
        %Set new threshold so that the threshold for each mutant is EpT(T):
        %------------------------------------------------------------------
        newEpT = EpT(T);
        
        
        % Timer: %local change
        fileID = fopen(['MonitoringJob_',num2str(jobnum, '%02d'),'.txt'],'a');
        
        %Find the particles:
        %-------------------
        while (N<Numberofparticleseachjob)&&(i<MaxStep)
            
             if rem(i,1000)==0
%                 disp('---------------------------------------------------')
%                 disp('---------------------------------------------------')
%                 disp(strcat('            Threshold: ',num2str(EpT(T))));
%                 disp(strcat('            Job number: ',num2str(jobnum)));
%                 disp(strcat('            Step: ',num2str(i)));
%                 disp(strcat('            Accepted particles: ',num2str(N)));
%                 disp('---------------------------------------------------')
%                 disp('---------------------------------------------------')
             
             fprintf(fileID,['N=',num2str(N),' i=',num2str(i), '\n']);
            
             end
            
            %Update steps:
            %-------------
            
            i = i+1;
            
        %Sample parameter values:
        %------------------------
            particlenum = randsample(Nmax,1); %Take particle from distribution of accepted particles
            paramaux = [PreviousData(particlenum,1:21),0,0,PreviousData(particlenum,22)];
          
            parami = 1;
            
            while (parami<=numel(parfitnumbers))
                paramifit = parfitnumbers(parami); %Parameter number
                
                paramaux(paramifit) = feval(priorshandle,paramifit); %Sample a value
                parami = parami+1;
                
            end
            
            %Generate initial condition with sampled EPI position and noise for nsimulations points
            [y0, InitialCondition] = VTD_Landscape_Model_Fitting_v5DR_InitialCondition(x,y,paramaux,nsimulations,dt);
            
            
            %Simulate dynamical system 
            
            if y0(1)<0
                NoiseX = randn(M,nsimulations)*sqrt(2*paramaux(end)*dt);
                NoiseY = randn(M,nsimulations)*sqrt(2*paramaux(end)*dt);
              
                paramsimulations = paramaux;
                %Convert parameters p into w to simulate
                paramsimulations(9:12) = paramaux(9:12)-paramaux(3:6);%w1
                paramsimulations(15:18) = paramaux(9:12)-paramaux(15:18);%w2
                paramsimulations(3:6) =  paramaux(3:6)-paramsimulations(15:18);%w0
                
                
                [distances,fatesmatrix,errorcatched] = feval(distancehandle,t0,dt,t1,times,samples,InitialCondition,nsimulations,paramsimulations,NoiseX,NoiseY,mutantstofit,nmutants,DataToFit,NumClust,Initial);
                
                totaldistance = sum(distances'.*weightsdistances);
                
                
                %ACCEPT THE PARTICLE OR NOT DEPENDING ON THE DISTANCE:
                %-----------------------------------------------------
                if (errorcatched==0)&&(totaldistance<=newEpT)
                    
                    %Count that a new particle has been found:
                    N = N+1;
                    
                    %Save the data in the matrix:
                    NewData = [NewData; paramaux, distances', totaldistance,1];
                    NewFates(:,:,:,N) = fatesmatrix;
                    %Save each parameter in case of failure. Saving only at the end reduces execution time
                   save([namenewdata,'_',num2str(jobnum, '%02d')],'newEpT','NewData','NewFates','streamnum','substreamnum','i')
                end                
            end
            
            
            eltime=toc;
            
        end
         fclose(fileID);

    end
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                               SAMPLER T>0
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    if (T>0)&&(T<Tmax)
        tic
        %Update threshold number:
        %------------------------
        
        T = T+1;
        i = 0;
        
        %Set new threshold so that the threshold for each mutant is EpT(T):
        %------------------------------------------------------------------
        newEpT = EpT(T);
        
        
        %Weights of each particle:
        %-------------------------
        w0 = PreviousData(:,end);
        
        fileID = fopen(['MonitoringJob_',num2str(jobnum, '%02d'),'.txt'],'a');
        
        %Find the particles:
        %-------------------
        while (N<Numberofparticleseachjob)&&(i<MaxStep)
            
             if rem(i,1000)==0
%                 disp('---------------------------------------------------')
%                 disp('---------------------------------------------------')
%                 disp(strcat('            Threshold: ',num2str(EpT(T))));
%                 disp(strcat('            Job number: ',num2str(jobnum)));
%                 disp(strcat('            Step: ',num2str(i)));
%                 disp(strcat('            Accepted particles: ',num2str(N)));
%                 disp('---------------------------------------------------')
%                 disp('---------------------------------------------------')
             
             fprintf(fileID,['N=',num2str(N),' i=',num2str(i), '\n']);
            
             end
            
            
            %Update steps:
            %-------------
            
            i = i+1;
            
            
            %SAMPLE THE NEXT PARTICLE:
            %-------------------------
            
            %Computing the next particle:
            %-----------------------------
            particlenum = randsample(Nmax,1,true,w0);
            paramaux = PreviousData(particlenum,1:npar); %Sample a particle from the previous step and take the parameters that we are fitting
            newcomponentsparamaux = mvnrnd(paramaux(parfitnumbers),CovarianceMatricesParticles(:,:,particlenum)); % Use multivariate normal perturbation kernel to find new particle.
            
            
            %Check if the new components are valid:
            %-------------------------------------
            valuepriors = zeros(1,nparfit);
            
            parami = 0;  %Initialise loop variable
            
            priorOK = 1;  %It will keep track that all the prior evaluated at every parameter is not 0
            
            while (parami<nparfit)&&(priorOK)  %Only if priorOK is not 0 and parami<npar the while loop will stop
                
                parami = parami+1;
                paramifit = parfitnumbers(parami);
                provparvalue = newcomponentsparamaux(parami); %Take the parami component of the new candidate vector that contains the new values of the parameters that we are fitting.
                
                priorOK = feval(evalpriorshandle,provparvalue,paramifit); 
                valuepriors(parami) = priorOK;
                
                paramaux(paramifit) = provparvalue;
                
            end
            
           
            %Compute initial condition
            [y0, InitialCondition] = VTD_Landscape_Model_Fitting_v5DR_InitialCondition(x,y,paramaux,nsimulations,dt);
            
            
            %Simulate dynamical system and check threshold
            
            if priorOK && y0(1)<0
                NoiseX = randn(M,nsimulations)*sqrt(2*paramaux(end)*dt);
                NoiseY = randn(M,nsimulations)*sqrt(2*paramaux(end)*dt);
                   
                paramsimulations = paramaux;
                paramsimulations(9:12) = paramaux(9:12)-paramaux(3:6);%w1
                paramsimulations(15:18) = paramaux(9:12)-paramaux(15:18);%w2
                paramsimulations(3:6) =  paramaux(3:6)-paramsimulations(15:18);%w0
                
                [distances,fatesmatrix,errorcatched] = feval(distancehandle,t0,dt,t1,times,samples,InitialCondition,nsimulations,paramsimulations,NoiseX,NoiseY,mutantstofit,nmutants,DataToFit,NumClust,Initial);
                
                totaldistance = sum(distances'.*weightsdistances);
                
                
                %ACCEPT THE PARTCILE OR NOT DEPENDING ON THE DISTANCE:
                %-----------------------------------------------------
                
                if (errorcatched==0)&&totaldistance<=newEpT
                    
                    %Count that a new particle has been found:
                    N = N+1;
                    
                    %Compute the weight of the particle:
                    denominator = 0;
                    
                    for partic=1:Nmax
                        denominator = denominator+w0(partic)*feval(evalkernelhandle,newcomponentsparamaux,PreviousData(partic,parfitnumbers),CovarianceMatricesParticles(:,:,partic));
                   end
                    
                    w1 = prod(valuepriors)/denominator; %We multiply the priors of each component of the parameter vector to compute the value of the prior of the parameter vector
                    
                    NewData = [NewData; paramaux, distances', totaldistance,w1];
                    NewFates(:,:,:,N) = fatesmatrix;
                    save([namenewdata,'_',num2str(jobnum, '%02d')],'newEpT','NewData','NewFates','streamnum','substreamnum','i')
               end
                
            end
            
        end
        eltime=toc;
        fclose(fileID);
    end
    
    if T<2
        save([namenewdata,'_',num2str(jobnum, '%02d')],'newEpT','NewData','NewFates','streamnum','substreamnum','eltime','i','errorparams')
    else
        save([namenewdata,'_',num2str(jobnum, '%02d')],'newEpT','NewData','NewFates','streamnum','substreamnum','eltime','i','errorparams')
    end
    reset(RandStream.getGlobalStream)
    
    
catch ME
    fileID = fopen(['DetailedError_',num2str(jobnum, '%02d'),'.txt'],'a');
    fprintf(fileID,getReport(ME,'extended'));
    fclose(fileID);
    save(['paramFatesM5v3_',num2str(jobnum, '%02d')], '-v7.3');
end

%ABC_SMC_Algorithm_OLCM_VTD_landscape_v5DR_Gauss_AbsDistance.m (c) by Elena
%Camacho Aguilar and Meritxell Saez Cornellana

%ABC_SMC_Algorithm_OLCM_VTD_landscape_v5DR_Gauss_AbsDistance.m is licensed under a
%Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) Unported License.

%You should have received a copy of the license along with this
%work.  If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.

