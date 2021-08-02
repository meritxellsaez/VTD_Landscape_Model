function priorOK=VTD_Landscape_Model_Fitting_v5_Relations_Constraints1(paramaux)

%Check relations between parameters. The time scale needs to be positive
%for all signal combinations

priorOK = 0;

if paramaux(7)+paramaux(13)>0 && paramaux(8)+paramaux(14)>0 && paramaux(7)+paramaux(19)>0 && paramaux(8)+paramaux(20)>0 && paramaux(7)+paramaux(13)+paramaux(19)>0 && paramaux(8)+paramaux(14)+paramaux(20)>0
    priorOK=1;
end

end

%VTD_Landscape_Model_Fitting_v5_Relations_Constraints1.m (c) by Elena
%Camacho Aguilar and Meritxell Saez Cornellana

%VTD_Landscape_Model_Fitting_v5_Relations_Constraints1.m is licensed under a
%Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) Unported License.

%You should have received a copy of the license along with this
%work.  If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.
