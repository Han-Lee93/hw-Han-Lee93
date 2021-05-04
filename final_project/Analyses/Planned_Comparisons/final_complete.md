Final Project
================
Han
4/13/2021

# Repeated exposure effects on Global Precedence

## Introduction

This study aimed to test the endurance of global level influence on
local level processing. Research has shown that an object can have at
least two levels of information; the global level, or the large form, of
an object can influence how the local level, or detailed components, of
the object is visually processed. When the two levels are congruent
(consistent information between the two levels), global information can
facilitate local information processing; however, when incongruent
(inconsistent information between the two levels), global information
can impede local information processing, leading to slower response
times. This is called ‘global interference’ and is derived from the
‘congruency’ effect that is calculated from comparisons between
performance with congruent stimuli vs. performance with incongruent
stimuli.

The current literature presents inconsistent findings on whether
attention can reduce global level influence during local level
processing. To examine this, studies have utilized repeated presentation
paradigms that involve multiple presentations of a compound stimulus
(objects with a global and local level of perception) and manipulate the
level that participants must attend to for future presentations. For
example, participants may be directed to look for a target (letter “A”)
within a given compound stimulus. The level that contains the letter “A”
will be the last level that participants attend to for the current
stimulus and the first level that participants attend to for the
following stimulus. This is an important facet of repeated presentation
paradigms such that it enables control over the order of level
information processing over a series of compound stimulus. Furthermore,
attentional control is seen to increase with more repetitions. In other
words, attention becomes better at suppressing irrelevant information
and facilitating relevant information processing with multiple
repetitions. However, this effect has yet to be tested with compound
stimuli. As such, it is unclear whether multiple repetitions enables
better attentional control or focus on a particular level.

## Study Description

This study aims to investigate whether multiple repetitions can reduce
congruency effects. The study utilizes the repeated presentation
paradigm with three additional details. Firsly, the study involves
multiple repeated presentations through a series of 7 compound stimulus
presentations, known as a run. Run position reference a stimulus
presentation by its sequential order within the run. Secondly,
participants are directed to a specific level (global or local) before
the series of compound stimulus presentation. This enables a more
voluntary, goal-oriented attentional deployment to the given task, and
stronger establishment of level relevancy in terms of information
processing (i.e., directed level contains relevant information while
other level contains irrelevant inforamtion). Lastly, the critical data
runs in this study contained only congruent stimuli (both irrelevant and
relevant levels contained target information) and manipulated whether
and when a single incongruent stimulus (irrelvant level contained
non-target while relevant level contained target) was presented in the
run.

Critical data runs only had at most 1 incongruent stimulus within a
given run. The incongruent stimulus was presented either early in the
run (run position 2), late in the run (run position 6), or not at all to
determine whether multiple repeated presentations strengthened
attentional control. Therefore, there were three types of runs; all
congruent stimuli, incongruent at 2, and incongruent at 6. The study
looked at whether there was a change in the amount of global level
interference during local information processing between the two run
positions (2 and 6). The congruence effect (e.g., global level
interference) was calculated from reponse time (RT) comparisons between
the incongruent stimulus and congruent stimulus (only in the all
congruent runs). Notably, the target letter was always present at the
relevant level in the critical runs.

Throughout the study, the stimulus was presented for 150 msec and was
immediately followed by a blank screen. Participants were tasked to
determine target letter presence (via keyboard button press) and had a
total of 2000 msec to respond as soon as the stimulus was shown.

Planned comparisons were made to look at whether the congruence effect
was lower at position 6 than position 2. Two important planned
comparisons were the RT differences for task completion between the
congruent and incongruent stimulus at position 2 and at position 6 for
local information processing. At position 2, an incongruent stimulus
should produce much slower RTs relative to a congruent stimulus. At
position 6, an incongruent stimulus should produce similar RTs to a
congruent stimulus if multiple exposures enable better attentional
control. The last planned comparison is the RT difference in the amount
of influence an incongruent stimulus has on task performance (i.e.,
congruence effect, or the RT difference between an incongruent stimulus
and congruent stimulus at the same position) between positions 2 and 6.
If multiple repeated exposure and better attentional control enables
stronger focus on relevant information, then there should be a large
reduction in the amount of incongruent stimulus influence.

## Results

