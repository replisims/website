+++
title = "Aim"
chapter = false
weight = 1
pre = "<b></b>"
+++

<style>
.column {
  float: left;
  width: 50%;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
</style>

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

{{< awesome fas fa-check >}}**The replication is reproducible**  

<!--{{%expand "More about this principle" %}}Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.{{% /expand%}}
-->
{{< awesome fas fa-check >}} **The replication is extendable**  

<!--{{%expand "More about this principle" %}}Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.{{% /expand%}}
-->
{{< awesome fas fa-check >}} **The replication tries to implement best practice recommendations**  

<!--{{%expand "More about this principle" %}}Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.{{% /expand%}}
-->
{{< awesome fas fa-check >}} **The replication is auditable**  

<!--{{%expand "More about this principle" %}}Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.{{% /expand%}}
-->
<!-- The replication is ...
-->
<!--{{%expand "More about this principle" %}}Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.{{% /expand%}}
-->
___ 

This can be acchieved with the following:

## {{< awesome fas fa-redo >}} Reproducibility measures
<div class="row">
  <div class="column">
  
### {{< awesome far fa-thumbs-up >}} Basic

- Use seeds
- State dependencies and computational environment
	</div>

<div class="column">

### {{< awesome fas fa-crown >}} Extended
- Run the simulation in a docker container
- Add a docker file

 </div>
</div>

## {{< awesome fas fa-expand-arrows-alt >}} Extendability measures
<div class="row">
  <div class="column">
 
### {{< awesome far fa-thumbs-up >}} Basic

- No magic numbers
- Function based workflow
- All simulation parameters should be changable
	</div>

<div class="column">

### {{< awesome fas fa-crown >}} Extended
- Code has provisions for user generated functions (e.g. for different distributions)
- Package format

 </div>
</div>

## {{< awesome fas fa-star >}} Best practice implementation
<div class="row">
  <div class="column">
  
### {{< awesome far fa-thumbs-up >}} Basic
- Style guide adherence
- Code commenting
	</div>

<div class="column">

### {{< awesome fas fa-crown >}} Extended
- Research compendium as R package
- Unit tests
- Shiny app for result visualization

 </div>
</div>