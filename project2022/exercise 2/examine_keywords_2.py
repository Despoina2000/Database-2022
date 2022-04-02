import csv
import ast

def not_exist(a,v):
    if not a:
        return False
    for value in a:
        if(value==v):
            return False

    return True

f3= open("dataset/keywords.csv",'r',encoding="utf8")
f2 = open("dataset/movie_keywords.csv", 'w',encoding="utf8")

csvreader = csv.reader(f3)
header = next(csvreader)
writer2 = csv.writer(f2)
writer2.writerow(['movie_id','keyword_id'])
for row in csvreader:
    if row[1]=='[]':
        print('SKIP...')
        continue
    data = ast.literal_eval(row[1])
    
    for json in data:
        writer2.writerow([int(row[0]),json['id']])
f3.close()
f2.close()
