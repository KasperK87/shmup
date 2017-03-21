class Level extends ScreenObject {
  PImage background;
  PFont font;
  float scroll;

  PImage minion;
  PImage boss;


  Ship player1; 
  Ship finalBoss;
  boolean levelComplete;
  ArrayList<GameObject> shipObjects;
  ArrayList<GameObject> gameObjects;

  Level() {
  }

  Level(Ship refPlayer1, ArrayList<GameObject> refShipObjects, ArrayList<GameObject> refGameObjects) {
    background = loadImage("level1.bmp");
    background.resize(width, 3000); //For Arved
    player1 = refPlayer1;
    levelComplete = false;
    shipObjects = refShipObjects;
    gameObjects = refGameObjects;
    minion = loadImage("Minion.png");
    boss = loadImage("BossLv.png");
  }

  void update(float dt) {
    scroll++;

    if (scroll == 600) {
      Ship bar = new BasicEnemy(new BasicEnemyController(player1.getPos()), width-101, 0); //new Ship(new BasicEnemyController(player1.getPos()), 0, 0);
      Ship foo = new BasicEnemy(new BasicEnemyController(player1.getPos()), width-101, 0);
      shipObjects.add(bar);
      shipObjects.add(foo);
    }
    if (scroll == 1200) {
      finalBoss = new BasicEnemy(new BasicEnemyController(player1.getPos()), new BasicPlayerWeapon(player1.pos, new PVector(0, 5)), width/2, 0, boss);
      //finalBoss = new MakeBig(finalBoss);
      shipObjects.add(finalBoss);
    }

    //win level condition
    if (finalBoss != null && finalBoss.remove) {
      levelComplete = true;
    }
  }

  void render() {
    //image(background, background.width/2, scroll); //For alle andre...
    //image(background, background.width*1.5, scroll);
    //image(background, background.width*2.5, scroll);
    image(background, background.width/2, scroll);
    pushMatrix();
    fill(0);
    font = createFont("LDFComicSansLight.ttf", 50);
    textFont(font);
    text("HP " + player1.HP, 50, 100);
    popMatrix();
  }

  Level nextLevel(Ship refPlayer1, ArrayList<GameObject> refShipObjects, ArrayList<GameObject> refGameObjects) {

    refPlayer1.pos.x = width/2;
    refPlayer1.pos.y = height-100;

    //bug when changing level... can you figure out why? ;)
    //refPlayer1.pos = new PVector(width/2, height-100);
    return new Level2(refPlayer1, refShipObjects, refGameObjects);
  }
}

class Level2 extends Level {

  Level2(Ship refPlayer1, ArrayList<GameObject> refShipObjects, ArrayList<GameObject> refGameObjects) {
    background = loadImage("level2.bmp");
    background.resize(width, 3000);
    player1 = refPlayer1;
    shipObjects = refShipObjects;
    gameObjects = refGameObjects;
  }

  void update(float dt) {
    scroll++;
    if (scroll == 100) {
      PowerUp foo = new PowerUp(new PVector(width/2, 1), 5);
      gameObjects.add(foo);
    }

    if (scroll == 600) {
      Ship bar = new BasicEnemy(new BasicEnemyController(player1.getPos()), 0, 0);
      Ship foo = new BasicEnemy(new BasicEnemyController(player1.getPos()), width, 0);
      shipObjects.add(bar);
      shipObjects.add(foo);

      Ship baar = new BasicEnemy(new BasicEnemyController(player1.getPos()), width/2, 0);
      Ship fooo = new BasicEnemy(new BasicEnemyController(player1.getPos()), width/2, -100);
      shipObjects.add(baar);
      shipObjects.add(fooo);
    }
    if (scroll == 1200) {
      Ship bar = new BasicEnemy(new BasicEnemyController(player1.getPos()), width/2, 0);

      bar = new MakeBig(bar);
      bar = new MakeBig(bar);
      shipObjects.add(bar);
    }
  }
}