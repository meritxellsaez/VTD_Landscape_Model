function [y0, simulations]=VTD_Landscape_Model_Fitting_v5DR_InitialCondition(x,y,paramaux,nsimulations,dt)

mapped = paramaux(3:4);
eqns = [mapped(1)+1*2*x+3*x^2+4*x^3-4*y^2==0, mapped(2)-4*2*x*y+4*y^3==0];
vars = [x,y];
[critpointsx,critpointsy] = solve(eqns,vars);%Compute attractors of the landscape

critpointsrewritten = vpa([critpointsx,critpointsy]);
vector = find(sum(abs(imag(critpointsrewritten)),2)==0);%Keep only real valued solutions

critpoints = double(critpointsrewritten(vector, :));

critpoints = sortrows(critpoints);

y0 = critpoints(1,:); %EPI attractor correspons to attractor with smallest x coordinate. Note that variables here are 90 degrees roatted wrt paper

dist = vecnorm(y0-critpoints(2,:));

M=50;%Run simulation for 50 time steps to obtain distribution around EPI attractor

if y0(1)<0
    
    y0=y0';
    InitialCondition = repmat(y0,1,nsimulations);
    NoiseX = randn(M,nsimulations)*sqrt(2*paramaux(end)*dt);
    NoiseY = randn(M,nsimulations)*sqrt(2*paramaux(end)*dt);
    paramsimulations = paramaux;
     %Transform p parameters into w to simulate
    paramsimulations(9:12) = paramaux(9:12)-paramaux(3:6);%w1
    paramsimulations(15:18) = paramaux(9:12)-paramaux(15:18);%w2
    paramsimulations(3:6) =  paramaux(3:6)-paramsimulations(15:18);%w0
    paramsimulations(1:2) = [0, 1]; %Signalling fixed to No CHIR + FGF to generate initial condition
    
    simulations = simulationEulerVTD_vectorised_Initial(0,dt,M*dt,nsimulations,InitialCondition,1,[0,M],paramsimulations,NoiseX,NoiseY);
    if max(vecnorm(simulations-y0))>dist %If points end up far from EPI we discard that initial condition
        y0=[10,10];
    end
else
    simulations = [];
end

end

%VTD_Landscape_Model_Fitting_v5DR_InitialCondition.m (c) by Elena
%Camacho Aguilar and Meritxell Saez Cornellana

%VTD_Landscape_Model_Fitting_v5DR_InitialCondition.m is licensed under a
%Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) Unported License.

%You should have received a copy of the license along with this
%work.  If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.
