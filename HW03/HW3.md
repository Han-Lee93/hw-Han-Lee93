HW3
================
han
2/19/2021

# Homework 03

#### You will analyze data looking at the relationship between **green reputation** and three personality traits–**compassion**, **intellectual curiosity**, and **openness to experiences**.

The dataset includes data from **students** and **non-students**.

## For your assignment, do the following.

### Q1: Inspect the item responses (e.g., with graphs or by summarizing distinct values).

``` r
# Is anything unusual?

Q1set <- filter(green_data, id == 5549) #Searches id for value "5549" 
Q1set.1 <- as.data.frame(t(as.matrix(Q1set) #Flips columns and rows
                           )
                         )
Q1set.1
```

    ##           V1   V2
    ## id      5549 5549
    ## green1     3    4
    ## green2     4    2
    ## green3     4    4
    ## green4     4    3
    ## green5     3    4
    ## comp1      4    4
    ## comp2      2    5
    ## comp3      4    4
    ## comp4      4    5
    ## comp5      4    5
    ## comp6      4    1
    ## comp7      2    2
    ## comp8      4    2
    ## comp9      4    2
    ## comp10     4    2
    ## intel1     4    4
    ## intel2     4    5
    ## intel3     2    5
    ## intel4     2    4
    ## intel5     4    5
    ## intel6     4    4
    ## intel7     4    2
    ## intel8     4    2
    ## intel9     4    2
    ## intel10    2    1
    ## open1      4    5
    ## open2      2    4
    ## open3      4    5
    ## open4      2    4
    ## open5      4    5
    ## open6      2    4
    ## open7      5    2
    ## open8      4    2
    ## open9      2    2
    ## open10     2    2
    ## student    2    2

``` r
#Quick summary check
green_data.melt <- melt(green_data, measures.var = across(c:green1:open10)) #Reformat dataset, sets all columns into 1 column to separate as factors
```

    ## Using id as id variables

``` r
ggplot(green_data.melt) +
  aes(y = value,
      x = id
      ) +
  geom_point()
```

    ## Warning: Removed 2930 rows containing missing values (geom_point).

![](HW3_files/figure-gfm/Q1-1.png)<!-- -->

``` r
summary(green_data.melt)
```

    ##       id               variable         value        
    ##  Length:13428       green1 :  373   Min.   :-99.000  
    ##  Class :character   green2 :  373   1st Qu.:  2.000  
    ##  Mode  :character   green3 :  373   Median :  3.000  
    ##                     green4 :  373   Mean   :  2.837  
    ##                     green5 :  373   3rd Qu.:  4.000  
    ##                     comp1  :  373   Max.   :  5.000  
    ##                     (Other):11190   NA's   :2930

``` r
#Dataset has several issues.
#1. Duplicate participant data
#2. Certain data values are off (e.g., -99)
```

### Q2: Compute total scores for the four scales.

``` r
# Recode variables as needed.

#RECODING
temp_recode <- dictionary %>% #Temporary array of names to be used later
    pull(Item) #Array of names are pulled from the list of values under the "item" column

reverse_recode <- dictionary %>% #Separate temporary array of names to be used later
  filter(Keying == -1 | Keying == -2) %>% #Filters the list by the reverse codes (based off dictionary)
  pull(Item) 

#Dataset for Q2, recodes original dataset "green_data"
Q2set <- green_data %>% 
  mutate( 
    across(all_of(temp_recode), #Recodes across all the columns that match the temp_recode list
           ~ na_if(.x, 
                   -99
                   ) #All values that are -99 are recoded into NA
           )
    ) %>% 
  mutate(
    id2 = ifelse(duplicated(id), #Creates new id list and discriminates repeated ID numbers
                 paste0(id,
                        "r"
                        ), #renames duplicate ids  as "id"r
                 id
                 )
    ) %>% 
  mutate(
    across(all_of(reverse_recode),
           ~ recode(.x, 
                    "5" = 1, 
                    "4" = 2, 
                    "3" = 3, 
                    "2" = 4, 
                    "1" = 5
                    )
           )
    ) #Reverse codes based off the dictionary (reverse_recode)

#Rechecking quick summary glance
Q2.melt <- melt(Q2set, 
                measures.var = across(c:green1:open10)
                )
```

    ## Using id, id2 as id variables

``` r
ggplot(Q2.melt) +
  aes(y = value,
      x = id
      ) +
  geom_point()
```

    ## Warning: Removed 2966 rows containing missing values (geom_point).

