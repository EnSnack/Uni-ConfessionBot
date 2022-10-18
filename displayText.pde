void displayText() {
  String obtain= "Secret obtained";
  String secrets= "Total secrets obtained: "+ aTweets + "/" + 4*searches.length;
  
  fill(col,col,col);
  
  textAlign(CENTER,CENTER);
  textSize(50);
  text(obtain,width/2,100);
  
  rectMode(CENTER);
  textSize(20);
  text("Tweet by " + user + ": \n" + msg,width/2,height/2,450,300);
  
  rectMode(CORNER);
  fill(0);
  noStroke();
  rect(0,height-60,width,60);
  
  
  textAlign(LEFT);
  fill(255);
  text(secrets,10,height-30);
  
  
  rectMode(CENTER);
  noFill();
  stroke(255);
  rect(width/2,height/2,500,300);
}