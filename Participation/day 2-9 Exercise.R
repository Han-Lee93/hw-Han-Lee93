1. Use the `psych::bfi` dataset.
2. Compute mean scores for each of the Big Five traits for each person.

Exercise_data=psych::bfi %>% 
  rowwise() %>%
  mutate(Total_A=mean(c_across(A1:A5), na.rm = TRUE),
         Total_E=mean(c_across(E1:E5), na.rm = TRUE),
         Total_N=mean(c_across(N1:N5), na.rm = TRUE),
         Total_O=mean(c_across(O1:O5), na.rm = TRUE),
         Total_C=mean(c_across(C1:C5), na.rm = TRUE)) 
Exercise_data%>% 
  select(Total_A, Total_E,Total_N,Total_O,Total_C)


3. Keep just Big Five scores, gender, age, and education.

Total_data=Exercise_data %>%
  select(Total_A, Total_E,Total_N,Total_O,Total_C, gender, age, education)

Total_data

4. Summarize the mean, standard deviation, minimum, and maximum values for the Big Five scores separately by gender groups.

Total_data %>% 
  group_by(gender) %>% 
  summarize(across(c(Total_A,Total_E,Total_N,Total_O,Total_C),
                   list(Mean=~mean(.x,na.rm=TRUE),
                        Sigma=~sd(.x,na.rm=TRUE),
                        Max=~max(.x, na.rm = TRUE),
                        Min=~min(.x, na.rm = TRUE))))


5. Summarize the mean, standard deviation, minimum, and maximum values for the Big Five scores separately by educational level groups.
Total_data %>% 
  group_by(education) %>% 
  summarize(across(c(Total_A,Total_E,Total_N,Total_O,Total_C),
                   list(Mean=~mean(.x,na.rm=TRUE),
                        Sigma=~sd(.x,na.rm=TRUE),
                        Max=~max(.x, na.rm = TRUE),
                        Min=~min(.x, na.rm = TRUE))))
