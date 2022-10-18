import java.util.Date;

String [] searches={"I confession actually","I do OR did actually", "I Confession: OR confession:","TBH I actually","truth be told I -undulation","TBH I feel","truth be told I feel -undulation","%22Never have I ever%22","HonestHour -DM","%22I admit%22","%22secret confession%22","confession I love OR hate -yesung","confession I hate","confession I like"};
//String [] searches={"I confession actually","I do OR did actually", "I Confession: OR confession:","TBH I actually","truth be told I -undulation","TBH I feel","truth be told I feel -undulation"};

String [] text;
String user;
String msg;
Date d;

int time=0;
int aTweets=1;
int col=255;
int tweety=0;
int count=3;
int countup=0;

boolean runSearch=true;
boolean runText=true;
boolean textSeen=false;


void setup () {
  size(700,700);
  frameRate(60);
}


void draw () {
  background(0);
  newSearch();
}