// Martín van Puffelen López
import processing.sound.*;

PShape green, red, yellow, blue;
// Actual player score
int score;
// Stores as integers the beeps the game has to repeat, size will grow in every round.
ArrayList<Integer> beepsGame;
// Gets the actual zone clicked by player
int zoneClicked;
int zone;
int clickCount;
int pointerDisplay;
boolean justClicked;
boolean justGenerated;
boolean lostSound;

PFont font;
PFont font2;
final int MODE_ENTER=0;
final int MODE_DISPLAY=1;
final int MODE_GAME=2;
final int MODE_LOST=3;
int mode;

int time;
final int BEEP_DURATION = 850;
boolean beepGreen,beepRed,beepYellow,beepBlue;
// Sounds 
// Game failed noise
PinkNoise noise;
// Red button noise
SqrOsc redSquare;
// Blue button noise
SinOsc blueSine;
// Yellow button noise
Pulse yellowPulse;
// Green button noise
TriOsc greenSaw;
// ASR Curve
Env env;

// ASR values
final float attackTime = 0.002;
final float sustainTime = 0.004;
final float sustainLevel = 0.3;
final float releaseTime = 0.4;

void setup(){
  size(800,800);
  background(240);
  font=createFont("Cambria Italic",20);
  font2=createFont("Cambria",20);
  textFont(font, 20);
  clickCount=0;
  score=0;
  justClicked=false;
  pointerDisplay=0;
  green=createShape(RECT, width/2-150, height/2-130, 120,120,28);
  green.setFill(color(110, 170, 94));
  red=createShape(RECT, width/2+30, height/2-130, 120,120,28);
  red.setFill(color(190,34,34));
  yellow=createShape(RECT, width/2-150, height/2+15, 120,120,28);
  yellow.setFill(color(200, 200, 0));
  blue=createShape(RECT, width/2+30, height/2+15, 120,120,28);
  blue.setFill(color(65,105,225));
  zoneClicked=0;
  noise = new PinkNoise(this);
  redSquare = new SqrOsc(this);
  blueSine = new SinOsc(this);
  yellowPulse=new Pulse(this);
  greenSaw= new TriOsc(this);
  env  = new Env(this); 
  mode=MODE_ENTER;
  beepsGame = new ArrayList<Integer>();
  justGenerated=false;
  lostSound=false;
}

void draw(){
  background(240);
  fill(30);
  circle(width/2,height/2,420);
  fill(80);
  textFont(font, 35);
  text("Simon Game", width/2-100, 50);
  if(mode==MODE_ENTER){
     textSize(25);
     text("Are you able to follow the sounds?", width/2-150, 110);
     textFont(font2,20);
     text("Press ESPACE to start game", width/2-100, height-120);
     text("Press ESC to get back to menu", width/2-100, height-100);
  }
    if(mode==MODE_GAME || mode== MODE_DISPLAY){
      if(beepGreen){
        green.setFill(color(0,255,0));
        if (millis() - time > BEEP_DURATION)beepGreen = false;
      }else{
        green.setFill(color(110, 170, 94));
      }
      if(beepRed){
        red.setFill(color(255, 0, 0));
        if (millis() - time > BEEP_DURATION)beepRed = false;
      }else{
        red.setFill(color(190,34,34));
      }
      if(beepYellow){
        yellow.setFill(color(255, 255, 51));
        if (millis() - time > BEEP_DURATION)beepYellow = false;
      }else{
        yellow.setFill(color(200, 200, 0));
      }
      if(beepBlue){
        blue.setFill(color(0,191,255));
        if (millis() - time > BEEP_DURATION)beepBlue = false;
      }else{
        blue.setFill(color(65,105,225));
      }
  }
  
  if(mode==MODE_DISPLAY){ // Part when game displays sounds the player has to copy
        if(!justGenerated){
          zone=getRandomZone();
          beepsGame.add(zone);
          justGenerated=true; 
        }
        if (millis() - time > BEEP_DURATION) {
          beep(beepsGame.get(pointerDisplay));
          pointerDisplay++;
          time=millis();
        }
        if(pointerDisplay==beepsGame.size()){
          mode=MODE_GAME;
        }
  }
  if(mode==MODE_GAME && justClicked){
    justClicked=false;
    if(beepsGame.get(clickCount-1)!=zoneClicked ){
      mode=MODE_LOST;
    }
    else if(clickCount==beepsGame.size() ){
      justGenerated=false;
      score++;
      pointerDisplay=0;
      clickCount=0;
      mode=MODE_DISPLAY;
      
    }
  }
  if(mode==MODE_LOST){
    if(!lostSound){
      noise.play();
      env.play(noise, 0.04, 1, 5, 4);
      lostSound=true;
    }
    textFont(font, 25);
    text("You lost with score: " +score+"!",  width/2-110, 130);
    textFont(font2, 20);
    text("Want to retry? Press R",width/2-70, height-150);
    if(keyPressed&& key=='r'){
      reset();
      mode=MODE_DISPLAY;
    }
  }
  shape(green);
  shape(red);
  shape(yellow);
  shape(blue);
  fill(255);
  textSize(20);
  text(score, width/2-5, height/2);
}

