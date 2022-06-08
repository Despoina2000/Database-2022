from mpl_toolkits.mplot3d import axes3d
import psycopg2
import matplotlib.pyplot as plt
import numpy as np

# Update connection string information
host = "stragalisserver2022.postgres.database.azure.com"
dbname = "postgres"
user = "stragalisn@stragalisserver2022"
password = "Stragalis1995"
sslmode = "require"

# Construct connection string
conn_string = "host={0} user={1} dbname={2} password={3} sslmode={4}".format(host, user, dbname, password, sslmode)
conn = psycopg2.connect(conn_string)
print("Connection established")
cursor = conn.cursor()

# scatter plot for query one

cursor.execute("SELECT EXTRACT(year FROM m.release_Date) AS year, COUNT (m.id) FROM \"Movie\" m GROUP BY EXTRACT(year FROM m.release_Date) HAVING EXTRACT(year FROM m.release_Date) is not null ORDER BY EXTRACT(year FROM m.release_Date);")
rows = cursor.fetchall()
array_x_one=[]
array_y_one=[]
for row in rows:
    print("Data row = (%s,%s)" %(str(row[0]),str(row[1])))
    array_x_one.append(row[0])
    array_y_one.append(row[1])
x = np.array(array_x_one)
y = np.array(array_y_one)
plt.xlabel('YEAR')
plt.ylabel('MOVIE')
plt.bar(x, y)
plt.savefig("Query1.png", dpi = 1000)
plt.show()
# scatter plot for query two
cursor.execute("SELECT g.name, COUNT (m.id) FROM \"Movie\" m , \"Movie_Genres\" mg, \"Genre\" g WHERE m.id = mg.movie_id AND g.id = mg.genre_id GROUP BY g.name ORDER BY g.name;")
rows = cursor.fetchall()
array_x_two=[]
array_y_two=[]
for row in rows:
    print("Data row = (%s,%s)" %(str(row[0]),str(row[1])))
    array_x_two.append(row[0])
    array_y_two.append(row[1])
x = np.array(array_x_two)
y = np.array(array_y_two)
plt.xlabel('GERNE')
plt.ylabel('MOVIE')
plt.bar(x, y)
plt.savefig("Query2.png", dpi = 1000)
plt.show()

# scatter plot for query three

cursor.execute("SELECT EXTRACT(year FROM m.release_Date) AS year, g.name, COUNT (m.id) FROM \"Movie\" m , \"Movie_Genres\" mg, \"Genre\" g WHERE m.id = mg.movie_id AND g.id = mg.genre_id GROUP BY EXTRACT(year FROM m.release_Date), g.name HAVING EXTRACT(year FROM m.release_Date) is not null AND COUNT (m.id)>0 ORDER BY EXTRACT(year FROM m.release_Date), g.name;")
rows = cursor.fetchall()
array_x_three=[]
array_y_three=[]
array_z_three=[]
for row in rows:
    array_x_three.append(row[1])
    array_y_three.append(row[0])
    array_z_three.append(row[2])
xVal = array_x_three
yVal = array_y_three
zVal = array_z_three
# Initializing Figure
fig = plt.figure()
ax1 = fig.add_subplot(111, projection='3d')
ax1.set_facecolor((1.0, 1.0, 1.0))
# Creating a dictionary from categories to x-axis coordinates
xCategories = xVal
i=0
xDict = {}
x=[]
for category in xCategories:
  if category not in xDict:
    xDict[category]=i
    x.append(i)
    i+=1
  else:
    x.append(xDict[category])
# Defining the starting position of each bar (x is already defined)
z = np.zeros(len(x))
# Defining the length/width/height of each bar.
dx = np.ones(len(x))*0.01
dy = np.ones(len(x))
dz = zVal
ax1.bar3d(x, yVal, z, dx, dy, dz)
ax1.set_zlim([0, max(zVal)])
plt.xticks(range(len(xDict.values())), xDict.keys())
plt.show()
# scatter plot for query four

cursor.execute("SELECT EXTRACT(year FROM m.release_Date) AS year, MAX(m.budget) FROM \"Movie\" m GROUP BY EXTRACT(year FROM m.release_Date)HAVING EXTRACT(year FROM m.release_Date) is not null ORDER BY EXTRACT(year FROM m.release_Date);")
rows = cursor.fetchall()
array_x_four=[]
array_y_four=[]
for row in rows:
    print("Data row = (%s,%s)" %(str(row[0]),str(row[1])))
    array_x_four.append(row[0])
    array_y_four.append(row[1])
