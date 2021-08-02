function pvalue=VTD_Landscape_Model_Fitting_v5DR_Priors(paramnumber)

%Sample from priors of the parameters. Note that the order differs from the
%associated paper Saez, Blassberg, Camacho-Aguilar et al. 2021
%Only parameters 22 and 23 are fitted for DR fitting run


if paramnumber==1
    %WNT
    
elseif paramnumber == 2
    %FGF

elseif paramnumber == 3
    %p011

elseif paramnumber == 4
    %p012
        
elseif paramnumber == 5
    %p013
       
elseif paramnumber == 6
    %p014
        
elseif paramnumber == 7
    %t001
        
elseif paramnumber == 8
    %t002
       
elseif paramnumber == 9
    %p111
        
elseif paramnumber == 10
    %p112
        
elseif paramnumber == 11
    %p113
        
elseif paramnumber == 12
    %p114
        
elseif paramnumber == 13
    %t101
        
elseif paramnumber == 14
    %t102
         
elseif paramnumber == 15
    %p101

elseif paramnumber == 16
    %p102
        
elseif paramnumber == 17
    %p103
         
elseif paramnumber == 18
    %p104
       
elseif paramnumber == 19
    %t011        
        
elseif paramnumber == 20
    %t012
        
elseif paramnumber == 21
    %M
        
elseif paramnumber == 22
    %lambda
         pvalue = random('Uniform',0,10);
elseif paramnumber == 23
    %mu
         pvalue = random('Uniform',0,1);
elseif paramnumber == 24
    %D
      
end

%VTD_Landscape_Model_Fitting_v5DR_Priors.m (c) by Elena
%Camacho Aguilar and Meritxell Saez Cornellana

%VTD_Landscape_Model_Fitting_v5DR_Priors.m is licensed under a
%Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) Unported License.

%You should have received a copy of the license along with this
%work.  If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.    
    
  