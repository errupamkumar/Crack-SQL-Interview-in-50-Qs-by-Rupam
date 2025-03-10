Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
In SQL, id is the primary key for this table.
id is an autoincrement column starting from 1.
 

Find all numbers that appear at least three times consecutively.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Logs table:
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
Output: 
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
Explanation: 1 is the only number that appears consecutively for at least three times.


Solutions : 

# Write your MySQL query statement below
SELECT distinct l1.num as ConsecutiveNums

FROM Logs l1,Logs l2, Logs l3
where l1.id = l2.id -1 and l2.id = l3.id -1  #checking for consecutively id id1=1 == id2 =1 ==id3= 1 
and l1.num = l2.num and l2.num = l3.num ;    # checking numbers are same or not 

