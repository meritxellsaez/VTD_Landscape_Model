
% This function computes a covariance matrix for each of the particles of the previous
% step in order to be used as covariance matrix in a multivariate normal
% perturbation kernel centered at that particle.

%% Input
% 
% * *ParticlesMat*: Particles of the previous step
% * *parfitnumbers*: Component numbers of the parameter vector that
% correspond to the parameters that we are fitting
% * *nparfit*: number of parameters that we are fitting
% * *Nmax*: Number of particles computed in the previous step
% * *EpT*: Threshold of the new step

%% Output
%
% * *CovMats*: It's a 3 dimensional matrix which element (i,j,k) is the
% covariance of parameters i and parameter j of the covariance matrix
% corresponding to particle k.

%%

function [CovMats,pcheck] = VTD_Landscape_Model_Fitting_v5DR_CovarianceMatricesOLCM(ParticlesMat,parfitnumbers,nparfit,Nmax,EpT)

GoodParticlesIndices = find((ParticlesMat(:,end-1)<EpT)|(ParticlesMat(:,end-1)==EpT));

NGoodParticles = length(GoodParticlesIndices);

GoodParticlesMatrix = ParticlesMat(GoodParticlesIndices,:);

GoodParticlesMatrix(:,end) = GoodParticlesMatrix(:,end)/sum(GoodParticlesMatrix(:,end)); % Normalise the weights

m = zeros(1,nparfit); %Mean good particles weighted

for i = 1:NGoodParticles
    
    m = m + GoodParticlesMatrix(i,end)*GoodParticlesMatrix(i,parfitnumbers);
    
end

GoodParticles = GoodParticlesMatrix(:,parfitnumbers); %It contains only the components of the parameters that we are fitting

A = zeros(nparfit); %It contains the variance of the good particles

for i = 1:NGoodParticles
    
    GoodPartCentered = GoodParticles(i,:)-m;
    
    A = A + GoodParticlesMatrix(i,end)*(GoodPartCentered'*GoodPartCentered);
    
end
    
CovMats = zeros(nparfit);
pcheck = [];

for i = 1:Nmax
    
    B = m-ParticlesMat(i,parfitnumbers);
    
    CovMats(:,:,i) = A+ (B'*B);
    
    [~,paux]=chol(CovMats(:,:,i));
    pcheck=[pcheck,paux];
    
end

sum(pcheck)

%%

%VTD_Landscape_Model_Fitting_v5DR_CovarianceMatricesOLCM.m (c) by Elena Camacho Aguilar

%VTD_Landscape_Model_Fitting_v5DR_CovarianceMatricesOLCM.m is licensed under a 
%Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) Unported License.

%You should have received a copy of the license along with this
%work.  If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.
    