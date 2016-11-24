Spaceship bob;
Star[] sun;
ArrayList <Asteroid> stanley;

public void setup() 
{
  size(400, 400);
  sun = new Star[50];
  for (int i = 0; i< sun.length; i++)
  {
     sun[i] = new Star();
  }
  bob = new Spaceship();
  stanley = new ArrayList <Asteroid>();
   for (int i = 0; i< 15; i++)
  {
     stanley.add(new Asteroid());
  }

  
}
public void draw() 
{
  background(10, 0, 40);
  for (int i =0; i< sun.length; i++)
  {
    sun[i].show1();
  }
  
  for (int i = 0; i< stanley.size(); i++)
  {
    stanley.get(i).show();
    stanley.get(i).move();
   
  }
   for( int i = 0; i<stanley.size(); i++)
 {
   double d = dist(bob.getX(), bob.getY(), stanley.get(i).getX(), stanley.get(i).getY());
   if(d <15)
   stanley.remove(i);
 }
  bob.move();
  bob.show();
  
  
}

class Star
{
  private int myY;
  private int myX;
  Star()
  {
    myX = (int)(Math.random()*400);
    myY = (int)(Math.random()*400);
  }
  public void show1(){
    fill(200, (int)(Math.random()*250), 200);
    noStroke();
    ellipse(myX, myY, 5, 5);
    
  }
}

class Asteroid extends Floater
{
  public int speedRotation;
public Asteroid()
{
 corners =8;
  xCorners = new int[corners];
  yCorners = new int[corners];
  xCorners[0] = -18;
  yCorners[0] = -18;
  xCorners[1] = 0;
  yCorners[1] = -18;
  xCorners[2] = 18;
  yCorners[2] = -18;
  xCorners[3] = 28;
  yCorners[3] = 0;
  xCorners[4] = 18;
  yCorners[4] = 18;
  xCorners[5] = 0;
  yCorners[5] = 28;
  xCorners[6] = -18;
  yCorners[6] = 18;
  xCorners[7] = -28;
  yCorners[7] = 0;
  myColor = color(20, 200, 200);
  myCenterX = (int)(Math.random()*400);
  myCenterY = (int)(Math.random()*400);
  myDirectionX = (Math.random()*5)-2;
  myDirectionY = (Math.random()*5)-2;
  myPointDirection= (int)Math.random()*360;
  speedRotation = (int)(Math.random()*4)-2;
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


public void move(){
  
  
   rotate(speedRotation);
   super.move();

  }
}
  
class Spaceship extends Floater  
{   
 public Spaceship(){
  corners =4;
  xCorners = new int[corners];
  yCorners = new int[corners];
  xCorners[0] = -20;
  yCorners[0] = -20;
  xCorners[1] = 18;
  yCorners[1] = 0;
  xCorners[2] = -20;
  yCorners[2] = 20;
  xCorners[3] = -8;
  yCorners[3] = 0;
  myColor = color(200, 0, 200);
  myCenterX = (int)(Math.random()*400);
  myCenterY = (int)(Math.random()*400);
  myDirectionX = 0;
  myDirectionY = 0;
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
      bob.rotate(-5);

    }
    else
    {bob.rotate(0);

    if(key == 'w')
    {

      bob.accelerate(2);
    }

    if(key == 'd')
    {
      bob.rotate(5);
    }
    
    }
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