public class Star{
  private double x, y,
                 time,     //How far along a star is in its glow animation measured in seconds
                 glowTime; //The time it takes a star to cycle through its glow animation measured in seconds
  private int radius, glowRadius;
  private color starColor;
  
  public Star (double initX, double initY, int initRadius, color initStarColor, double initGlowTime){
    x = initX;
    y = initY;
    radius = initRadius;
    starColor = initStarColor;
    glowTime = initGlowTime;
    
    glowRadius = (int)(0.33*radius); //Glow effect is ~1/3 of the radius of the star
    time = 0;
  }
  
  //Draw star
  public void drawStar(){
    noStroke();
    fill(starColor);
    ellipse((float)x, (float)y, (float)radius, (float)radius);
    
    //Create a small gradient to create a extra glow effect
  }
  
  //Give the stars slight movement
  public void move(){
    //Later
  }
  
  //Make the stars change opacity, appearing and disappearing with time
  public void glow(){
    //Later
  }
  
  public void resetAnimation(){
    time = 0;
  }
}
