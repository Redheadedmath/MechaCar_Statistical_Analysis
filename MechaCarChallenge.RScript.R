library(dplyr)
#Deliverable 1
mpg_db = read.csv('MechaCar_mpg.csv')
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,mpg_db))
AWD_db = filter(mpg_db, AWD == 1)
nAWD_db = filter(mpg_db, AWD == 0)
mpgAWD = subset(mpg_db, AWD == 1, select = mpg)
mpgnAWD = subset(mpg_db, AWD == 0, select = mpg)
t.test(mpgAWD, mpgnAWD, alternative = "two.sided", var.equal = FALSE)
temp <- as.numeric(unlist(mpgAWD))
shapiro.test(temp)
temp2 <- as.numeric(unlist(mpgnAWD))
shapiro.test(temp2)

#Deliverable 2
suspension_db = read.csv('Resources/Suspension_Coil.csv')
total_summary <- suspension_db %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))
lot_summary <- suspension_db %>% group_by(Manufacturing_Lot) %>%
  summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))
total_PSI <- suspension_db %>% group_by(Manufacturing_Lot)
t.test(total_PSI, mu = 1500, alternative = "two.sided", var.equal = FALSE )
lot1 <- filter(total_PSI, Manufacturing_Lot == 'Lot1')
lot1_PSI <- lot1['PSI']
lot2 <- filter(total_PSI, Manufacturing_Lot == 'Lot2')
lot2_PSI <- lot2['PSI']
lot3 <- filter(total_PSI, Manufacturing_Lot == 'Lot3')
lot3_PSI <- lot3['PSI']
t.test(lot1_PSI, mu = 1500, alternative = "two.sided", var.equal = FALSE )
t.test(lot2_PSI, mu = 1500, alternative = "two.sided", var.equal = FALSE )
t.test(lot3_PSI, mu = 1500, alternative = "two.sided", var.equal = FALSE )
PSI_aov <- aov(PSI ~ Manufacturing_Lot, data = total_PSI)
summary(PSI_aov)
TukeyHSD(PSI_aov)
#Visualizations

