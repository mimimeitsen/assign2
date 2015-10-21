PImage bg1;
PImage bg2;
PImage enemy;
PImage fighter;
PImage hp;
PImage treasure;
PImage start1;
PImage start2;
PImage end1;
PImage end2;

//gamestate
final int GAME_START=1;
final int GAME_RUN=2;
final int GAME_LOSE=3;
int gamestate;


int bgX,enemyX,enemyY;
int hpWidth;
int treasureX,treasureY;
int fighterX,fighterY;
int start1X, start2X;
int count;


boolean isPlaying=false;
boolean upPressed=false;
boolean downPressed=false;
boolean leftPressed=false;
boolean rightPressed=false;

float speed;

//HP
int a;


void setup () 

{
  size(640,480) ; 
  bg1=loadImage("img/bg1.png");
  bg2=loadImage("img/bg2.png");
  enemy=loadImage("img/enemy.png");
  fighter=loadImage("img/fighter.png");
  hp=loadImage("img/hp.png");
  treasure=loadImage("img/treasure.png");
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
  
  bgX=0;
  start1X=0;
  
  a=10;
  treasureX=floor(random(0,640));
  treasureY=floor(random(0,480));
  fighterX=floor(random(0,640));
  fighterY=floor(random(0,480));
  enemyX=0;
  enemyY=floor(random(0,480));
  speed=5;
  gamestate=GAME_START;
  count=0;
  
  
}

void draw() {
  
switch(gamestate){ 
  case GAME_START:
    image(start2,0,0);
    if(mouseX>207 && mouseX<463 && mouseY>326&& mouseY<421 ){
      image(start1,0,0);
      if(mousePressed){
        gamestate=GAME_RUN;
      }
    }
   break;
  
  
  case GAME_RUN:
  if(isPlaying=true){
    
    if(upPressed==true){
      fighterY-=speed;}
    if(downPressed==true){
      fighterY+= speed;}
    if(leftPressed==true){
      fighterX-=speed;}
    if(rightPressed==true){
      fighterX+=speed;}
      
    //boundary detection
    if(fighterX<0){
      fighterX=0;}
    if(fighterX>584){
      fighterX=584 ;}
    if(fighterY<0){
      fighterY=0;}
    if(fighterY>429){
      fighterY=429;}
  
    
    //background  
    bgX+=2;
    image(bg2,bgX,0);
    image(bg1,bgX-bg2.width,0);
    image(bg2,bgX-bg2.width-bg1.width,0);
    bgX %=bg1.width+bg2.width;
    
    //fighter
    image(fighter,fighterX,fighterY);
    
   
    //hp
    stroke(255,0,0);
    fill(255,0,0);
    rect(41,25,a*19,19);
    image(hp,28,22);
    
    
    
    //teasure
    count++;
    image(treasure,treasureX,treasureY);
    if(count % 300 ==0){
      treasureX=floor(random(40,600));
      treasureY=floor(random(60,420));
    }
    
    //enemy
    if(enemyX==680){
      enemyX=0;
      enemyY=floor(random(61,421));
    }
    enemyX+=5;
    if(enemyY>fighterY){enemyY+=((-enemyY+fighterY)-20)/40;}
    if(enemyY<fighterY){enemyY+=((-enemyY+fighterY)+20)/40;}
    image(enemy,enemyX,enemyY);
    
   
    
     //HIT DETECTION
    if(fighterX+30>=enemyX && 
       fighterX+30<=enemyX+61 && 
       fighterY+30>=enemyY && 
       fighterY+30<=enemyY+61 ){
      a-=2;
      enemyX=0;
      enemyY=floor(random(0,429));
      
    }
    
    
    if( fighterX+30>=treasureX && 
        fighterX+30<= treasureX+41 && 
        fighterY+30 >= treasureY && 
        fighterY+30<= treasureY+41)
        {
        a+=1;
        treasureX=floor(random(40,600));
        treasureY=floor(random(60,420));
      
      //cap
      if(a>=10){
        a=10;
      }
    }
    if(a==0){
      gamestate=GAME_LOSE;
    }
    
    
  }
   break;
  
    
    case GAME_LOSE:
    image(end2,0,0);
      if(mouseX>=207 && mouseX<=463 && mouseY>= 275 && mouseY<=370){
        image(end1,0,0);
         if(mousePressed){
        gamestate=GAME_RUN;
        a=10;
        }
      }
      break;
    
    }
  
 } 



void keyPressed(){
  if(key==CODED){
    switch(keyCode){
      case UP:
        upPressed=true;
        break;
      case DOWN:
        downPressed=true;
        break;
      case LEFT:
        leftPressed=true;
        break;
      case RIGHT:
        rightPressed=true;
        break;
    }
  }
  
}
  
  void keyReleased(){
    if(key==CODED){
      switch(keyCode){
        case UP:
        upPressed=false;
        break;
      case DOWN:
        downPressed=false;
        break;
      case LEFT:
        leftPressed=false;
        break;
      case RIGHT:
        rightPressed=false;
        break;
      }
    }
  }
  
  
