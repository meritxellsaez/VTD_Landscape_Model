In order to predict new experimental conditions we need to be sure that we have enough points around all attractors to properly define the gmm model. 
The first thing we need to do is generate the reference simulations to ensure this.
For this, execute Simulate_all_mutants.m / Simulate_all_mutants_Refit.m Depending on the parameter values being considered (Initial/Refit)

Then, one can use Predict_with_PreSim.m / Predict_with_PreSim_Refit.m to simulate any experimental conditions previously defined in VTD_Landscape_Model_Pred_v5_AbsDistance_Gauss_Fates_EachMut.m