Planned comparison results show that there was a congruency effect at
both positions 2 (Mean difference = 33.92 msec, SE = 7.22, t(29) = 3.62,
*p* \< .01, cohen’s *d* = .75) and 6 (Mean difference = 24.49 msec, SE =
7.39, t(29) = 2.86, *p* \< .01, cohen’s *d* = .61). There was not a
reliable difference in congruence effect between these two positions
(Mean difference = 9.42 msec, SE = 11.62, t(29) = 1.01, *p* = .32,
cohen’s *d* = .81).

These results show that six repeated exposures do not prevent
incongruent global information from affecting local information
processing.

## Summary Tables/Datasets

A total of 6 datasets were created:

REdat.totalmeans - Dataset with means across ID from *REdat.means*
(summarized means by ID). **Used for run graph**

REdat.IDanalysismeans - Dataset with means (by ID) without non-critical
data points **Used for Planned pairwise comparison analyses**

REdat.fullanalysismeans - Dataset with means aggreated from
*REdat.IDanalysismeans*. **Used for critical position graph**

REdat.IDanalysismeans.congruency - Dataset with means (by ID) for
differences in RT between congruent and incongruent stimuli (i.e.,
congruency effect). **Used for third planned comparison**

REdat.IDanalysismeans.congruency.means - Dataset with means across ID
from *REdat.IDanalysismeans.congruency*. Exhibits total amount of
congruency effect. **Used for cohen’s d calculation and congruency
effect graph**

REdat.IDanalysismeans.CE\_difference.means - Dataset with differences in
congruency effects between positions 2 and 6 **Used for third
comparison’s cohen’s d calculation**

Importing “cleaned” datasets created from “Import\_data\_RE.rmd”

``` r
#Importing cleaned dataset for LME modeling/analysis
REdat.full <-read_csv(here::here("Analyses", "Planned_Comparisons", "Data", "RE_Cleaned_data.csv"),
                    col_types = cols(
                      ID = col_factor(),
                      Condition = col_character(),
                      RunPosition = col_factor(),
                      RT = col_double(),
                      Globality = col_character(),
                      RunType = col_character(),
                      StimuliType = col_character()
                      ),
                    na = c("","NA")
                    ) 

#Importing summarized means (by ID) dataset                    
REdat.means <- read_csv(here::here("Analyses", "Planned_Comparisons", "Output", "Summary", "Mean_by_condition-id-conditiontype.csv")
                )
```

Summary table that aggregates means from *RTdat.means* into a dataset
with total summarized means; used for by condition comparisons. **Used
for run graph**

