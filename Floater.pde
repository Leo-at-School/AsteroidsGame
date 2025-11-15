//Minor changes made by Leo :)
//  - Variable name changes
//  - Changes to comments
//  - Floater vertex data has been changed to a 2d array
//  - Floater orientation has been changed from degrees to radians

public class Floater{
  //Increase readablity when accessing x and y elements from a 2d array
  protected int coordX = 0; //X coordinate index
  protected int coordY = 1; //Y coordinate index
  
  protected double[][] vertices;
  protected color floaterColor;
  protected double x, y,           //Center relative to the polygon
                   speedX, speedY,
                   orientation;    //Radians

  //Accelerate the floater in the direction it is pointing (orientation)   
  public void accelerate(double acceleration){    
    speedX += acceleration*Math.cos(orientation);
    speedY += acceleration*Math.sin(orientation);       
  }
  
  //Rotate the floater some amount of radians
  public void turn(double rotate){
    orientation += rotate;   
  }
  
  //Update the floaters position
  public void move(){
    //Move the floater       
    x += speedX;    
    y += speedY;     

    //Wrap around the screen if needed
    if (x > width){     
      x = 0;    
    } else if (x < 0){     
      x = width;    
    }
    
    if (y > height){    
      y = 0;    
    } else if (y < 0){     
      y = height;    
    }   
  }
  
  //Draw the floater
  public void drawFloater(){         
    fill(floaterColor);   
    stroke(floaterColor);    
    
    //Move the center of the polygon to (0, 0) and set its orientation to 0 radians
    translate((float)x, (float)y);
    rotate((float)orientation);
    
    //Draw polygon
    beginShape();
    for (int i = 0; i < vertices.length; i++){
      vertex((float)vertices[i][coordX], (float)vertices[i][coordY]);
    }
    endShape(CLOSE);

    //Orient the polygon accordingly and move its position back to the desired location (The reverse of what was previously done)
    rotate((float)-orientation);
    translate((float)-x, (float)-y);
  }   
} 
