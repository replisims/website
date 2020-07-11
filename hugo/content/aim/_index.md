+++
title = "Aim"
chapter = false
weight = 1
pre = "<b></b>"
+++
<head>
  <link href="/your-path-to-fontawesome/css/all.css" rel="stylesheet"> <!--load all styles -->
</head>
<a id="aim"></a>
___

## ReScience: Repetition, Reproduction & Replication
The terms *repetition*, *reproduction* and *replication* are not used consistently used.
For scientific experiments they are distinguashable by the following properties: 
team and experimental setup (location, procedure, instrument, conditions).

A **Repetition** is carried out by the same team using the same setup.
 
A **Reproduction** is carried out by different individuals using the same experimental setup. I.e. running the same software on the same input data.

A **Replication**  of a pulished result involves writing and running new code based on the decription provided in the original publication aiming at obtaining the same results.

This followes the definition of [Rougier et al. (2017)](https://arxiv.org/abs/1707.04393).

___

## Replication principles  

![](<i class='fas fa-check'></i>) **The replication is reproducible**  

<!--{{%expand "More about this principle" %}}Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.{{% /expand%}}
-->
<i class="fas fa-check"></i> **The replication is extendable**  

<!--{{%expand "More about this principle" %}}Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.{{% /expand%}}
-->
<i class="fas fa-check"></i> **The replication tries to implement best practice recommendations**  

<!--{{%expand "More about this principle" %}}Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.{{% /expand%}}
-->
<i class="fas fa-check"></i> **The replication is auditable**  

<!--{{%expand "More about this principle" %}}Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.{{% /expand%}}
-->
<!-- The replication is ...
-->
<!--{{%expand "More about this principle" %}}Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.{{% /expand%}}
-->
___ 

This can be acchieved with the following:

## Reproducibility measures

### Basic

- Use seeds
- State dependencies and computational environment

### Extended
- Run the simulation in a docker container
- Add a docker file


## Extendability measures

### Basic

- No magic numbers
- Function based workflow
- All simulation parameters should be changable

### Extended
- Code has provisions for user generated functions (e.g. for different distributions)
- Package format

## Best practice implementation

### Basic
- Style guide adherence
- Code commenting

### Extended
- Research compendium as R package
- Unit tests
- Shiny app for result visualization

