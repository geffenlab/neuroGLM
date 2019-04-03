neuroGLM
=========================

This is a fork of the neuroGLM repo from the Pillow lab. See the original repository for more information. 

Below is a list of changes made to this fork of the repo.

### Changelog
-------------------------

#### 4.3.19
- When convolving temporal bases with non-sparse data, the function is changed to pad the data vector with 0 at the beginning.
- The design matrix and response vectors have been turned made non-sparse. This sped up calculations by quite a bit, likely because of the regressors being used.
- Added an alternative neg loglikelihood and posterior function. This is mainly just to have a function formatted better for the scripts that use this fork