![](HW3_files/figure-gfm/Q2-1.png)<!-- -->

``` r
summary(Q2.melt) 
```

    ##       id                id2               variable         value      
    ##  Length:13428       Length:13428       green1 :  373   Min.   :1.000  
    ##  Class :character   Class :character   green2 :  373   1st Qu.:3.000  
    ##  Mode  :character   Mode  :character   green3 :  373   Median :4.000  
    ##                                        green4 :  373   Mean   :3.603  
    ##                                        green5 :  373   3rd Qu.:4.000  
    ##                                        comp1  :  373   Max.   :5.000  
    ##                                        (Other):11190   NA's   :2966

``` r
#Print out summary statistics
#"Total" scores
Q2set %>% 
  rowwise() %>% #By row
  group_by(id2) %>% #By id
  mutate(
    Total_green = sum(c_across(green1 : green5), #Summary - sum of all green (20), comp, intel, and open (50)
                      na.rm = TRUE
                      ), 
    Total_comp = sum(c_across(comp1 : comp10), 
                     na.rm = TRUE
                     ),
    Total_intel = sum(c_across(intel1 : intel10), 
                      na.rm = TRUE
                      ),
    Total_open = sum(c_across(open1 : open10), 
                     na.rm = TRUE
                     )
    ) %>% 
  select(id2,
         Total_green,
         Total_comp,
         Total_intel,
         Total_open
         )
```

    ## # A tibble: 373 x 5
    ## # Groups:   id2 [373]
    ##    id2   Total_green Total_comp Total_intel Total_open
    ##    <chr>       <dbl>      <dbl>       <dbl>      <dbl>
    ##  1 9099           20         37          28         35
    ##  2 6275           11         48          35         31
    ##  3 8116           20         44          36         39
    ##  4 8586           19         46          30         39
    ##  5 0406           19         40          37         37
    ##  6 5645           18         42          38         38
    ##  7 3788            9         30          30         30
    ##  8 8424           13         19          43         18
    ##  9 8450           18         42          40         39
    ## 10 0512           22         38          37         38
    ## # ... with 363 more rows

``` r
#"Mean" Scores
Q2set %>% 
  rowwise() %>% #By row
  group_by(id2) %>% #By id
  mutate(
    Total_green = mean(c_across(green1 : green5), 
                      na.rm = TRUE
                      ), 
    Total_comp = mean(c_across(comp1 : comp10), 
                     na.rm = TRUE
                     ),
    Total_intel = mean(c_across(intel1 : intel10), 
                      na.rm = TRUE
                      ),
    Total_open = mean(c_across(open1 : open10), 
                     na.rm = TRUE
                     )
    ) %>% 
  select(id2,
         Total_green,
         Total_comp,
         Total_intel,
         Total_open
         )
```

    ## # A tibble: 373 x 5
    ## # Groups:   id2 [373]
    ##    id2   Total_green Total_comp Total_intel Total_open
    ##    <chr>       <dbl>      <dbl>       <dbl>      <dbl>
    ##  1 9099          4          3.7         2.8       3.5 
    ##  2 6275          2.2        4.8         3.5       3.1 
    ##  3 8116          4          4.4         3.6       3.9 
    ##  4 8586          3.8        4.6         3         3.9 
    ##  5 0406          3.8        4           3.7       3.7 
    ##  6 5645          3.6        4.2         3.8       3.8 
    ##  7 3788          1.8        3           3         3   
    ##  8 8424          2.6        1.9         4.3       1.8 
    ##  9 8450          3.6        4.2         4         4.33
    ## 10 0512          4.4        3.8         3.7       3.8 
    ## # ... with 363 more rows

### Q3: Rescale the variables so that they go from 0-100 instead of the original range.

