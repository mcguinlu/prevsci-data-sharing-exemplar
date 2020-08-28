
# Data repository for: "Randomized 1-month study to compare the efficacy of meditating with EEG-neurofeedback tool and meditation app on mental and physical health and health behaviors in university students"

## Study description

Taken from the `Study protocol.docx` document, which describes the study approach in detail:

> "Young adults in college experience high levels of stress, anxiety, and depression, which can lead to maladaptive behaviors and chronic health issues including inflammation and HPA-axis dysregulation. University mental health centers are seeking effective programs that teach coping skills to self-manage stress, with low stigma, that are easy to implement in large scale. The aim of this protocol is to describe the design of a study aiming to evaluate the effectiveness of a one-month self-guided meditation program for university students comparing various tools to improve mental health, physical health and health behaviors, and explore moderators.  Secondary aims include reaching a diverse audience and documenting adverse experiences."

## PICOTS

__Population__ - 140 university undergraduate or postgraduate students studying at an American university.

__Intervention__ - 10 minutes of self-guided meditation daily for four weeks, faciliated by the 10% Happier App, in combination with neurofeedback from the Muse Neurofeedback Tool.

__Comparison__ - 10 minutes of self-guided meditation daily for four weeks, faciliated by the 10% Happier App.

__Outcomes__ - Outcome measures included those related to Personality, Stress, Distress, Resilience (coping), Mindfulness, Emotion regulation, Sleep, Self-Regulation of Eating, Motivation Survey, and Student Adherence (for more details, see Section 2.4 of the `Study protocol.docx` document and the `Instrument List.xlsx` document).

__Time__ - 4 week intervention followed by post-intervention surveys (1-, 6- and 12-months). See `Study Timeline.xlsx` for more details on the tasks performed and the data collected at each timepoint.

## Data source files

All data files are available as Excel spreadsheets in the `data/` subdirectory. The relationships between each data file, and between data files and other information contained in this repository, are described below:

  * `RECAP_data.xlsx` (Data dictionary: `Data Dictionary for REDCAP Data.pdf`) contains the raw survey data exported from the [REDCAP](https://www.project-redcap.org/) software.
  * `External_data.xlsx` (Data dictionary: `Data Dictionary for External Data.xlsx`) contains additional variables on each participant which were not captured by the REDCAP survey. Note some variables, such as C-Reactive protein or cortisol levels, are only available for a subset of participants, based on the availablility of saliva samples for that participant. See Section 2.2.1 in `Study protocol.docx` for more details.
  * `Combined_data.xlsx` was created by merging the `RECAP_data.xlsx` and `External_data.xlsx`, and is used as the complete dataset from which composite variables are created using the `create_composite_variables.do` STATA do file. The crosswalk between the individual measures and the composite variables are described in more detail in `Stata Variable Crosswalk.xlsx`
  * `Debriefing Interview - Wave 1.xlsx`: contains qualitative reponses from "Wave 1" participants to the debriefing interview questions. _Note: the interview was only done for Wave 1 participants._

## Permanent contact about this data

Rebeca L. Acabchuk, University of Connecticut,  Institute for Collaboration on Health, Intervention, & Policy, Department of Psychological Sciences, United States

__NEED ORCID FOR BECKY__

## Registration

This study was prospectively registered on 17 January 2018 on [clinicaltrials.gov](https://clinicaltrials.gov/ct2/show/NCT03402009) [NCT03402009].

## Licence
The materials in this repository are licensed under the Creative Commons Attribution 4.0 (CC-BY-4.0) International. The full license file can be found [here](/license.txt) 
