class PowerUp extends Bullet {
  PowerUp(PVector origin, float setSpeed){
    size = new PVector(10,10);
    setDir(new PVector(0, 0.2));
    
    setPos(new PVector(origin.x, origin.y));
    
    setSpeed(setSpeed);
  }
  
  void update(float dt){
    super.update(dt);
  }
  
  void effect(Ship target){
    target = new MakeBig(target);
  }
  
  void render(){
   fill(255, 255, 0);
   rect(getX(), getY(), getSize().x, getSize().y); 
  }
}