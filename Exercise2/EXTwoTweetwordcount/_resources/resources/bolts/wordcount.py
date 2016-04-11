from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt
from redis import StrictRedis
import string
import psycopg2


class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()
        self.redis  = StrictRedis()
#        self.conn   = psycopg2.connect(database='tcount', user="postgres", password="pass", host="localhost")
#        self.cur    = self.conn.cursor()

    def process(self, tup):
        word              = tup.values[0]
        self.counts[word] += 1
        self.emit([word, self.counts[word]])
        self.log('%s: %d' % (word, self.counts[word]))
        self.sqlprocess(word, self.counts[word])

    def sqlprocess(self, inword, incount):
        self.conn   = psycopg2.connect(database='tcount', user="postgres", password="pass", host="localhost", port="5432")
        self.cur    = self.conn.cursor()
        removechar  = set(string.punctuation)
        thisword    = ''.join(a for a in inword if a not in removechar)
#        thisword    = inword.replace("'","")
#        thisword    = thisword.replace('"','')
        thisword    = thisword.lower()
#        interestwords = ['flu','influenza','gripe','gripa','griep','grippe']



## Breaking up updates and inserts with an initial SELECT.
## This adds another transaction, but I'm not sure how often this transaction is called
## (i.e., once per word, or in batches).
##
        self.cur.execute("SELECT word, n FROM tweetwordcount WHERE word='%s'" % thisword)
        rows = self.cur.fetchall()

        if len(rows) > 0:
            uWord = str(int(rows[0][1]) + 1)
            self.cur.execute("UPDATE tweetwordcount SET n = %s WHERE word=%s",(uWord,thisword))
            self.conn.commit()

        if len(rows) == 0:
            self.cur.execute("INSERT INTO tweetwordcount (word, n) VALUES ('%s',1)" % thisword)
            self.conn.commit()

        self.conn.close()


## Didn't get enough hits on flu-related words.  Reverting to writing all words.
## Also, the methodology in the "basic module usage" section of the 2.6.2.dev0
## documentation didn't seem to work--I got strange characters coming through
## that I couldn't stop with replace() or strip().
##
#        interestwords = ['flu','influenza','gripe','gripa','griep','grippe']
#        SQL_no_u  = "UPDATE tweetwordcount SET n=%s WHERE word = 'OTHER';"
#        SQL_no_i  = "INSERT into tweetwordcount (word, n) SELECT 'OTHER', %s WHERE NOT EXISTS (SELECT 1 FROM tweetwordcount where word = 'OTHER');"
#        SQL_yes_u = "UPDATE tweetwordcount SET n=%s WHERE word = '%s';"
#        SQL_yes_i = "INSERT INTO tweetwordcount (word, n) SELECT '%s', %s WHERE NOT EXISTS (SELECT 1 FROM tweetwordcount WHERE word ='%s');"
#
#        if thisword not in interestwords:
#            self.cur.execute(SQL_no_u, (incount,))
#            self.conn.commit()
#            self.cur.execute(SQL_no_i, (incount,))
#            self.conn.commit()
#            self.conn.close()
#        else:
#            self.cur.execute(SQL_yes_u, (incount, thisword))
#            self.conn.commit()
#            self.cur.execute(SQL_yes_i, (thisword, incount, thisword))
#            self.conn.commit()
#            self.conn.close()

#    self.sqlprocess(word, self.counts[word])
