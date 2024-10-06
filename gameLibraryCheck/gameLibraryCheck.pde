import sprites.utils.*;
import sprites.maths.*;
import sprites.*;
import processing.sound.*;

Sprite ship;
StopWatch stopWatch = new StopWatch();

KeyboardController kbController;

SoundFile soundPlayer;

public void setup()
{
  size(700, 500);

  ship = new Sprite(this, "ship.png", 1, 1, 50);
  ship.setXY(width/2, height - 30);
  ship.setRot(3.14159);
  ship.setVelXY(0.0f, 0);
  ship.setScale(.75);
  ship.setDomain(0, height-ship.getHeight(), width, height, Sprite.HALT);

  soundPlayer = new SoundFile(this, "pop.wav");
  soundPlayer.amp(0.5);
  
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
}