// Function that gets random zone to display sound
int getRandomZone(){
  return int(random(1,5));
}

void reset(){
  blue.setFill(color(65,105,225));
  yellow.setFill(color(200, 200, 0));
  red.setFill(color(190,34,34));
  green.setFill(color(110, 170, 94));
  pointerDisplay=0;
  clickCount=0;
  beepsGame.clear();
  score=0;
  justGenerated=false;
  lostSound=false;
}

void keyPressed(){
  if(mode==MODE_ENTER && key==' '){
    mode=MODE_DISPLAY;
  }
  if(key==ESC){
    mode=MODE_ENTER;
    reset();
    key=0;
  }
}

void beep(int zone){
  switch(zone){
    case 1: // Green zone
      greenSaw.play();
      env.play(greenSaw, attackTime, sustainTime, sustainLevel, releaseTime);
      time=millis();
      beepGreen=true;
      break;
    case 2: // Red zone
     redSquare.play();
     redSquare.amp(0.5);
     env.play(redSquare, attackTime, sustainTime, sustainLevel, releaseTime);
     time=millis();
     beepRed=true;
     break;
    case 3: // Yellow zone
     yellowPulse.play();
     env.play(yellowPulse, attackTime, sustainTime, sustainLevel, releaseTime);
     time=millis();
     beepYellow=true;
     break;
    case 4: // Blue zone
     blueSine.play();
     blueSine.amp(1);
     env.play(blueSine, attackTime, sustainTime, sustainLevel, releaseTime);
     time=millis();
     beepBlue=true;
     break;
  }
}

void mousePressed(){
  if(mode==MODE_GAME){
  // Pressed green
   if(mouseX>=width/2-150&&mouseX<=width/2-30&&mouseY>=height/2-130&&mouseY<=height/2-10){
     beep(1);
     zoneClicked=1;
    clickCount++;  
    justClicked=true;
   }
  // Pressed red
     if(mouseX>=width/2+30&&mouseX<=width/2+150&&mouseY>=height/2-130&&mouseY<=height/2-10){
      beep(2);
     zoneClicked=2;
     clickCount++;
    justClicked=true;
   }
  // Pressed yellow
   if(mouseX>=width/2-150&&mouseX<=width/2-30&&mouseY>= height/2+15&&mouseY<=height/2+135){
     beep(3);
     zoneClicked=3;
     clickCount++;
    justClicked=true;
   }
  //// Pressed blue
   if(mouseX>=width/2+30&&mouseX<=width/2+150&&mouseY>=height/2+15&&mouseY<=height/2+135){
     beep(4);
     zoneClicked=4;
     clickCount++;
    justClicked=true;
   }
  }
}
