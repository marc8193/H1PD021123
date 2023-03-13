import pymssql  
    
conn = pymssql.connect(server='docker.data.techcollege.dk', 
                       user='h1pd021123', 
                       password='h1pd021123', 
                       database='h1pd021123_Jokes') 

cursor = conn.cursor()  
cursor.execute("insert into jokes (joke) Values ('en datatekniker, itsupporter...')")  

row = cursor.fetchone()  
while row:  
    print("Inserted Jokes: " +str(row[0]))
    row = cursor.fetchone()  
conn.commit() 

conn.close()