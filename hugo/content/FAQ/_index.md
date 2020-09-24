+++
title = "FAQ"
chapter = false
weight = 19
pre = "<b></b>"
+++
___

## Questions Regarding the Implementation of the Replication

### Do I have to work in R?
No, using R is not mandatory. However, two aspects have to be kept in mind when choosing a different software solution.
(1) You will have to find someone that is familiar with the language you would like to use. 
(2) The idea of replicability being closely related to open science calls for an implementation that itself is openly accessible i.e. an open source tool (see also our [replication principles](/aim/#replication-principles)).
 
### Does the replication have to be implemented in the same software environment as the original?
No. In theory the study results should not depend on the software environment used for the implementation. We strive for a replication that is openly accessible and reproducible i.e. implemented with open source tools [replication principles](/aim/#replication-principles)).
It can, however, be necessary to familiarize oneself with the software originally used to gain a better understanding of the internals of the algorithms that were likely used.

### Should I contact the author to ask for code or in case of uncertainties.
Whether or not you contact the original study author to ask for code or additional information is up to you.
If you decide to do so, please, carefully archive the correspondence as well as all materials received. 
However, keep in mind that waiting for a reply might take a while and require several reminders/attempts in searching for current contact data. 
We hence advise that you either contact the authors right before the replication or try implementing the replication independently and contact them after your best attempt.
An exception might be if the manuscript explicitly refers to a simulation protocol or supplemental materials but these cannot be obtained (e.g. due to a broken link).
Should your replication attempt result in large deviations from the original, 
and those discrepancies remain after thorough review, 
we will contact the original author before publication.

### Can I improve the original study?
Yes, and no. If you think the implementation of the original simulation does not correspond to the state of the art and can be improved you are very welcome to do so. 
However, this improvement should be implemented in the form of an extension. 
Your primary goal is to reproduce the original results based on the details provided by the authors.
You can (in a second step) implement improvements and rerun the simulation.
The results of your improvement can be reported alongisde the original replication.
Sometimes the line between improving and reproducing is admittedly somewhat blurred.
Imagine the following scenario: The authors report that they have simulated data with a mean of 2. 
From some result figure, however, it is evident that the mean cannot possibly have been anywhere near 2.
Unless you have reason to believe that the 2 is a typo (and it should have been 3 or 0.2) or have any other 
explanation on how the discrepency of the text and the figure came to be you have no other choice but to "improve"
the original simulation by doing what the authors intended and simulate the data with a mean of 2.

### Could you define replicator degrees of freedom in the context of this project?
Replicator degrees of freedom in the context of our "exact replicatioin" are any decisions the replicators have to make.
Any information from the original article that is ambiguous or vague and hence needs to be interpreted by the replicators.

### How much should the replicators "guesstimate" before declaring the replication attempt as impossible?
It depends. If there are some sensible guesstimates available that can easily be implemented the replicators can do so.
Sensible guestimates can be obtained from:
- Earlier papers by the same authors  
- Similar studies referenced in the original article  
- Common "defaults" (e.g. and alpha level of .95, commonly used cut-off values, standard normally distributed predictors)  
- Default settings in the compuational environment the authors used  

If the replicators have no such clues for what the authors might have implemented there is no shame in declaring a certain scenario (or the entire study)
as unreplicable. In that case it should be clearly described what pieces of information are missing.

### If information in the original study is ambigous shoul the replication be implemented in multiple different ways?
It depends. In a first step the replication team should decide on which interpretation they deem the most likely and provide some argument for this assessment.
In a secon step they could gauge the effort of implementing any alternative implementation. 
Factors such as coding effort as well as computational costs come into play here.
If rerunning the entire simulation with an alternative implementation takes 3 months to run it might not be the effort. 
Similarly if one alternative interpretation has a rippling effect and leads to a multiverse of 240 different implementations.
If an alternative interpretation simply involves changing one number and rerunning code that takes one hour it might be worth the effort.

## Questions Regarding the Replication Report

### What should I include in the Replication Report?
Roughly speaking the replication report should include the following information:

- Reference of the original article
- All sources of information used for the replication
- A summary of the replication process
- Elaboration on any replicator degrees of freedom
- Reference to the code
- A comparison of results
- A short discussion summarizing the overall replicability

Further inspiration can be obtained from a RMarkdown template which I created for this project.
It can be installed as following:  
`devtools::install_github("replisims/RepliSimReport")`  
If you then create a new Rmarkdownfile via  

`File -> New File -> RMarkdown`
and chose `"From Template"`
you should be given the Option `"RepliSim Report (pdf) {RepliSimReport}"`
(Sometimes it doesn't show up immediately in which case you'll need to restart RStudio.)

This template provides you with some guidance for the replication report.
It gives you an idea what *could* be reported not was *has to* be reported. 
That can vary between replications and the issues faced.

You can also check out the preliminary replication report of my replication of Peters et al 2006 on github https://github.com/replisims/peters-2016/blob/wip/analysis/report/report.pdf.

### Can I report the original figures and tables for comparison?
Visual comparison of results might be easiert obtained by simply providing the original figures next to the replicated results.
This may or may not be fair use of the copy righted material. 
I will contact a librarian to obtain some guidance for our specific cases. 

### Where should I publish the Replication Report? 
Once it is close to final you can give it a doi and include it in the zenodo community of the RepliSims project.
Zenodo allows multiple versions so you can update the report if you should spot any mistakes after publication.

## Questions Regarding Project Organization

### Can I replicate a simulation study that is not on the list?
Yes, absolutely. We do, however, recommend that you consult a peer, supervisor (or us) regarding feasibility.
Likewise, if you lack experience with any of the methods covered by the suggested replication candidates, we can help you locate a more suitable simulation study investigating a method you feel more comfortable with.

### I prefer working alone, do I have to be part of a pair?
Well, not necessarily but maybe somewhat. 
As a primary replicator you can work as independently as you want to. 
However, you might get stuck or just need somebody to bounce of an idea or double check your decisions. 
That is what the co-pilot can be for. 
You could of course theoretically always ask us but your co-pilot has in depth read the study and might help you more efficiently.
If you work more efficiently alone the ideal way to go would just be to openly communicate that to a co-pilot so they know that it is nothing personal and no reason to get worried if they don't hear from you in a while.
If you can literally make it all the way through the replcation alone your co-pilot could then simply become the reviewer. 

### How do I get access to the github organization?
If you provide Anna or Kim with your github user name we can invite you to the [replisims github organization](https://github.com/replisims).
Github will then send you an email with an invitation to join. 
If you did not receive such an email it might be a good idea to check which email address is associated with your github account and/or check the spam filter.

### When is the deadline?
The individual replications have no hard deadlines. 
However, we conceptualized this as a summer project. 
This has the advantage of some focused collective momentum and availability. 
A new semester usually comes with new projects and new responsibilities. 
Ideally, your replication is in a state where it can be handed over before you are buried in other work.
Since collaborators in this project come from different parts of the world with different holiday seasons and academic years we will be working on slightly different timelines.

### What if my copilot and I contribute a different amount of work to the replication?
We encourage every collaborator to document their role in the replication process. 
The CRediT (Contributor Role Taxonomy) is one possibility to document authorship roles.
It suggests gradiants of *lead*, *equal* and *supporting* for 14 different contributor roles
(http://credit.niso.org/).
Apart from this formal way of ensuring fair role documentation it should be acknowledged that quantity does not equal quality.
Fewer lines of code do not necessarily equate to less work. 

