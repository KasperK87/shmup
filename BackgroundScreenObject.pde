  
class BackgroundScreen extends ScreenObject{
  Particle[] stars;
  BackgroundScreen(){
  stars = new Particle[50];
  for (int i = 0; i < stars.length; i++){
    stars[i] = new Particle(random(width), random(height));
  }
  }
  void update (float dt, float setSpeed){
  for (int i = 0;i < stars.length; i++){
  stars[i].update(setSpeed);
  }
  }
   
  void render(float setColor) {
  for (int i = 0;i < stars.length; i++){
  stars[i].render(setColor);
  }
  

  }
}
class Particle{
  float x,y;
  float size, size2, size3;
  float speedX, speedY;
  //float lengthen = 0;
  
  Particle(float setX, float setY){
    size = random(2,5);
    x = setX;
    y = setY;
    
  }
    void update(float setSpeed){
    //size += random(0.1,0.4);
    //size += 0.3;
    speedY += speedY/pow(100,99999)+0.001*setSpeed;
    y += map(size,2,5,speedY+random(0.2),speedY+random(0.2,0.5));
   
    
    if (y > (height + size/2)){
      y = 0 - size/2;
    }
    }
    
    void render(float setColor){
    noStroke();
    fill(map(size,2,5,setColor/2,setColor));
    ellipse(x,y,size,size+speedY);
  }
}