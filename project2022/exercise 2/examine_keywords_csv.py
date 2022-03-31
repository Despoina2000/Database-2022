import csv
import ast

file = open("\dataset\keywords.csv")

#read

csvreader = csv.reader(file, 'r',encoding='utf8')
header = next(csvreader)
print(header)
for row in csvreader:
    print(row)

jsonString = "[{'id': 931, 'name': 'jealousy'}, {'id': 6054, 'name': 'friendship'}]"
data = ast.literal_eval(jsonString)
print(data) #print [{'id': 931, 'name': 'jealousy'}, {'id': 6054, 'name': 'friendship'}]
print(data[0]) #print [{'id': 931, 'name': 'jealousy'}]
print(data[0]['id'])#print [{'id': 931, 'name': 'jealousy'}]

file.close()