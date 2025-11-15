public class Spaceship extends Floater{
  public Spaceship(double initX, double initY, double initSpeedX, double initSpeedY, double initOrientation, color initColor, double[][] initVertices){
    x = initX;
    y = initY;
    speedX = initSpeedX;
    speedY = initSpeedY;
    orientation = initOrientation;
    floaterColor = initColor;
    vertices = initVertices;
  }
  
  //Give a new random position and orientation while resetting speed
  public void hyperspace(){
    //Make sure ship doesn't spawn warping around the screen (ship's max radius is 20)
    x = Math.random()*(width - 40) + 20;
    y = Math.random()*(height - 40) + 20;
    
    speedX = 0;
    speedY = 0;
    
    orientation = Math.random()*2*Math.PI;
  }
  
  //Shoot a projectile from the spaceship
  public void shoot(){
    //Later
  }
}
