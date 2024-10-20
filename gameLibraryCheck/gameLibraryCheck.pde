import sprites.utils.*;
import sprites.maths.*;
import sprites.*;
import processing.sound.*;
import gifAnimation.*; //Import gifAnimation library

Sprite ship;
StopWatch stopWatch = new StopWatch();

KeyboardController kbController;

SoundFile soundPlayer;
Gif myAnimation;

public void setup()
{
  size(700, 500);
  size(400, 400);
  
  //Loads and plays an animated background GIF 
  myAnimation = new Gif(this, "backgroundGif.gif");
  myAnimation.play();

  // Load a soundfile from the data folder of and play it back in a loop
  file = new SoundFile(this, "starwarsBackground.mp3");
  file.amp(0.1);
  file.play();
  file.loop();

  ship = new Sprite(this, "ship.png", 1, 1, 50);
  ship.setXY(width/2, height - 30);
  ship.setRot(3.14159);
  ship.setVelXY(0.0f, 0);
  ship.setScale(.75);
  ship.setDomain(0, height-ship.getHeight(), width, height, Sprite.HALT);

  soundPlayer = new SoundFile(this, "pop.wav");
  soundPlayer.amp(0.75);
  
  kbController = new KeyboardController();
  
  registerMethod("pre", this);
}

void pre()
{
  checkKeys();
  S4P.updateSprites(stopWatch.getElapsedTime());
}

void checkKeys()
{
  if (focused) {
    if (kbController.isLeft()) {
      ship.setX(ship.getX()-10);
    }
    if (kbController.isRight()) {
      ship.setX(ship.getX()+10);
    }
    if (kbController.isSpace()) {
      soundPlayer.play();
    }
  }
}

// Activated by Processing when a key is pressed
void keyPressed() 
{
  kbController.keyPressed(keyCode, key);
}

void keyReleased() 
{
  kbController.keyReleased(keyCode, key);
}

void draw() {
  background(0);
  S4P.drawSprites();
  image(myAnimation, 200, 200); //displays the animated GIF 
}
