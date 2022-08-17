//fish eat game
PImage lake;
PImage[] fishImgs;
PImage melon;
PImage light;
selfFish me;
int score;
ArrayList<ArrayList<fish>> fishes;
int gameStatus;
float winResultAni;
float lightAniRot;
float lightAniMul;
int[] fishNum;

void setup(){
  frameRate(35);
  size(640, 640);
  loadImages();
  startSetup();
}

void startSetup(){
  gameStatus = GAMING;
  me = new selfFish(fishImgs[0]);
  fishes = new ArrayList<ArrayList<fish>>();
  for(int i = 0; i < 10; i++){
    ArrayList<fish> spFishes = new ArrayList<fish>();
    fishes.add(spFishes);
  }
  int[] curNum = {8, 5, 2, 0, 0, 0, 0, 0, 0, 0};
  fishNum = curNum;
  setupNum();
  score = 0;
  winResultAni = winResultAniC;
  lightAniRot = 0;
  lightAniMul = 0.01;
  vision = 1;
}

void loadImages(){
  lake = loadImage("lake.png");
  fishImgs = new PImage[10];
  for(int i = 0; i < 9; i++){
    fishImgs[i] = loadImage("fruit0" + Integer.toString(i + 1) + ".png");
  }
  fishImgs[9] = loadImage("fruit" + Integer.toString(10) + ".png");
  melon = loadImage("melon.png");
  light = loadImage("light.png");
}

void draw(){
  if(gameStatus == GAMING){
    drawGame();
  }
  else{
    drawWin();
  }
}

void fishProcessEat(int type){
  for(int i = 0; i < fishes.get(type - 1).size(); i++){
    fish tar = fishes.get(type - 1).get(i);
    tar.drawSelf(me);
    if(me.checkEat(tar)){
      fishes.get(type - 1).remove(i);
      i--;
      score += tar.score;
      fishes.get(type - 1).add(randomGen(type - 1));
    }
    tar.update();
  }
}

void fishProcessDie(int type){
  for(int i = 0; i < fishes.get(type - 1).size(); i++){
    fish tar = fishes.get(type - 1).get(i);
    tar.drawSelf(me);
    tar.update();
    if(tar.checkEat(me)){
      gameStatus = GAMEOVER;
    }
  }
}

boolean displayResult(){
  imageMode(CENTER);
  image(me.self, width / 2, height / 2, me.self.width * winResultAni, me.self.height * winResultAni);
  imageMode(CORNER);
  if(me.self.width * winResultAni > 300){
    return true;
  }
  winResultAni *= 1.3;
  return false;
}

void displayLight(){
  imageMode(CENTER);
  pushMatrix();
  translate(width / 2, height / 2);
  rotate(lightAniRot);
  image(light, 0, 0, light.width * lightAniMul, light.height * lightAniMul);
  imageMode(CORNER);
  popMatrix();
  if(lightAniMul < 0.55){
    lightAniMul *= 1.3;
  }
  lightAniRot += PI / 10;
}

fish randomGen(int type){
  float rX = random(1280), rY = random(1280);
  while(rX > me.aX - width / 2 && rX < me.aX + width / 2 && rY > me.aY - height / 2 && rY < me.aY + height / 2){
    rX = random(1280);
    rY = random(1280);
  }
  switch (type){
    case 0: return new fish01(fishImgs[0], rX, rY);
    case 1: return new fish02(fishImgs[1], rX, rY);
    case 2: return new fish03(fishImgs[2], rX, rY);
    case 3: return new fish04(fishImgs[3], rX, rY);
    case 4: return new fish05(fishImgs[4], rX, rY);
    case 5: return new fish06(fishImgs[5], rX, rY);
    case 6: return new fish07(fishImgs[6], rX, rY);
    case 7: return new fish08(fishImgs[7], rX, rY);
    case 8: return new fish09(fishImgs[8], rX, rY);
    case 9: return new fish10(fishImgs[9], rX, rY);
  }
  return null;
}

void setupNum(){
  for(int i = 0; i < 10; i++){
    while(fishes.get(i).size() < fishNum[i]){
      fishes.get(i).add(randomGen(i));
    }
    while(fishes.get(i).size() > fishNum[i]){
      fishes.get(i).remove(0);
    }
  }
}
