
-- Exploratory Data Analysis

WITH HOTELS AS (
SELECT * FROM [Hotel Project]..['2018$']
UNION
SELECT * FROM [Hotel Project]..['2019$']
UNION
SELECT * FROM [Hotel Project]..['2020$'])

SELECT * FROM HOTELS
LEFT JOIN [Hotel Project]..[market_segment$] as market
ON HOTELS.market_segment = market.market_segment
LEFT JOIN [Hotel Project]..meal_cost$ as meal
ON HOTELS.meal = meal.meal

SELECT 
arrival_date_year,
hotel,
SUM(adr*(stays_in_week_nights+stays_in_weekend_nights)) revenue 
FROM HOTELS
GROUP BY arrival_date_year,hotel

SELECT DISTINCT(hotel) FROM [Hotel Project]..['2018$']