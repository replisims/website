+++
title = "Repo"
weight = 15
+++

## Set up a Project repository
Each replication attempt lives in its on github repository within the [replisims organization](https://github.com/replisims).

### Basic setup and content
- Naming scheme: firstauthor-YYYY
- README
	* Contributors
	* Reference for original manuscript
	* workflow/ structure of the repository
	* Contributor statementes
- Licence
	* pick whatever licence you like
	* consider different licences for code and text

### Optional
- Make the repository [binder ready](https://mybinder.readthedocs.io/)
 `.binder/` directory.
- Add a dockerfile
- Add a makefile

### Suggestions
**Research compedium** 

I suggest using the structure commonly used for R packages with an adaptation for research compendia
as reccomended by Marwick et al.:  

Marwick, B., Boettiger, C., & Mullen, L. (2018). Packaging Data Analytical Work Reproducibly Using R (and Friends). *The American Statistician*, 72(1), 80–88. https://doi.org/10.1080/00031305.2017.1375986  

This can easily be implemented using the [rrtools` package](https://github.com/benmarwick/rrtools).

**Git**  

You don't have to use git I would higly recommend it though as it eases collaboration. See the [resources](/resources) section for some recommendations on how to get started.


