Spaceship bob;
Star[] sun;

public void setup() 
{
  size(400, 400);
  sun = new Star[50];
  for (int i = 0; i< sun.length; i++)
  {
     sun[i] = new Star();
  }
  bob = new Spaceship();
  
 
  
}
public void draw() 
{
  background(250, 250, 250);
  for (int i =0; i< sun.length; i++)
  {
    sun[i].show1();
  }
  bob.show();
    bob.keyPressed();
  bob.move();
  
}

class Star
{
  int myY;
  int myX;
  Star()
  {
    myX = (int)(Math.random()*400);
    myY = (int)(Math.random()*400);
  }
  public void show1(){
    fill((int)(Math.random()*250), 250, 100);
    noStroke();
    ellipse(myX, myY, 5, 5);
    
  }
}
class Spaceship extends Floater  
{   
 public Spaceship(){
  corners =4;
  xCorners = new int[corners];
  yCorners = new int[corners];
  xCorners[0] = -20;
  yCorners[0] = -15;
  xCorners[1] = 18;
  yCorners[1] = 12;
  xCorners[2] = -14;
  yCorners[2] = 8;
  xCorners[3] = -8;
  yCorners[3] = 0;
  myColor = color(20, 20, 20);
  myCenterX = 200;
  myCenterY = 200;
  myDirectionX = 2;
  myDirectionY = 3;
  myPointDirection= 0;

 }



  public void setX(int x){myCenterX =x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;}  
  public double getDirectionY(){return myDirectionY;}   
 public void setPointDirection(int degrees){myPointDirection = degrees;}   
 public double getPointDirection(){return myPointDirection;} 

}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   

  public void keyPressed()
  {
    
    if(key == 's'){
      bob.setDirectionX(0);
      bob.setDirectionY(0);
      bob.setX((int)(Math.random()*400));
      bob.setY((int)(Math.random()*400));
    
    }

    if(key == 'a')
    {
      bob.rotate(5);

    }
    else
    

    if(key == 'w')
    {

      bob.accelerate(.2);
    }

    if(key == 'd')
    {
      bob.rotate(-5);
    }
    
    }
  }
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 