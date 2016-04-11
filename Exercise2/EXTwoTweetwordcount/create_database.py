from psycopg2 import connect
import sys
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

con = None
con = connect(dbname='postgres', user='postgres', host='localhost', password='pass')

dbname = 'tcount'

con.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
cur = con.cursor()
cur.execute('CREATE DATABASE ' + dbname)


## close and reconnect to new database
cur.close()
con.close()


con = connect(dbname='tcount', user='postgres', host='localhost', password='pass')

con.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
cur = con.cursor()
cur.execute('''CREATE TABLE Tweetwordcount
               (word TEXT PRIMARY KEY NOT NULL,
                n    INT              NOT NULL);'''
               )
cur.close()
con.close()
