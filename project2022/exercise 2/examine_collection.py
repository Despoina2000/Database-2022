import csv
import ast

def not_exist(a,v):
    if not a:
        return True
    for value in a:
        if(value==v):
            return False

    return True

f2 = open("dataset/new_collection.csv", 'w',encoding="utf8",newline='')
f3= open("dataset/collection.csv",'r',encoding="utf8",newline='')
csvreader = csv.reader(f3)
header = next(csvreader)
writer1 = csv.writer(f2)
array=[]
for row in csvreader:
    if(not_exist(array,row[0])):
        array.append(row[0])
        writer1.writerow([row[0],row[1]])