``` r
# Name the recaled variables `*_pomp`.
#Dataset for Q3
Q3set <- Q2set %>% 
  mutate(
    across(all_of(temp_recode),
           ~ recode(.x, 
                    "1" = 0,
                    "2" = 25,
                    "3" = 50,
                    "4" = 75,
                    "5" = 100
                   ), 
                   .names = "{.col}_pomp"
           )  
    ) %>% 
  rowwise() %>%
  group_by(id2) %>% 
  mutate(
    Total_green = mean(c_across(green1_pomp : green5_pomp), 
                      na.rm = TRUE
                      ),
    Total_comp = mean(c_across(comp1_pomp : comp10_pomp), 
                     na.rm = TRUE
                     ),
    Total_intel = mean(c_across(intel1_pomp : intel10_pomp), 
                      na.rm = TRUE
                      ),
    Total_open = mean(c_across(open1_pomp : open10_pomp), 
                     na.rm = TRUE
                     )
    ) %>% 
  mutate(
    student = recode(student, 
                     "1" = "Not a student", 
                     "2" = "Student",
                     .default = "No Response",
                     .missing = "No Response")
    )
#Create summary table for question (Same as Q2set.1 but with 100 as total)
Q3set.1 <- Q3set %>% 
  select(id2,
         Total_green,
         Total_comp,
         Total_intel,
         Total_open
         )

Q3set.1
```

    ## # A tibble: 373 x 5
    ## # Groups:   id2 [373]
    ##    id2   Total_green Total_comp Total_intel Total_open
    ##    <chr>       <dbl>      <dbl>       <dbl>      <dbl>
    ##  1 9099           75       67.5        45         62.5
    ##  2 6275           30       95          62.5       52.5
    ##  3 8116           75       85          65         72.5
    ##  4 8586           70       90          50         72.5
    ##  5 0406           70       75          67.5       67.5
    ##  6 5645           65       80          70         70  
    ##  7 3788           20       50          50         50  
    ##  8 8424           40       22.5        82.5       20  
    ##  9 8450           65       80          75         83.3
    ## 10 0512           85       70          67.5       70  
    ## # ... with 363 more rows

### Q4: Make plots that illustrate the distributions of the 4 POMP-scored variables.

``` r
#Reformats dataset to have all the categories as a factor for easier graph (same as before)
Q4set <- melt(Q3set.1, 
              value.name = "POMP_scores", 
              variable.name = "POMP_variables"
              )
```

    ## Using id2 as id variables

``` r
summary(Q4set)
```

    ##      id2                POMP_variables  POMP_scores   
    ##  Length:1492        Total_green:373    Min.   :  0.0  
    ##  Class :character   Total_comp :373    1st Qu.: 55.0  
    ##  Mode  :character   Total_intel:373    Median : 65.0  
    ##                     Total_open :373    Mean   : 65.2  
    ##                                        3rd Qu.: 75.0  
    ##                                        Max.   :100.0  
    ##                                        NA's   :289

``` r
#Creates plot based off Q4set
Q4set.1 = Q4set %>% 
  filter(POMP_scores != 0) #Removes NA or incorrect data (values = 0)

Full_hist <- ggplot(Q4set.1) + 
  aes(x = POMP_scores,
      group = POMP_variables,
      color = POMP_variables,
      fill = POMP_variables,
      ) + 
  geom_histogram(alpha = .5, 
                 color = "black", 
                 position = "identity"
                 ) +
  scale_x_continuous("POMP Scores")

Sep_hist <- ggplot(Q4set.1) + 
  aes(x = POMP_scores,
      group = POMP_variables,
      color = POMP_variables,
      fill = POMP_variables,
      ) + 
  geom_histogram(color = "black") +
    facet_grid(~ POMP_variables) + #Split by POMP_variables
  scale_x_continuous("POMP Scores")

grid.arrange(Full_hist,
             Sep_hist)#Merges all the graphs into 1 image
```

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

<img src="HW3_files/figure-gfm/Q4 fig2-1.png" style="display: block; margin: auto;" />

``` r
#This graph shows that the green scores are normally distributed while the rest are slightly skewed left.
#Participant scores for all four scales are above half. 
#One possiblity is that these scales are positively correlated to one another. 
#At first glance, this graph shows that, there are more high total score values for comp than rest. 
#Additionally, the graph shows that there are more low total score values for green than the rest.
```

### Q5: Make scatterplots showing the relationships between **green reputation** and each personality trait.

