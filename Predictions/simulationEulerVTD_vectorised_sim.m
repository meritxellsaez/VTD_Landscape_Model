function sol=simulationEulerVTD_vectorised_sim(t0,dt,times,nsimulations,InitialCondition,nMediaChanges,Mmediachanges,pMediaChanges,NoiseX,NoiseY)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                        %
%          v1 Vertebrate Trunk Development Euler-Maruyama                %
%                                                                        %
%  By using the Euler Scheme:                                            %
%  This programme compute nsimulations simulations, and for each         %
%  simulation we discretise the time interval into subintervals,         %
%  saving 12 hour mesurement points of the simulation.                   %                                           
%                                                                        %
%  sol is a matrix: can be a matrix of solutions for each simulation or  %
%  a vector giving the proportion of times that the cells fell in each   %
%  basin of attraction.                                                  %
%                                                                        %                                              
%                                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


modeleq=str2func('VTD_Landscape_Model_Sim_v5');
simulateddata = zeros(2+6+3,times, nsimulations);

                            
%Simulations indicated by experimental conditions (mutants)
%------------  
    
ChirTime = 0;

Xprev=InitialCondition;     %Set the initial point for all cells
simulateddata(1:2,1,:)=InitialCondition;%Save initial condition
simulateddata(3:11,1,:)=repmat([pMediaChanges(3:8), 0,1,0]',1,nsimulations); %Save parameters used in the simulation
measurement =1;
             
for mediachange = 1:nMediaChanges

   for timestep=(Mmediachanges(mediachange)+1):Mmediachanges(mediachange+1)

       [dtfprev,ChirTime,params]=modeleq(t0+(timestep-1)*dt,Xprev,...
           pMediaChanges(mediachange,:),dt, ChirTime );       %Evaluate f at the previous state
        Xprev=Xprev+dt*dtfprev+[NoiseX(timestep,:);NoiseY(timestep,:)];  %Renew the state taking an Euler Step
        
        
    if t0+timestep*dt==measurement*12 %Save simulation state at the chosen points
       simulateddata(:,measurement+1,:)=[Xprev;repmat(params',1,nsimulations)];
       measurement =measurement+1; 
    end

   end

end

sol=simulateddata;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%

%simulationEulerVTD_vectorised_sim.m (c) by Elena Camacho Aguilar

%simulationEulerVTD_vectorised_sim.m is licensed under a
%Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) Unported License.

%You should have received a copy of the license along with this
%work.  If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.