``` r
#Summary table that consolidates previous summarized means (by ID) into a dataset with total summarized means; used for by condition comparisons.
REdat.totalmeans <- summarySEwithin(
  REdat.means,
  measurevar = "RT_Mu",
  withinvars = c("Globality", "RunType", 
                 "RunPosition","Condition", "StimuliType", "Critdatpoint"),
  idvar = "ID")

#Substitute  dataframe for table
REdat.totalmeans %>% 
  select(Condition, RunPosition, RT_Mu, sd, se, N)
```

    ##                  Condition RunPosition    RT_Mu       sd        se  N
    ## 1         Global Congruent           1 378.5545 48.20714  8.801380 30
    ## 2         Global Congruent           2 292.6667 33.67630  6.148423 30
    ## 3         Global Congruent           3 274.3681 30.94721  5.650162 30
    ## 4         Global Congruent           4 275.0041 45.65191  8.334861 30
    ## 5         Global Congruent           5 274.4210 21.98076  4.013119 30
    ## 6         Global Congruent           6 275.7711 32.92569  6.011381 30
    ## 7         Global Congruent           7 277.4677 35.62640  6.504462 30
    ## 8  Global Incongruent at 2           1 382.3373 56.15387 10.252247 30
    ## 9  Global Incongruent at 2           2 320.7453 32.41325  5.917824 30
    ## 10 Global Incongruent at 2           3 292.5639 29.61717  5.407330 30
    ## 11 Global Incongruent at 2           4 286.3916 28.70240  5.240317 30
    ## 12 Global Incongruent at 2           5 277.6783 35.15846  6.419027 30
    ## 13 Global Incongruent at 2           6 269.4925 27.01257  4.931798 30
    ## 14 Global Incongruent at 2           7 277.0389 30.91320  5.643953 30
    ## 15 Global Incongruent at 6           1 367.1719 45.43416  8.295105 30
    ## 16 Global Incongruent at 6           2 297.1639 24.94077  4.553541 30
    ## 17 Global Incongruent at 6           3 277.1017 32.37371  5.910603 30
    ## 18 Global Incongruent at 6           4 277.0328 30.99414  5.658730 30
    ## 19 Global Incongruent at 6           5 275.4397 31.13312  5.684105 30
    ## 20 Global Incongruent at 6           6 271.7297 31.77930  5.802079 30
    ## 21 Global Incongruent at 6           7 284.1352 29.11491  5.315631 30
    ## 22         Local Congruent           1 436.8359 69.94123 12.769464 30
    ## 23         Local Congruent           2 338.9235 36.18863  6.607109 30
    ## 24         Local Congruent           3 309.3239 23.53182  4.296303 30
    ## 25         Local Congruent           4 305.8997 29.39395  5.366576 30
    ## 26         Local Congruent           5 296.6270 27.76983  5.070055 30
    ## 27         Local Congruent           6 295.3811 26.74630  4.883185 30
    ## 28         Local Congruent           7 298.2035 29.97613  5.472867 30
    ## 29  Local Incongruent at 2           1 429.3914 62.82007 11.469322 30
    ## 30  Local Incongruent at 2           2 372.8393 49.78924  9.090230 30
    ## 31  Local Incongruent at 2           3 327.1639 23.23527  4.242161 30
    ## 32  Local Incongruent at 2           4 313.3988 25.76170  4.703420 30
    ## 33  Local Incongruent at 2           5 302.0463 22.06088  4.027748 30
    ## 34  Local Incongruent at 2           6 295.0468 27.48894  5.018772 30
    ## 35  Local Incongruent at 2           7 291.4363 28.54655  5.211863 30
    ## 36  Local Incongruent at 6           1 431.5999 56.33097 10.284581 30
    ## 37  Local Incongruent at 6           2 339.5070 44.44613  8.114716 30
    ## 38  Local Incongruent at 6           3 312.9579 38.14379  6.964071 30
    ## 39  Local Incongruent at 6           4 298.5213 30.57965  5.583056 30
    ## 40  Local Incongruent at 6           5 293.0070 28.18577  5.145994 30
    ## 41  Local Incongruent at 6           6 319.8721 41.37616  7.554218 30
    ## 42  Local Incongruent at 6           7 312.3963 24.28078  4.433044 30

Mean data (by ID) with only comparison data (Incongruent stimulus at
Position 2 and 6, and the congruent stimulus at the same positions from
the all congruent runs) **Used for Planned pairwise comparison
analyses**

``` r
#Data by full aggregated means
REdat.IDanalysismeans <- REdat.means %>% 
  filter(((Condition == "Global Congruent"| Condition == "Local Congruent") &
                              (RunPosition == "6" | RunPosition== "2")) | 
                              (StimuliType == "Incongruent Stimuli with Target"))

REdat.IDanalysismeans %>% 
  select(ID, Condition, RunPosition, RT_Mu, RT_Sigma, RT_n)
```

    ## # A tibble: 240 x 6
    ##       ID Condition               RunPosition RT_Mu RT_Sigma  RT_n
    ##    <dbl> <chr>                         <dbl> <dbl>    <dbl> <dbl>
    ##  1     1 Global Congruent                  2  395.    126.     20
    ##  2     1 Global Congruent                  6  336.     99.4    20
    ##  3     1 Global Incongruent at 2           2  476.    275.     20
    ##  4     1 Global Incongruent at 6           6  310.    138.     20
    ##  5     1 Local Congruent                   2  436.    117.     19
    ##  6     1 Local Congruent                   6  408.    114.     18
    ##  7     1 Local Incongruent at 2            2  523.    220.     20
    ##  8     1 Local Incongruent at 6            6  454.    143.     20
    ##  9     2 Global Congruent                  2  209.    103.     20
    ## 10     2 Global Congruent                  6  224.     75.3    20
    ## # ... with 230 more rows

Collapsed Mean data (by ID) and included only critical position data for
simplified visual appearance (Incongruent stimulus at Position 2 and 6,
and the congruent stimulus at the same positions from the all congruent
runs) **Used for critical position graph**

