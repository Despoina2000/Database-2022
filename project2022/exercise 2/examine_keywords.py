import csv
import ast

def not_exist(a,v):
    if not a:
        return True
    for value in a:
        if(value==v):
            return False

    return True

f1 = open("dataset/keyword.csv", 'w',encoding="utf8",newline='')
f2 = open("dataset/movie_keywords.csv", 'w',encoding="utf8",newline='')
f3= open("dataset/keywords.csv",'r',encoding="utf8",newline='')
csvreader = csv.reader(f3)
header = next(csvreader)
writer1 = csv.writer(f1)
writer2 = csv.writer(f2)
writer1.writerow(['id','name'])
writer2.writerow(['movie_id','keyword_id'])
array=[]
for row in csvreader:
    if row[1]=='[]':
        print('SKIP...')
        continue
    data = ast.literal_eval(row[1])
    
    for json in data:
        writer2.writerow([int(row[0]),json['id']])
        if(not_exist(array,json['id'])):
            array.append(json['id'])
            writer1.writerow([json['id'],json['name']])

 


#for row in f3:
    
f1.close()
f2.close()
f3.close()
