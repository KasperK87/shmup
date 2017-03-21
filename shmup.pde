ScreenObject screenController;
Game currentGame;

PlayerController player1Controller;
PlayerController player2Controller;

void setup(){
  fullScreen(); 
  player1Controller = new PlayerController();
  screenController = new SplashScreen();
  currentGame = new Game();

}

void draw(){
  //Game loop
  screenController.update(deltaTime()*2);
  screenController.render();
}

//-----------------------------------------------------------------------------

//Playercontrol listeners
void mousePressed() {
  if (player1Controller != null){
    player1Controller.setSTATE(1);
  }
}
void mouseReleased() {
  if (player1Controller != null){
    player1Controller.setSTATE(0);
  }
}

void keyPressed() {
  
  if (player1Controller != null){
      if (key == 'a' || keyCode == LEFT) {
        player1Controller.dir.x = -1;
      } 
      if (key == 'd' || keyCode == RIGHT) {
        player1Controller.dir.x = 1;
      } 
      if (key == 'w' || keyCode == UP) {
        player1Controller.dir.y = -1;
      } 
      if (key == 's' || keyCode ==  DOWN) {
        player1Controller.dir.y = 1;
      } 
      
      if (key == ' '){
        player1Controller.setSTATE(1);
      }
  }  
}
void keyReleased() {
  if (player1Controller != null){
      if (key == 'a' || keyCode == LEFT) {
        player1Controller.dir.x = 0;
      } 
      if (key == 'd' || keyCode == RIGHT) {
        player1Controller.dir.x = 0;
      }
      if (key == 'w' || keyCode == UP) {
        player1Controller.dir.y = 0;
      } 
      if (key == 's' || keyCode == DOWN) {
        player1Controller.dir.y = 0;
      }
      
      if (key == ' '){
        player1Controller.setSTATE(0);
      }
  }  
}