clear all

***set work dictionary and import data
cd "/Users/liuhaojie/Desktop/ECON120BUCSD"
use Growth.dta

**** create new log
cap log close
log using HW4_stata.log, replace

**** summarize data
describe
summarize

*On the text website, http://www.pearsonhighered.com/stock_watson/, you will find the data file Growth, which contains data on average growth rates from 1960 through 1995 for 65 countries, along with variables that are potentially related to growth.1 A detailed description is given in Growth_Description, also available on the website. In this exercise, you will investigate the relation- ship between growth and trade.

*a. Construct a scatterplot of average annual growth rate (Growth) on the average trade share (TradeShare). Does there appear to be a relationship between the variables?

twoway scatter growth tradeshare, title("Growth vs. TradeShare")
graph export "HW4_stata_a.png", replace

di "The graph does appeal a positive relationship between these two factors"

*b. One country, Malta, has a trade share much larger than the other coun- tries. Find Malta on the scatterplot. Does Malta look like an outlier?

di "No, Malta does not looks like a outlier. Even the point is far away from the other data point, it still fall into the belt of the regression line"

*c. Using all observations, run a regression of Growth on TradeShare. What is the estimated slope? What is the estimated intercept? Use the regression to predict the growth rate for a country with a trade share of 0.5 and for another with a trade share equal to 1.0.

regress growth tradeshare

di "The estimated slope is 2.306, estimated intercept is 0.6403"
di "the growth rate for a country with a trade share of 0.5 is" 0.6303+(2.306*0.5)
di "the growth rate for a country with a trade share of 1.0 is"0.6303+(2.306*1)

*d. Estimate the same regression, excluding the data from Malta. Answer the same questions in (c).

generate no_Malta_growth = growth if country_name != "Malta"
generate no_Malta_tradeshare = tradeshare if country_name != "Malta"


regress no_Malta_growth no_Malta_tradeshare

di "The estimated slope is 1.6809, estimated intercept is 0.9574"
di "the growth rate for a country with a trade share of 0.5 is" 0.9574+(1.6809*0.5)
di "the growth rate for a country with a trade share of 1.0 is"0.9574+(1.6809*1)

*e. Plot the estimated regression functions from (c) and (d). Using the scatterplot in (a), explain why the regression function that includes Malta is steeper than the regression function that excludes Malta.

twoway scatter no_Malta_growth no_Malta_tradeshare, title("No Malta Growth vs. TradeShare")
graph export "HW4_stata_d.png", replace

di "Malta is strong outlier in this scatter plot, which strongly affect the rate of the regression"

*f. Where is Malta? Why is the Malta trade share so large? Should Malta be included or excluded from the analysis?

di "Malta is an island country in the Mediterranean Sea. It consists of an archipelago, between Italy and Libya, and is often considered a part of Southern Europe. Malta has a large tradeshare is because the economy of Malta is mostly related on trade. Also, it should not be included from the analysis since it is one of the strong outlier in this relationship"



clear all

use CollegeDistance.dta

describe
summarize

*The data file CollegeDistance contains data from a random sample of high school seniors interviewed in 1980 and re-interviewed in 1986. In this exercise, you will use these data to investigate the relationship between the number of completed years of education for young adults and the distance from each student’s high school to the nearest four-year college. (Proximity to college lowers the cost of education, so that students who live closer to a four-year college should, on average, complete more years of higher education.) A detailed description is given in College Distance_Description, also available on the Web site.1

*a. Run a regression of years of completed education (ED) on distance to the nearest college (Dist), where Dist is measured in tens of miles. (For example, Dist = 2 means that the distance is 20 miles.) What is the estimated intercept? What is the estimated slope? Use the estimated regression to answer this question: How does the average value of years of completed schooling change when colleges are built close to where students go to high school?

regress ed dist
di "The estimated slope is -0.0734, estimated intercept is 13.956"
di "As the distance of the nearest college increase, the years of completed school will decreases"

*b. Bob’s high school was 20 miles from the nearest college. Predict Bob’s years of completed education using the estimated regression. How would the prediction change if Bob lived 10 miles from the nearest college?

di "the years of completed school will be " 13.956-0.0734*20 " for 20 miles from nearset college"
di "the years of completed school will be " 13.956-0.0734*10 " for 10 miles from nearset college"

*c. Does distance to college explain a large fraction of the variance in educational attainment across individuals? Explain.

di "It does not appeal a large fraction of the variance in educational attainment across individuals since that the distance to college in not the only factor that will affect the completed years of college"

*d. What is the value of the standard error of the regression? What are the units for the standard error (meters, grams, years, dollars, cents, or something else)?

di "SER of the regression is 93.026 in miles"








