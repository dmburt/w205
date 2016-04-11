#! /usr/bin/python

import psycopg2
import sys
import getopt

def main(argv):

    try:
        opts, args = getopt.getopt(argv,"hw",["help", "word="])

    except getopt.GetoptError:
        print "Usage: finalresults.py -w <word>"
        sys.exit(2)

    for opt, arg in opts:
        if opt == "-h":
            print "Usage: finalresults.py -w <word>"

        elif opt in ("-w", "--word"):
            conn=psycopg2.connect(database='tcount', user="postgres", password="pass", host="localhost", port="5432")
            cur=conn.cursor()

            word = sys.argv[2]

            sql = "SELECT n FROM tweetwordcount WHERE word ='%s';"%(word)
#            sql = "SELECT word, n FROM tweetwordcount WHERE word LIKE '%%%s%%';"%(word)
            cur.execute(sql)

            rows = cur.fetchall()
            for row in rows:
#                w = row[0]
                n = int(row[0])

                print "Word: '%s': %d"%(word, n)

            if len(rows) == 0:
                print "No instances of '%s' in feed."%word
            conn.commit()
            conn.close()

if __name__ == "__main__":
    main(sys.argv[1:])
