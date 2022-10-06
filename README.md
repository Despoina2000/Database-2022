# Database
The project involves managing a database on an Azure server. Use the SQL language and the pgAdmin programm.

## Exercise 1
Instructions for creating an account and base with Microsoft Azure.

## Exercise 2
The creation of the Movielens database, which contains film descriptions and statistics. More specifically, there is a folder containing the codes of the sql tables, which receive data from the dataset folder. To process the Nested JSON of keyword.csv we created a file examine_keywords.py, where we split it into two different csv files: movie_keywords.csv (containing the movie - keywords dependency) and keywords.csv (containing the id - keyword dependency). Finally, the file examine_collection.py is for recording unique collections and avoiding duplicates.

## Exercise 3
Processing of the databases data using twelve sql queries stored in the corresponding sql file. Each query has a comment about its purpose. The Queries notes.txt contains information about the queries producers process.

## Exercise 4
Correcting the functional dependencies in the corresponding sql file, where we delete the actors that have above name or gender and restore the dependencies with the alter tables. Also the dependencies are reproduced in the er model.

## Exercise 5
Reconfigure the database by creating an extra Person table, incorporating the Actor and CrewMember tables, in part1.sql, so that the database has the BCNF form. In part2.sql we have created three queries to see if we succeeded it. Again, we made an er model.

## Project 2021
In the project we dealt with the creation of statistics through sql queries. In all the profiles we followed the following course of action:
1. Executions the sql query 
2. Save the fetch in a row variable
3. Create a corresponding number of tables, 2 if the layout is 2D
and 3 if it is three-dimensional, so that we can store the output of the results
of the variable rows.
4. Store in numpy array format and put it as a parameter in the corresponding
representation program.

## Team Members
- [Anastasia Katsaiti](https://github.com/akatsaiti)
- [Despoina Papadopoulou](https://github.com/Despoina2000)
