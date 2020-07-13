+++
title = "Milestones"
weight = 5
+++


While you do not have to have the milestones ready by a certain date you can consider your replication to be split up into the following milestones.

## DGM

Data generating mechanism

This milestone is reached when you have code that can reproduce all the data generated in the original study.

Components:
A data frameame with all simulation scenarios.

A function that takes all simulation parameters as input and generates data based on that input.



## Method

In most cases your simulation studies will investigate a statistical method that is applied to the generated data.
Or compare multiple different methods applied to the data.

This milestone is reached  when you have implemented the method in accordance with the specifications in the original study and can apply it to the data you generated.


## Performance

Performance measures are the outcomes of a simulation study. 
This milestone is reached when you have implemented the performance measures for each method of your simulation.


## Result visualization/aggregation

The results havve to presented. This can be done in either the original form or in another format.
If you chose an improved result presentation it still has to be possible to compare the results of teh replication to the original.
This milestoneis completed when all the original results are represented in tables, figures or other format.

## Package

When all individual parts are completed you have to ensure that the "whole" can be run and easily transported between systems.
The easierst way to accomplish this is with a package.
This milestone is reached when all project components can be transfererred and rerun.

## Verification Report

All information that you have extracted from the original manuscript and the way it was translated to code must be documented.
Furthermore, replicator degrees of freedom i.e. any decisions that had to be made by the replicators have to be justified.