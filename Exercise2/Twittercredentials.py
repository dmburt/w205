import tweepy

consumer_key = "2F2JO7dUfQZHMJ4wSuPwh9vHd";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "pn0bKyFaIrih6jysiuc0DTY4RV6PYVpqc9bxVnf9dQNqIPiXGe";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "709570547605237760-aobsgDZ0R0mPXrokmEMq06X0K91TEnV";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "PoUQ6TUyJ5JTtf2aJnV8exQJLETRjC3htGPT7R8RtE9ar";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)
