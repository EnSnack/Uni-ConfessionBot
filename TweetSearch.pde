class TweetSearch {
  TweetSearch(String search, int countUp0) {
    ConfigurationBuilder cb = new ConfigurationBuilder();

    cb.setOAuthConsumerKey(...);
    cb.setOAuthConsumerSecret(...);
    cb.setOAuthAccessToken(...);
    cb.setOAuthAccessTokenSecret(...);


    Twitter twitter = new TwitterFactory(cb.build()).getInstance();

    Query query=new Query(search +" -RT -... -God -filter:links -filter:media -filter:native_video -filter:periscope -filter:vine -filter:images -filter:twimg");

    int today= day()-6;
    int month=month();
    int year=year();

    if (today<1) {
      if (month==4 || month==6 || month==9 || month==11) {
        today=today+30;
      }
      if (month==1 || month==3 || month==5 || month==7 || month==8 || month==10 || month==12) { 
        today=today+31;
      }
      if (month==2) { 
        today=today+28;
      } 
      month--;
    }

    query.until(year+"-"+month+"-"+today);

    query.lang("en");

    query.count(count);


    try {
      QueryResult result = twitter.search(query);

      ArrayList tweets = (ArrayList) result.getTweets();
      //for (int i = 0; i < tweets.size(); i++) {
      if (countUp0<tweets.size()) {
        Status t = (Status) tweets.get(countUp0);
        User u=(User) t.getUser();
        user = u.getName();
        long uid=t.getId();
        msg = t.getText().replaceAll("\n", " ");
        d = t.getCreatedAt();
        text=loadStrings("tweets.txt");
        if (text.length > aTweets) {
          aTweets = text.length;
        }
        String textjoin=join(text, "\n");
        if (match(textjoin, msg) == null) {
          if (match(text[0], "Tweet") == null) {
            String[] msgs={"Tweet by " + user + " at " + d + ": " + msg}; 
            saveStrings("tweets.txt", msgs);
          } else {
            String [] msgs=append(text, "Tweet by " + user + " at " + d + ": " + msg); 
            saveStrings("tweets.txt", msgs);
            aTweets = text.length+1;
          }
          textSeen = false;
          println("Tweet by " + user + " " + uid + " at " + d + ": " + msg);
        } else {
          textSeen = true;
        }
      }
    }
    catch (TwitterException te) {
      println("Couldn't connect: " + te);
    };
  }
}