``` r
# Include trend lines for **students** and **non-students**.
# What do these plots show?

#Dataset for Q5
Q5set <- Q3set %>% 
  filter(student!="No Response") %>% 
  select(id2,
         Total_green,
         Total_comp,
         Total_intel,
         Total_open,
         student
         )

#3 scatterplots with data separated by student and not a student


GreenXcomp <- ggplot(Q5set) +
  aes(x = Total_green,
      y = Total_comp, 
      color = student
      ) +
  scale_color_manual(values = c("red", 
                                "blue"
                                )
                     ) +
  geom_point() +
  geom_smooth(method = "lm")

GreenXintel <- ggplot(Q5set) +
  aes(x = Total_green,
      y = Total_intel, 
      color = student
      ) +
  scale_color_manual(values = c("red", 
                                "blue"
                                )
                     ) +
  geom_point() +
  geom_smooth(method = "lm")

GreenXopen <- ggplot(Q5set) +
  aes(x = Total_green,
      y = Total_open, 
      color = student
      ) +
  scale_color_manual(values = c("red", 
                                "blue"
                                )
                     ) +
  geom_point() +
  geom_smooth(method = "lm") 

grid.arrange(GreenXcomp,
             GreenXintel,
             GreenXopen,
             nrow=1
             )
```

    ## `geom_smooth()` using formula 'y ~ x'
    ## `geom_smooth()` using formula 'y ~ x'
    ## `geom_smooth()` using formula 'y ~ x'

<img src="HW3_files/figure-gfm/Q5 fig2-1.png" style="display: block; margin: auto;" />

``` r
#Based on the graphs, there seem to be a potential positive correlation between the green reputation survey and each of the other personality trait surveys. 
#Additionally the graphs show interactions between the green survey and both intel personality trait survey and open personality trait survey. 
```

### Q6: Compare **green reputation** for students and non-students using a **rainfall plot** (bar + density + data points).

``` r
ggplot(Q5set) +
  aes(y = student,
      x = Total_green,
      fill = student,
      color = student
      ) +
  geom_jitter(height =.15) +
  geom_boxplot(color = "black",
               alpha = .5,
               width = .3,
               size = .8
               ) +
  ggdist::stat_slab(height = .4,
                    color = "black",
                    size = .2,
                    alpha = .5,
                    position = position_nudge(y = .2)
                    )
```

![](HW3_files/figure-gfm/Q6-1.png)<!-- -->

``` r
#Overall, the plot does not seem to indicate a notable difference between students and non-students for the green reputation scale. 
#However, the plot seems to show that students seem to have larger variance and a lower mean.
```

### Q7: Compute a summary table of means, SDs, medians, minima, and maxima for the four total scores for students and non-students.

``` r
Q7set <- Q5set %>%
  group_by(student) %>% 
  summarize(across(c(Total_green:Total_open),
                    list(Mu = ~ mean(.x,
                                      na.rm = TRUE
                                     ),
                         Sigma = ~ sd(.x,
                                      na.rm = TRUE
                                     ),
                         Median = ~ median(.x,
                                           na.rm = TRUE
                                           ),
                         Max = ~ max(.x, 
                                     na.rm = TRUE
                                     ),
                         Min = ~ min(.x, 
                                     na.rm = TRUE
                                     )
                         )
                   )
            ) 
Q7set.1 <- as.data.frame(t(as.matrix(Q7set)
                           )
                         )
Q7set.1
```

    ##                                1        2
    ## student            Not a student  Student
    ## Total_green_Mu          58.68132 56.42473
    ## Total_green_Sigma       16.49638 17.10025
    ## Total_green_Median            60       55
    ## Total_green_Max              100       95
    ## Total_green_Min               10       15
    ## Total_comp_Mu           70.67766 77.26852
    ## Total_comp_Sigma        13.11565 14.59682
    ## Total_comp_Median          72.50    76.25
    ## Total_comp_Max               100      100
    ## Total_comp_Min              40.0     22.5
    ## Total_intel_Mu          65.14042 63.02121
    ## Total_intel_Sigma       13.71986 14.24613
    ## Total_intel_Median          67.5     65.0
    ## Total_intel_Max             95.0     97.5
    ## Total_intel_Min             37.5     25.0
    ## Total_open_Mu           64.31013 66.40233
    ## Total_open_Sigma        12.45282 14.83111
    ## Total_open_Median       62.50000 65.83333
    ## Total_open_Max                95       95
    ## Total_open_Min              37.5     20.0

``` r
#Judging only by the summary statistics, there does not seem to be a difference between students and non-students for any of the personality trait scores,
#(with the possible exception for the mean total score value for comp) or the green reputation scores. 
#Nearly all the means between the two groups are the same and around 65 for the scores, 
#with the exception of comp (above 70) and green (below 60)
```

In your assignment, prepare an RMarkdown file that includes both the
coding and (for 4-7) narrative descriptions of your results.
