+++
title = "Milestones"
weight = 5
+++


While you do not have to have the milestones ready by a certain date you can consider your replication to be split up into the following milestones.

## DGM

Data generating mechanism

This milestone is reached when you have code that can reproduce all the data generated in the original study.

### DGM Components
- A **data frameame** with all simulation scenarios.

- A **function** that takes all simulation parameters (fixed AND variable) as input and generates data based on that input.



## Method

In most cases your simulation studies will investigate a statistical method that is applied to the generated data.
Or compare multiple different methods applied to the data.

This milestone is reached  when you have implemented the method in accordance with the specifications in the original study and can apply it to the data you generated.


## Performance measures

Performance measures are the outcomes of a simulation study. 
This milestone is reached when you have implemented the performance measures for each method of your simulation.


## Results 

The results have to compiled. In a basic version your code creates an object where the results can be found in any form that can easily be related to the original publication.
You can also represent your results in a more "printable" manner i.e. table or figure form.
You are hereby not bound to the original representation in the manuscript.
If you chose an improved result presentation it still has to be possible to compare the results of the replication to the original.
This milestone is completed when all the original results are represented in any format.

## Package

When all individual parts are completed you have to ensure that the "whole" can be run and easily transported between systems.
The easierst way to accomplish this is with a package.
This milestone is reached when all project components can be transfererred and rerun by an independent reviewer.

## Documentation

All information that you have extracted from the original manuscript must be documented.
Furthermore, replicator degrees of freedom i.e. any decisions that had to be made by the replicators have to be justified.

You can get a doi for your endproduct via zenodo and add your part to the project's zenodo community:  
https://zenodo.org/communities/replisims/

<iframe src="https://zenodo.org/communities/codecheck". ,</iframe>