``` r
#Data by full aggregated means
REdat.fullanalysismeans <- REdat.totalmeans %>% 
  filter(((Condition == "Global Congruent"| Condition == "Local Congruent") &
                              (RunPosition == "6" | RunPosition== "2")) | 
                              (StimuliType == "Incongruent Stimuli with Target"))

REdat.fullanalysismeans %>% 
  select(Condition, RunPosition, RT_Mu, sd, N)
```

    ##                 Condition RunPosition    RT_Mu       sd  N
    ## 1        Global Congruent           2 292.6667 33.67630 30
    ## 2        Global Congruent           6 275.7711 32.92569 30
    ## 3 Global Incongruent at 2           2 320.7453 32.41325 30
    ## 4 Global Incongruent at 6           6 271.7297 31.77930 30
    ## 5         Local Congruent           2 338.9235 36.18863 30
    ## 6         Local Congruent           6 295.3811 26.74630 30
    ## 7  Local Incongruent at 2           2 372.8393 49.78924 30
    ## 8  Local Incongruent at 6           6 319.8721 41.37616 30

Dataset for third planned comparison. Pivoted dataset for analysis (by
ID) and subtracted congruent stimulus RT from incongruent stimulus RT.
**Used for third planned comparison**

``` r
#Data by full aggregated means
REdat.IDanalysismeans.congruency <- REdat.IDanalysismeans %>%
   select(ID, Globality, StimuliType,RunPosition, RT_Mu) %>% 
   pivot_wider(id_cols = c(-StimuliType, -RT_Mu), 
              names_from = StimuliType,
              values_from = RT_Mu) %>% 
  mutate(Congruence_Effect = `Incongruent Stimuli with Target` - `Congruent Stimuli with Target`)

REdat.IDanalysismeans.congruency
```

    ## # A tibble: 120 x 6
    ##       ID Globality RunPosition `Congruent Stim~ `Incongruent St~
    ##    <dbl> <chr>           <dbl>            <dbl>            <dbl>
    ##  1     1 Global              2             395.             476.
    ##  2     1 Global              6             336.             310.
    ##  3     1 Local               2             436.             523.
    ##  4     1 Local               6             408.             454.
    ##  5     2 Global              2             209.             219.
    ##  6     2 Global              6             224.             254.
    ##  7     2 Local               2             230.             206.
    ##  8     2 Local               6             232.             229.
    ##  9     3 Global              2             252.             321.
    ## 10     3 Global              6             243.             236.
    ## # ... with 110 more rows, and 1 more variable: Congruence_Effect <dbl>

Dataset with means aggregated from *REdat.IDanalysismeans.congruency*
for differences between P2 and P6 **Used for cohen’s d calculation and
third planned comparison graph**

``` r
REdat.IDanalysismeans.congruency.means <- summarySEwithin(
  REdat.IDanalysismeans.congruency,
  measurevar = "Congruence_Effect",
  withinvars = c("Globality", "RunPosition"),
  idvar = "ID")

REdat.IDanalysismeans.congruency.means
```

    ##   Globality RunPosition  N Congruence_Effect       sd       se       ci
    ## 1    Global           2 30         28.078616 45.42227 8.292934 16.96095
    ## 2    Global           6 30         -4.041306 49.16564 8.976376 18.35875
    ## 3     Local           2 30         33.915828 39.56091 7.222800 14.77229
    ## 4     Local           6 30         24.491053 40.45816 7.386616 15.10733

Dataset used for calculating difference in congruence effect between
positions 2 and 6. **Used for cohen’s d calculation for third
comparison**

``` r
#Steps to calculate cohen's d for change in congruence effect (i.e., comparison of congruence effect) at position 2 vs. 6

#Pivot data to subtract RT at position 6 from RT at position 2.
REdat.IDanalysismeans.CE_difference <- REdat.IDanalysismeans.congruency %>%
   select(ID, Globality,RunPosition, Congruence_Effect) %>% 
   pivot_wider(id_cols = c(-RunPosition, -Congruence_Effect), 
              names_from = RunPosition,
              values_from = Congruence_Effect) %>% 
  mutate(Congruence_Effect_difference = `2` - `6`)
#Get means from the previous subtractions to get 'change in congruence effect'.
REdat.IDanalysismeans.CE_difference.means <- summarySEwithin(
  REdat.IDanalysismeans.CE_difference,
  measurevar = "Congruence_Effect_difference",
  withinvars = c("Globality"),
  idvar = "ID")

REdat.IDanalysismeans.CE_difference.means
```

    ##   Globality  N Congruence_Effect_difference      sd       se      ci
    ## 1    Global 30                    32.119922 63.6591 11.62251 23.7707
    ## 2     Local 30                     9.424776 63.6591 11.62251 23.7707

