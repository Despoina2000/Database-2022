import csv
import ast

f1 = open("dataset/keyword.csv", 'w')
f2 = open("dataset/movie_keywords.csv", 'w')
f3= open("dataset/keywords.csv",'r')
csvreader = csv.reader(f3)
header = next(csvreader)
writer1 = csv.writer(f1)
writer2 = csv.writer(f2)
writer1.writerow(['movie_id','keyword_id'])
writer2.writerow(['id','name'])

for row in csvreader:
    if row[1]=='[]':
        print('SKIP...')
        continue
    data = ast.literal_eval(row[1])
    
    for json in data:
        writer2.writerow([int(row[0]),json['id']])
        writer1.writerow([json['id'],json['name']])

 


#for row in f3:
    
f1.close()
f2.close()
f3.close()