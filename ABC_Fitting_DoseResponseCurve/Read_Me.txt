How to run the ABCSMC optimisation:

1. Run Parallel_function_VTD_DR jobmax/njobsperbatch times with input parameter running from 1 to jobmax/njobsperbatch. 
    Each of these functions will generate (in parallel) njobsperbatch files containing Nmax/jobmax accepted parameter vectors each.

2. Run TORUNAFTERTHRESHOLD0_v2 to collect all parameters in a first file of results. This will display the threshold for the next loop.

3. Update Call_Parallel_function_VTD_AbsDist_Modelv5_v1 
4. Run Parallel_function_VTD jobmax/njobsperbatch times with input parameter running from 1 to jobmax/njobsperbatch. 
5. Run TORUNAFTERTHRESHOLDN_v2 to collect all parameters in a new file of results. This will display the threshold for the next loop.

Repeat 3-5 until the desired threshold is obtained.

Notes:
-The order and naming of the parameters is not exactly the same as in the associated paper Saez, Blassberg, Camacho-Aguilar et al. 2021
-The variables of the model are rotated 90 degrees with respect to the pictures and equations presented in the paper Saez, Blassberg, Camacho-Aguilar et al. 2021