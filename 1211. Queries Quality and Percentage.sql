Table: Queries

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| query_name  | varchar |
| result      | varchar |
| position    | int     |
| rating      | int     |
+-------------+---------+
This table may have duplicate rows.
This table contains information collected from some queries on a database.
The position column has a value from 1 to 500.
The rating column has a value from 1 to 5. Query with rating less than 3 is a poor query.
 

We define query quality as:

The average of the ratio between query rating and its position.

We also define poor query percentage as:

The percentage of all queries with rating less than 3.

Write a solution to find each query_name, the quality and poor_query_percentage.

Both quality and poor_query_percentage should be rounded to 2 decimal places.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Queries table:
+------------+-------------------+----------+--------+
| query_name | result            | position | rating |
+------------+-------------------+----------+--------+
| Dog        | Golden Retriever  | 1        | 5      |
| Dog        | German Shepherd   | 2        | 5      |
| Dog        | Mule              | 200      | 1      |
| Cat        | Shirazi           | 5        | 2      |
| Cat        | Siamese           | 3        | 3      |
| Cat        | Sphynx            | 7        | 4      |
+------------+-------------------+----------+--------+
Output: 
+------------+---------+-----------------------+
| query_name | quality | poor_query_percentage |
+------------+---------+-----------------------+
| Dog        | 2.50    | 33.33                 |
| Cat        | 0.66    | 33.33                 |
+------------+---------+-----------------------+
Explanation: 
Dog queries quality is ((5 / 1) + (5 / 2) + (1 / 200)) / 3 = 2.50
Dog queries poor_ query_percentage is (1 / 3) * 100 = 33.33

Cat queries quality equals ((2 / 5) + (3 / 3) + (4 / 7)) / 3 = 0.66
Cat queries poor_ query_percentage is (1 / 3) * 100 = 33.33


solution :

# Write your MySQL query statement below/
SELECT query_name , ROUND((SUM(rating/position))/COUNT(query_name),2) AS quality  ,
 ROUND((SUM(CASE WHEN rating<3 THEN 1 ELSE 0 END )/COUNT(query_name))*100,2) AS poor_query_percentage 
FROM Queries 
GROUP BY query_name 

Explanation :
CASE2 :
How calculation happen for Dog queries poor_ query_percentage is (1 / 3) * 100 = 33.33

GROUP-1 :  

| query_name | result            | position | rating |
+------------+-------------------+----------+--------+
| Dog        | Golden Retriever  | 1        | 5      | - > rating < 3 -> FALSE ==> 0    |  
| Dog        | German Shepherd   | 2        | 5      | - > rating < 3 -> FALSE ==> 0    | ==> SUM(0+0+1)/COUNT(query_name)=3 ==> 1/3 *100 ==== 33.33
| Dog        | Mule              | 200      | 1      | - > rating < 3 -> FALSE ==> 1    |
 
Using this query SUM(CASE WHEN rating<3 THEN 1 ELSE 0 END ) === > We are sum when the rating less then 3 then assigning 1 other then assigning 0   

same for group 2 that means cat.


  CASE1 : How calculation happen for Dog queries quality is ((5 / 1) + (5 / 2) + (1 / 200)) / 3 = 2.50

  | query_name | result            | position | rating |
+------------+-------------------+----------+--------+
| Dog        | Golden Retriever  | 1        | 5      | --> position/rating ==> 5/1   |
| Dog        | German Shepherd   | 2        | 5      | --> position/rating ==> 5/2   |  sum(position/rating)/count(query_name) as simple 
| Dog        | Mule              | 200      | 1      | --> position/rating ==> 200/1 |  
