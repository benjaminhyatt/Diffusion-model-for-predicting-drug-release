# Diffusion-model-for-predicting-drug-release
This repository contains the following MATLAB files:

1. runODEgeldiff.m - the main script to execute 

The following are all (possibly) called by runODEgeldiff.m:
2. declareglobals.m - a script in which global variables are declared, and parameters for spline fit are set
3. geldiff.m - handles spatial discretization when calling ode23s from runODEgeldiff.m
4. splinefitweighted.m - generates weighted spline fits of D and h data (can also be called to create constant fits)
5. lsqexpfit.m - generates weighted exponential curve fits of D and h data
6. plotgeldiff.m - plots spline fits and release profile
7. plotgeldiffexp.m - plots exponential fits and release profile

We note the following:

1. The easiest way to run everything without data is to follow "Option 2", where one chooses constant values to approximate D(t) and h(t) for all t. If you have data (experimental, or otherwise), then you should format it correctly and load it in, inside of runODEgeldiff.m, where indicated. 

2. There are three main options for how D and h can be treated that are currently written inside of the above .m files (however, you are free to make your own modifications and try other approaches): "Option 1" generates weighted spline fits of specified order k1 (D), k2 (h), and breakpoints bp1 and bp2 (for D and h, resp.) making use of splinefitweighted.m; "Option 2" generates a constant spline fit (using splinefitweighted.m again for convenience) for D and another for h (clearly there are more efficient ways to do this - feel free to modify); "Option 3" generates weighted exponential curve fits of D and h making use of lsqexpfit.m

** To toggle between "Option 1", "Option 2", and "Option 3", you must comment out the two options not being used in runODEgeldiff.m. You should also do similarly in geldiff.m. **
