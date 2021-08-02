function pvalue=VTD_Landscape_Model_Fitting_v5_Priors(paramnumber)

%Sample from priors of the parameters. Note that the order differs from the
%associated paper Saez, Blassberg, Camacho-Aguilar et al. 2021

if paramnumber==1
    %WNT
    
elseif paramnumber == 2
    %FGF
    
elseif paramnumber == 3
    %p011
    pvalue = random('Uniform',0.5,1.5);
    
elseif paramnumber == 4
    %p012
    pvalue = random('Uniform',-0.5,0);
    
elseif paramnumber == 5
    %p013
    pvalue = random('Uniform',0,1);
elseif paramnumber == 6
    %p014
    pvalue = random('Uniform',-3,-0.5);
    
elseif paramnumber == 7
    %t001
    pvalue = random('Uniform',0,1);
    
elseif paramnumber == 8
    %t002
    pvalue = random('Uniform',0,1);
elseif paramnumber == 9
    %p111
    pvalue = random('Uniform',0,1);
elseif paramnumber == 10
    %p112
    pvalue = random('Uniform',0,1);
elseif paramnumber == 11
    %p113
    pvalue = random('Uniform',-1,0);
elseif paramnumber == 12
    %p114
    pvalue = random('Uniform',-2,0);
elseif paramnumber == 13
    %t101
    pvalue = random('Uniform',-1,1);
    
elseif paramnumber == 14
    %t102
    pvalue = random('Uniform',-1,1);
    
elseif paramnumber == 15
    %p101
    pvalue = random('Uniform',-12,0);
    
elseif paramnumber == 16
    %p102
    pvalue = random('Uniform',-6,0);
    
elseif paramnumber == 17
    %p103
    pvalue = random('Normal',0,0.2);
elseif paramnumber == 18
    %p104
    pvalue = -random('Gamma',9.8,0.14);
elseif paramnumber == 19
    %t011
    pvalue = random('Uniform',-1,1);
    
elseif paramnumber == 20
    %t012
    pvalue = random('Uniform',-1,1);
elseif paramnumber == 21
    %M
    pvalue = random('Uniform',12,36);
elseif paramnumber == 22
    %D
    pvalue = random('Uniform',0,0.1);
    
end

%VTD_Landscape_Model_Fitting_v5_Priors.m (c) by Elena
%Camacho Aguilar and Meritxell Saez Cornellana

%VTD_Landscape_Model_Fitting_v5_Priors.m is licensed under a
%Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) Unported License.

%You should have received a copy of the license along with this
%work.  If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.


