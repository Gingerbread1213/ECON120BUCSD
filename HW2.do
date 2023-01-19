
clear all

***set work dictionary and import data
cd "/Users/liuhaojie/Desktop/ECON120BUCSD"
use baseballsalaries.dta

**** create new log
cap log close
log using HW2.log, replace

**** summarize data
describe
summarize

***********************************************

*Q1
*a. What is the average payroll for these thirty teams? (note: the payroll variable is in thousands of dollars) Is there a lot of variation in payroll or minimal variation in payroll?

summarize payroll
di "Average payroll(in thousands) = " r(mean)
* The average is 42170280 dollars, which has a large standard deviation of 17830280 dollars

*b. What is the average percentage of games won by a team?

generate total_games = wins + losses
generate percentage_won = (wins/total_games)*100

label var total_games "Total games played by a team"
label var percentage_won "Average percentage of game won"

sum percentage_won

di "Percentage of games won by a team = " r(mean)

*c Graph a scatterplot of the team's winning percentage versus payroll. (hint: type help graph twoway in Stata).



twoway scatter percentage_won payroll, title("Winning percentage vs. payroll")

graph export "1c_graph.png", replace

*d What is the difference in average payroll for teams which make the playoffs compared to teams which do not? Is this difference (i) large in a real world sense, (ii) statistically significant (test this formally), and (iii) likely to be causal?

summarize payroll if playoffs ==1
generate pass_payroll_mean = r(mean)
generate pass_payroll = payroll if playoffs ==1

summarize payroll if playoffs ==0
generate no_pass_payroll_mean = r(mean)
generate no_pass_payroll = payroll if playoffs ==0

di "Difference in average payroll between playoffs teams = " pass_payroll_mean-no_pass_payroll_mean
di "Which is a large difference in real world" 

ttest pass_payroll == no_pass_payroll, unpaired

di "It is statistically significant"
di "Also, as we can see that there is a large difference of payroll between playoffs teams and not playoffs teams"
di "Which means that it is causal"