## Planned Comparisons

Pairwise comparison (Planned comparisons: Local Incongruent at P2(and 6)
vs. Local congruent at P2(and 6))

``` r
#Pairwise comparison for Local level
pwc.1_and_2 <- REdat.IDanalysismeans %>%
  filter(Globality == "Local") %>% 
  group_by(RunPosition) %>% 
  pairwise_t_test(
    RT_Mu ~ StimuliType, paired = TRUE,
    p.adjust.method = "bonferroni"
  )
pwc.1_and_2
```

    ## # A tibble: 2 x 11
    ##   RunPosition .y.   group1 group2    n1    n2 statistic    df     p p.adj
    ## *       <dbl> <chr> <chr>  <chr>  <int> <int>     <dbl> <dbl> <dbl> <dbl>
    ## 1           2 RT_Mu Congr~ Incon~    30    30     -3.62    29 0.001 0.001
    ## 2           6 RT_Mu Congr~ Incon~    30    30     -2.86    29 0.008 0.008
    ## # ... with 1 more variable: p.adj.signif <chr>

Pairwise comparison (Planned comparison: Difference at P2 vs. difference
at P6)

``` r
#Pairwise comparison of congruency effect between position 2 and 6 for local level
pwc.3 <- REdat.IDanalysismeans.congruency %>%
  filter(Globality == "Local") %>% 
  pairwise_t_test(
    Congruence_Effect ~ RunPosition, paired = TRUE,
    p.adjust.method = "bonferroni")
pwc.3
```

    ## # A tibble: 1 x 10
    ##   .y.         group1 group2    n1    n2 statistic    df     p p.adj p.adj.signif
    ## * <chr>       <chr>  <chr>  <int> <int>     <dbl> <dbl> <dbl> <dbl> <chr>       
    ## 1 Congruence~ 2      6         30    30      1.01    29 0.322 0.322 ns

First comparison cohen’s *d*: Incongruent vs. congruent stimuli (i.e.,
congruency effect) comparison at position 2

``` r
#data fromREdat.IDanalysismeans.congruency.means
pwc1_cohens_d = 33.915828/45.2227
pwc1_cohens_d
```

    ## [1] 0.7499735

Second comparison cohen’s *d*: Incongruent vs. congruent stimuli (i.e.,
congruency effect) comparison at position 6

``` r
pwc2_cohens_d = 24.491053/40.45816
pwc2_cohens_d
```

    ## [1] 0.6053427

Third comparison cohen’s *d*: Difference in congruency effect between
position 2 and 6

``` r
#data REdat.IDanalysismeans.CE_difference.means
pwc3_cohens_d = 9.424776/11.62251
pwc3_cohens_d
```

    ## [1] 0.8109071

## Graphs

Graph depicting total means throughout a run for all conditions

