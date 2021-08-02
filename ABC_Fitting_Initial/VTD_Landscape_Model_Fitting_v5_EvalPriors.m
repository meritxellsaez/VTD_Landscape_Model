function priorvalue=VTD_Landscape_Model_Fitting_v5_EvalPriors(compparamvalue,paramnumber)

%Evaluate priors of the parameters. Note that the order differs from the
%associated paper Saez, Blassberg, Camacho-Aguilar et al. 2021


if paramnumber==1
    %WNT
    
elseif paramnumber == 2
    %FGF
    
elseif paramnumber == 3
    %p011
    priorvalue = pdf('Uniform',compparamvalue, 0.5,1.5);
    
elseif paramnumber == 4
    %p012
    priorvalue = pdf('Uniform',compparamvalue,-0.5,0);
    
elseif paramnumber == 5
    %p013
    priorvalue = pdf('Uniform',compparamvalue,0,1);
elseif paramnumber == 6
    %p014
    priorvalue = pdf('Uniform',compparamvalue,-3,-0.5);
    
elseif paramnumber == 7
    %t001
    priorvalue = pdf('Uniform',compparamvalue,0,1);
    
elseif paramnumber == 8
    %t002
    priorvalue = pdf('Uniform',compparamvalue,0,1);
    
elseif paramnumber == 9
    %p111
    priorvalue = pdf('Uniform',compparamvalue,0,1);
elseif paramnumber == 10
    %p112
    priorvalue = pdf('Uniform',compparamvalue,0,1);
elseif paramnumber == 11
    %p113
    priorvalue = pdf('Uniform',compparamvalue,-1,0);
elseif paramnumber == 12
    %p114
    priorvalue = pdf('Uniform',compparamvalue,-2,0);
elseif paramnumber == 13
    %t101
    priorvalue = pdf('Uniform',compparamvalue,-1,1);
    
elseif paramnumber == 14
    %t102
    priorvalue = pdf('Uniform',compparamvalue,-1,1);
    
elseif paramnumber == 15
    %p101
    priorvalue = pdf('Uniform',compparamvalue,-12,0);
    
elseif paramnumber == 16
    %p102
    priorvalue = pdf('Uniform',compparamvalue,-6,0);
    
elseif paramnumber == 17
    %p103
    priorvalue = pdf('Normal',compparamvalue,0,0.2);
elseif paramnumber == 18
    %p104
    priorvalue = pdf('Gamma',-compparamvalue,9.8,0.14);
elseif paramnumber == 19
    %t011
    priorvalue = pdf('Uniform',compparamvalue,-1,1);
    
elseif paramnumber == 20
    %t012
    priorvalue = pdf('Uniform',compparamvalue,-1,1);
elseif paramnumber == 21
    %M
    priorvalue = pdf('Uniform',compparamvalue,12,36);
elseif paramnumber == 22
    %D
    priorvalue = pdf('Uniform',compparamvalue,0,0.1);
    
end

%VTD_Landscape_Model_Fitting_v5_EvalPriors.m (c) by Elena
%Camacho Aguilar and Meritxell Saez Cornellana

%VTD_Landscape_Model_Fitting_v5_EvalPriors.m is licensed under a
%Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) Unported License.

%You should have received a copy of the license along with this
%work.  If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.
