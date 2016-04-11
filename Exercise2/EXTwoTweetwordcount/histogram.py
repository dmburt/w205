#! /usr/bin/python

import sys
import psycopg2

def main (argv):

    conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
    cur = conn.cursor()


    k1, k2 = argv

    k1 = k1.replace(',', '')

    sql = "SELECT word, n FROM tweetwordcount WHERE n > %s and n < %s ORDER BY word ASC" % (k1,k2,)

    cur.execute(sql)

    rows = cur.fetchall()

    for row in rows:
        w = row[0]
        n = int(row[1])
        print "Word: '%s': %d"%(w, n)

    conn.commit()
    conn.close()

    if len(rows) == 0:
        print "No words with count in specified range."


if __name__ == "__main__":
    main(sys.argv[1:])
