function kernelvalue = VTD_Landscape_Model_Fitting_v5_EvalKernels(newparticle,particleprevstep,CovMat)

kernelvalue = mvnpdf(newparticle,particleprevstep,CovMat);

end

%VTD_Landscape_Model_Fitting_v5_EvalKernels.m (c) by Elena Camacho Aguilar

%VTD_Landscape_Model_Fitting_v5_EvalKernels.m is licensed under a
%Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) Unported License.

%You should have received a copy of the license along with this
%work.  If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.