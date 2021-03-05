# Han Lee's Final Project


This repository contains files and folders related to the final project for the [*Data Programming class (Spring 21)*](https://progdata.netlify.app/#about). This includes raw data, experimental code, analyses, and storage for items such as images.

## Repository directory:

Images: Storage for misc images.

Projects: Contains all files related to the project (HWs as well)

- Analyses: Contains R files/folders used for analyses and outputs. Each Analyses folder will contain a output, raw_data, and data folder.
- Output: Contains outputs ranging from plots to summary tables.
- Raw_data: Contains raw data for final project (*should not be changed*)
- Data: Contains data files used for analyses.

## About the Study:

2 (Focus level: global vs. local) x 3 (Run type: all congruent vs. congruent at position 2 vs. congruent at position 6) within subject design 

### Objective:

This study tested whether multiple consecutive repetitions of compound stimuli would reduce the RT advantage and asymmetrical interference effects for the holistic form or global level when searching the lower details, or local level.  

### Procedure:

The study was organized into blocks, or *_runs_*, of seven trials. Before each run, participants were assigned to a *_target_* (A, E, G, K, U) and focus level. Within each run, participants saw incongruent compound stimuli and had to locate the target at the focused level. The target was present at the focused level in each trial. We manipulated whether position two or six showed a congruent compound stimulus or an incongruent stimulus. Within each trial, participants had to either press the "present" key or "absent" key to indicate target presence. Participants had 2000 msec. to respond before the study moved participants to the next trial. Response times to press these keys were recorded along with errors or timed out trials. 

<img src="https://github.com/usf-progdata/hw-Han-Lee93/blob/HW4/final_project/Images/Slide16.PNG" width="250" height="250" align="left"> 
<img src="https://github.com/usf-progdata/hw-Han-Lee93/blob/HW4/final_project/Images/run_breakdown.png" width="500" height="250" align="right">

<br clear="right"/>

### Study Breakdown:

Total number of runs: 190 - Broken down into *_Practice_* and *_Experimental_* runs.

- 10 Practice Runs: Feedbacks for correct, incorrect or timed out responses were given.
- 180 Experimental runs: Feedback for timed out responses were given and further broken down into *_Critical_* and *_Control_* runs 
- 60 Control runs: Used as filler runs to add noise. Contained runs with a randomized number of missing, incongruent and congruent trials.
- 120 Critical runs: 20 runs per condition

### Study Dictionary:

- F/L/Sex: First name, last name, biological sex
- ID: ID number of participant
- TrialType: Distinguish the trial type - Experimental or Practice
- Trial#: Current trial number
- RunPosition#: Position within the run (e.g., 3 = third trial in the run)
- Run#: Current run number
- ConditionType: Distinguish the condition type - Critical or control
- Condition: Current condition for the given *_run_* (e.g., "Local Congruent at 6" = Focus on local level and - 6th trial had congruent stimulus)
- RT: Response time
- Error: Whether or not participants answered correctly (0 = correct, 1 = incorrect, 2 = no response in given time)
- TotalError: Current aggregate number of errors made.
- Target: Current target for the given *_run_* (e.g., "A" = Look for letter "A" at a given level.)
- Globality: Current focus level for the given *_run_* (e.g., "global" = look for target at only the global level)
- RunType: Current run type for the given *_run_* (e.g., "Congruent at 6" = Congruent stimulus on the 6th trial.)
- StimuliType: Type of stimulus shown on current trial(e.g., "Incongruent Stimulus with target" = Participants were shown an incongruent stimulus with the target at the focused level)