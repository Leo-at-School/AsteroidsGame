//Indices for keydownFlags
public int W = 0;
public int S = 1;
public int A = 2;
public int D = 3;
public int H = 4;
public int SPACE = 5;

public boolean[] keydownFlags = {false, false, false, false, false, false}; //{W, S, A, D, H, SPACE}
public boolean hyperspaceCalled = false; //Ensure hyperspace can only be called once per keydown event

//Player settings
public double rotateSpeed = 0.1;
public double playerSpeed = 0.5;

//Star settings
public double maxStarRadius = 5;

//Objects
public Spaceship player;
public Star[] stars = new Star[100];

//Setup the player class
public void playerSetup(){
  double initCenterX = width/2;
  double initCenterY = height/2;
  double initSpeedX = 0;
  double initSpeedY = 0;
  double initOrientation = 0;
  color initColor = color(255, 0, 0);
  double[][] initVertices = {{20, 0},                     //{20*cos(0)       , 20*sin(0)}
                             {-14.1421356, 14.1421356},   //{20*cos(pi*(3/4)), 20*sin(pi*(3/4))}
                             {-14.1421356, -14.1421356}}; //{20*cos(pi*(3/4)), -20*sin(pi*(3/4))}
  
  player = new Spaceship(initCenterX, initCenterY, initSpeedX, initSpeedY, initOrientation, initColor, initVertices);
}

//Setup each star
public void starSetup(){
  double initX, initY, initGlowTime;
  int initRadius;
  color initStarColor;
  
  for (int i = 0; i < stars.length; i++){
    initX = Math.random()*width;
    initY = Math.random()*height;
    initRadius = (int)(Math.random()*maxStarRadius);
    initStarColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    initGlowTime = Math.random()*7;
    
    stars[i] = new Star(initX, initY, initRadius, initStarColor, initGlowTime);
  }
}

//Setup the entire canvas
public void setup(){
  size(800, 600);
  background(0, 0, 0);
  
  playerSetup();
  starSetup();
}

//Draw cycle (60 fps)
public void draw(){
  background(0, 0, 0);
  handleKeys();
  player.move();
  player.drawFloater();
  
  for (int i = 0; i < stars.length; i++){
    stars[i].drawStar();
  }
}

//Toggle boolean values to detect when each key is pressed (toggling boolean values allow for smoother movement)
public void keyPressed(){
  if (key == 'w'){
    keydownFlags[W] = true;
  }
  
  if (key == 's'){
    keydownFlags[S] = true;
  }
  
  if (key == 'a'){
    keydownFlags[A] = true;
  }
  
  if (key == 'd'){
    keydownFlags[D] = true;
  }
  
  if (key == 'h'){
    keydownFlags[H] = true;
  }
  
  if (key == ' '){
    keydownFlags[SPACE] = true;
  }
}

//Toggle boolean values to detect when each key is released (toggling boolean values allow for smoother movement)
public void keyReleased(){
  if (key == 'w'){
    keydownFlags[W] = false;
  }
  
  if (key == 's'){
    keydownFlags[S] = false;
  }
  
  if (key == 'a'){
    keydownFlags[A] = false;
  }
  
  if (key == 'd'){
    keydownFlags[D] = false;
  }
  
  if (key == 'h'){
    keydownFlags[H] = false;
    hyperspaceCalled = false;
  }
  
  if (key == ' '){
    keydownFlags[SPACE] = false;
  }
}

//Call functions associated with each key
public void handleKeys(){
  if (keydownFlags[W]){
    player.accelerate(playerSpeed);
  }
  
  if (keydownFlags[S]){
    player.accelerate(-playerSpeed);
  }
  
  if (keydownFlags[A]){
    player.turn(-rotateSpeed);
  }
  
  if (keydownFlags[D]){
    player.turn(rotateSpeed);
  }
  
  if (keydownFlags[H] && !hyperspaceCalled){
    player.hyperspace();
    starSetup(); //Create a new environment (create new stars) each hyperspace call
    hyperspaceCalled = true;
  }
  
  if (keydownFlags[SPACE]){
    //Shoot
  }
}
