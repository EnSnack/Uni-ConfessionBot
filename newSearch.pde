void newSearch() {
  if (runSearch) {
    TweetSearch tweetSearch=new TweetSearch(searches[tweety], countup);
    col=255;
    runSearch=false;
  }

  if (col<=0) {
    tweety++;
    time=0;
    runSearch=true;
  }

  if (tweety==searches.length) {
    countup++;
    tweety=0;
    if (countup>=count) {

      runSearch=false;  
      runText=false;
    }
  }


  if (runText) {
    time++;
    if (time>50) {
      col=col-15;
    }
    if (!textSeen) {
      displayText();
    }
    else {
     col=0; 
    }
  }
}