``` r
runplot <- ggplot(data = REdat.totalmeans) +
  aes(x = RunPosition, 
      y = RT_Mu, 
      shape = StimuliType,
      group = interaction(Globality,RunType)) +
  geom_errorbar(aes(ymax = RT_Mu + se, 
                    ymin = RT_Mu - se,
                    color = Condition), 
                width=.3) +
  geom_line(aes(size = Condition,  
                color = Condition)) +
  geom_line(data = subset(REdat.totalmeans,
                        RunType == "Congruent"),
            aes(color = "black",
                size = Condition))+
  geom_point(aes(color = Condition,
                 alpha = Critdatpoint,
                 size = Globality,
                 fill = Globality)) +
  geom_point(data = subset(REdat.totalmeans,
                           RunType == "Congruent"),
                           aes(color = Condition,
                               alpha = Critdatpoint,
                               size = Globality,
                               fill = Globality)) +
  geom_errorbar(data=subset(REdat.totalmeans, 
                            Critdatpoint =="Critical"),
                aes(ymax = RT_Mu + se, 
                    ymin = RT_Mu - se, 
                    color = "gold"), 
                width=.3) +
  geom_point(data = subset(REdat.totalmeans, 
                           Critdatpoint == "Critical"),
             aes(color ="gold", 
                 size = RunType,
                 fill = Globality)) +
   annotate(geom = "rect", 
           xmin = 5.75, 
           xmax = 6.25, 
           ymin = 285, 
           ymax = 332, 
           color = "gold",
           size = 1.5,
           fill = NA) +
  annotate(geom = "rect", 
           xmin = 1.75, 
           xmax = 2.25, 
           ymin = 327, 
           ymax = 387, 
           color = "gold",
           size = 1.5,
           fill = NA) +
  annotate(geom = "segment", 
           x = 2, 
           xend = 2, 
           y = 387, 
           yend = 400, 
           color = "gold",
           size = 1.5) +
  annotate(geom = "segment", 
           x = 2, 
           xend = 3, 
           y = 400, 
           yend = 400, 
           color = "gold",
           size = 1.5) +
  annotate(geom = "segment", 
           x = 6, 
           xend = 6, 
           y = 332, 
           yend = 370, 
           color = "gold",
           size = 1.5) +
  annotate(geom = "rect", 
           xmin = 2.64, 
           xmax = 6.87, 
           ymin = 361.5, 
           ymax = 460, 
           color = "gold",
           size = 1.5,
           fill = NA) +
  scale_alpha_manual(values=c(1,.4)) +
  scale_color_manual(values = c("black", "black", "cyan2", "cyan2","gold","black","red3","red3")) +
  scale_fill_manual(values = c("cyan2", "red3")) +
  scale_size_manual(values = c(3.5,2.5,2,1,1,3.5,3.5,2.5,2,1,1)) +
  scale_shape_manual(name = "Stimulus", 
                     values = c(21,24), 
                     labels=c("Incongruent Stimulus",
                              "Congruent Stimulus")) +
  scale_x_discrete("Run Position", 
                   1:7,  
                   waiver(),
                   limits = c("1","2","3","4","5","6","7"),
                   expand = c(.05,0)) + 
  ylim(265,460) +
  labs(title = "<span style='color: cyan2'>**Global**</span> and <span style='color: red3'>**Local**</span> RTs throughout a Run", 
       color ="Critical Position", 
       x ="Run Position", 
       y ="Response Time (msec)") +
  guides(color = FALSE, size = FALSE, alpha = FALSE, fill = FALSE) +
  theme_x() +
  theme(legend.position="bottom", legend.box = "horizontal")
```

Graph for only comparison data

``` r
critdatplot <- ggplot(data = REdat.fullanalysismeans) +
  aes(x = RunPosition, 
      y = RT_Mu,
      color = Globality,
      group = interaction(Globality,StimuliType)) +
  geom_errorbar(aes(ymax = RT_Mu + se, 
                    ymin = RT_Mu - se, 
                width=.2), size = 1) +
  geom_line(size = 1.2) +
  geom_point(aes(shape = StimuliType), size = 3.5) +
  ylim(265,390) +
  scale_color_manual(values = c("cyan2", "red3")) +
  labs(title = "RTs at critical positions",
       x ="Run Position", 
       y ="Response Time (msec)") +
   guides(color = FALSE, shape = FALSE) +

  theme_x()
```

Graph of differences between P2 and P6

``` r
differencesgraph = ggplot(REdat.IDanalysismeans.congruency.means) +
  aes(x = RunPosition, y = Congruence_Effect, fill = Globality) +
  geom_bar(stat = "identity", position = position_dodge(width =)) +
  geom_errorbar(aes(ymax = Congruence_Effect + se, 
                    ymin = Congruence_Effect - se,
                    color = Globality), 
                width=.3,
                position = position_dodge(width = .9),
                size = 2,
                color = "gold") +
  scale_fill_manual(values = c("cyan2","red3"))+
  labs(title = "<span style='color: cyan2'>**Global**</span> and <span style='color: red3'>**Local**</span> congruence effects at critical positions",
       x ="Run Position", 
       y ="Congruence Effect (RT msec)") +
   guides(fill = FALSE) +
  theme_x()
```

``` r
allgraphs = (runplot + 
               inset_element(
                 critdatplot,
                 left = 0.3, 
                 bottom = 0.5, 
                 right = unit(1, 'npc') - unit(1, 'cm'), 
                 top = unit(1, 'npc') - unit(1, 'cm'))
             )| differencesgraph +
  plot_layout(ncol = 1, guides = 'collect') +
  plot_annotation(theme = theme(plot.title = element_markdown(face = "bold"),
                                plot.background = element_rect(fill = "gray")))
allgraphs
```

![](final_complete_files/figure-gfm/all%20graphs-1.png)<!-- -->
