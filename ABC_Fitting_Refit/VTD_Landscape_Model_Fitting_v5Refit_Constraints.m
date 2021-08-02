function priorOK=VTD_Landscape_Model_Fitting_v5Refit_Constraints(paramaux)

priorOK = 0;

if paramaux(22)>1.e-5
    priorOK=1;
end

%VTD_Landscape_Model_Fitting_v5Refit_Constraints.m (c) by Elena
%Camacho Aguilar and Meritxell Saez Cornellana

%VTD_Landscape_Model_Fitting_v5Refit_Constraints.m is licensed under a
%Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) Unported License.

%You should have received a copy of the license along with this
%work.  If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.