x = np.array(array_x_four)
y = np.array(array_y_four)
plt.xlabel('YEAR')
plt.ylabel('MAX BUDGET')
plt.bar(x, y)
plt.savefig("Query4.png", dpi = 1000)
plt.show()
# scatter plot for query five

cursor.execute("SELECT EXTRACT(year FROM m.release_Date) AS year, SUM(m.revenue) FROM \"Movie\" m, \"Movie_Cast2\" mc WHERE m.id = mc.movie_id AND mc.person_id = 4173 GROUP BY EXTRACT(year FROM m.release_Date) ORDER BY EXTRACT(year FROM m.release_Date);")
rows = cursor.fetchall()
array_x_five=[]
array_y_five=[]
for row in rows:
    print("Data row = (%s,%s)" %(str(row[0]),str(row[1])))
    array_x_five.append(row[0])
    array_y_five.append(row[1])
x = np.array(array_x_five)
y = np.array(array_y_five)
plt.xlabel('YEAR')
plt.ylabel('REVENEU')
plt.bar(x, y)
plt.savefig("Query5.png", dpi = 1000)
plt.show()

# scatter plot for query six

cursor.execute("SELECT r.user_id, CAST(AVG(r.rating) AS DECIMAL(10,2)) FROM \"Ratings\" r GROUP BY r.user_id ORDER BY r.user_id;")
rows = cursor.fetchall()
array_x_six=[]
array_y_six=[]
for row in rows:
    print("Data row = (%s,%s)" %(str(row[0]),str(row[1])))
    array_x_six.append(row[0])
    array_y_six.append(row[1])
x = np.array(array_x_six)
y = np.array(array_y_six)
plt.xlabel('USER ID')
plt.ylabel('AVG RATING')
plt.scatter(x, y,s=1)
plt.savefig("Query6.png", dpi = 1000)
plt.show()

# scatter plot for query seven

cursor.execute("SELECT r.user_id, COUNT(r.rating) FROM \"Ratings\" r GROUP BY r.user_id ORDER BY r.user_id")
rows = cursor.fetchall()
array_x_seven=[]
array_y_seven=[]
for row in rows:
    print("Data row = (%s,%s)" %(str(row[0]),str(row[1])))
    array_x_seven.append(row[0])
    array_y_seven.append(row[1])
x = np.array(array_x_seven)
y = np.array(array_y_seven)
plt.xlabel('USER ID')
plt.ylabel('COUNT RATING')
plt.scatter(x, y,s=1)
plt.savefig("Query7.png", dpi = 1000)
plt.show()

# scatter plot for query eight

cursor.execute("SELECT r.user_id, CAST(AVG(r.rating) AS DECIMAL(10,2)), COUNT(r.rating) FROM \"Ratings\" r GROUP BY r.user_id ORDER BY r.user_id")
rows = cursor.fetchall()
array_x_eight=[]
array_y_eight=[]
array_z_eight=[]
for row in rows:
    array_x_eight.append(row[1])
    array_y_eight.append(row[2])
    array_z_eight.append(row[0])
xVal = array_x_eight
yVal = array_y_eight
zVal = array_z_eight
# Initializing Figure
fig = plt.figure()
ax1 = fig.add_subplot(111, projection='3d')
ax1.set_facecolor((1.0, 1.0, 1.0))
# Creating a dictionary from categories to x-axis coordinates
xCategories = xVal
i=0
xDict = {}
x=[]
for category in xCategories:
  if category not in xDict:
    xDict[category]=i
    x.append(i)
    i+=1
  else:
    x.append(xDict[category])
# Defining the starting position of each bar (x is already defined)
z = np.zeros(len(x))
# Defining the length/width/height of each bar.
dx = np.ones(len(x))*0.1
dy = np.ones(len(x))
dz = zVal
ax1.scatter(x, yVal, z, dx, dy, dz)
ax1.set_zlim([0, max(zVal)])
plt.xticks(range(len(xDict.values())), xDict.keys())
plt.show()
    
# Clean up
conn.commit()
cursor.close()
conn.close()
