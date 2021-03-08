# Han Lee's Final Project


This repository contains files and folders related to the final project for the [*Data Programming class (Spring 21)*](https://progdata.netlify.app/#about). This includes raw data, experimental code, analyses, and storage for items such as images.

## Repository directory:

| Folder Name   | Contains |
| ----------- | ----------- |
| Images     | Misc Images |
| Raw_data  | Raw data for final project (**SHOULD NOT BE CHANGED**) |
| Analyses  | R files/folders used for analyses and outputs. Each analysis folder contains an **_output_** and **_data_** folder.|
| **_Output_** | Outputs ranging from plots to summary tables |
| **_Data_**  |  Specific data files used for analysis  |

## About the Study:

2 (Focus level: global vs. local) x 3 (Run type: all congruent vs. congruent at position 2 vs. congruent at position 6) within subject design 

### Objective:

This study tested whether multiple consecutive repetitions of compound stimuli (_see left image_) would reduce the RT advantage and asymmetrical interference effects for the holistic form or global level when searching the lower details, or local level.  

### Procedure:

The study was organized into blocks, or **runs**, of seven trials. Before each run, participants were assigned to a **target** (A, E, G, K, U) and focus level. Within each run, participants saw incongruent compound stimuli and had to locate the target at the focused level. The target was present at the focused level in each trial. We manipulated whether position two or six showed a congruent compound stimulus or an incongruent stimulus (_see right image_). 

Within each trial, participants had to either press the "present" key or "absent" key to indicate target presence. Participants had 2000 msec. to respond before the study moved participants to the next trial. Response times to press these keys were recorded along with errors or timed out trials. 

<img src="https://github.com/usf-progdata/hw-Han-Lee93/blob/HW4/final_project/Images/Slide16.PNG" width="250" height="250" align="left"> 
<img src="https://github.com/usf-progdata/hw-Han-Lee93/blob/HW4/final_project/Images/run_breakdown.png" width="500" height="250" align="right">

<br clear="right"/>

### Study Breakdown:

| Run Type | Number of Runs |  Descriptions  |
| ----------- | ----------- |----------- |
| All Runs     | 190 |  Broken down into **Practice** and **Experimental** runs. |
| Practice     | 10 |  Feedbacks for correct, incorrect or timed out responses were given. |
| Experimental     | 180 |  Feedback for timed out responses were given and further broken down into **Critical** and **Control** runs. | 
| **Control**     | 60 |  Used as filler runs to add noise. Contained runs with a randomized number of missing, incongruent and congruent trials. |
| **Critical**     | 120 | 20 runs per condition |

### Study Dictionary: For reading raw data file
| Column Name | Description |  Example  |
| ----------- | ----------- |----------- |
| F/L/Sex | First name, last name, biological sex | HJM = Hugh Jackman, Male |
| ID | ID number of participant | 1 = First Participant |
| TrialType | Distinguish the trial type - Experimental or Practice | Experimental = Trial is in the experimental block |
| Trial# | Current trial number | 30 = 30th trial in the entire study |
| RunPosition# | Position within the run | 3 = third trial in the run |
| Run# | Current run number | 7 = Trial is within the 7th run of the study |
| ConditionType | Distinguish the condition type - Critical or control | Critical = Trial is in a critical run |
| Condition | Current condition for the given **run** | Local Congruent at 6 = Focused on local level and - 6th trial had congruent stimulus |
| RT | Response time to press key | 375 = 375 msec from stimulus presentation to keypress |
| Error | Whether or not participants answered correctly (0 = correct, 1 = incorrect, 2 = no response in given time) | 2 = Participant did not answer in time |
| TotalError | Current aggregate number of errors made | 32 = Up to this trial, 32 errors were made |
| Target | Current target for the given **run** | A = Look for letter "A" at a given level |
| Globality | Current focus level for the given **run** | Global = look for target at only the global level |
| RunType |  Current run type for the given **run** | Congruent at 6" = Congruent stimulus on the 6th trial |
| StimuliType | Type of stimulus shown on current trial | Incongruent Stimulus with target = Participants were shown an incongruent stimulus with the target at the focused level) |
