void drawGameOver(){
  background(100, 100, 100);
  drawLake();
  //textMode(CENTER);
  textSize(60);
  text("GAME OVER", width / 2 - 100, height / 2 - 100);
  text(score, width / 2, height / 2 + 100);
  if(keyPressed && key == 'r'){
    startSetup();
  }
}

void drawLake(){
  image(lake, (- (lake.width * expandConst - totWid) / 2 - me.aX)/vision + width / 2, (- (lake.height * expandConst - totHei) / 2 - me.aY)/vision + height / 2, lake.width * expandConst / vision, lake.height * expandConst / vision);
}

void drawGame(){
  background(100, 100, 100);
  drawLake();
  me.drawSelf();
  me.update();
  
  fishProcessEat(1); 
  for(int i = 0; i < 9; i++){
    if(score >= LevelPts[i]){fishProcessEat(i + 2);}
    else{fishProcessDie(i + 2);}
  }
  
  textSize(40);
  //text(frameRate, 50, 50);
  text(score, 50, 50);
  
  if(score >= LevelPts[9]){
    me.self = melon;
    gameStatus = 1;
  }
  //System.out.println(me.r);
}

void drawWin(){
  background(100, 100, 100);
  drawLake();
  displayLight();
  displayResult();
  if(keyPressed && key == 'r'){
    startSetup();
  }
}
