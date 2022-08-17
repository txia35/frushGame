class selfFish{
  PImage self;
  float angle;
  float aX;
  float aY;
  float speed = 7;
  float r;
  int level = 0;
  
  selfFish(PImage s){
    self = s;
    aX = totWid / 2;
    aY = totHei / 2;
    r = self.width * selfSizes[0] / 2;
  }
  
  void drawSelf(){
    pushMatrix();
    translate(width / 2, height / 2);
    rotate(angle);
    image(self,  -r / vision,  -r / vision, 2 * r / vision, 2 * r / vision);
    popMatrix();
  }
  
  void update(){
    int x = width / 2;
    int y = height / 2;
    //angle and position
    float difX = mouseX - x;
    float difY = mouseY - y;
    
    if(abs(difX) < 20 && abs(difY) < 20){
      return;
    }
    
    if(difX < 0 && difY != 0){
      angle = atan((difY)/(difX));
    }
    else if(difX > 0 && difY != 0){
      angle = PI + atan((difY)/(difX));
    }
    else if(difX == 0 && difY != 0){
      angle = PI + PI / 2 * (abs(difY) / (difY));
    }
    else if(difY == 0 && difX != 0){
      angle = PI / 2 + PI / 2 * (abs(difX) / (difX));
    }
    
    float dx = speed * (difX)/(sqrt(difX * difX + difY * difY));
    aX += dx;
    float dy = speed * (difY)/(sqrt(difX * difX + difY * difY));
    aY += dy;
    
    if(aX < 0 || aX > totWid){ aX -= dx;}
    if(aY < 0 || aY > totHei){ aY -= dy;}
    
    //update picture
    int checkUpdate = 0;
    while(checkUpdate <= level){
      if(checkUpdate == level && score >= LevelPts[checkUpdate]){
        statUp(checkUpdate + 1);
        break;
      }
      checkUpdate ++;
    }
  }
  
  boolean checkEat(fish f){
    float dist = sqrt((aX - f.x) * (aX - f.x) + (aY - f.y) * (aY - f.y)) / 2;
    if(dist <= r){
      return true;
    }
    return false;
  }
  
  boolean checkNear(fish f){
    float dist = sqrt((aX - f.x) * (aX - f.x) + (aY - f.y) * (aY - f.y)) / 2;
    if(dist <= 200){
      return true;
    }
    return false;
  }
  
  void statUp(int stat){
    self = fishImgs[stat];
    r = self.width*selfSizes[stat] / 2;
    level = stat;
    if(stat == 1){
      int[] curNum = {4, 3, 6, 0, 0, 0, 0, 0, 0, 0};
      fishNum = curNum;
    }
    else if(stat == 2){
      int[] curNum = {2, 4, 4, 7, 0, 0, 0, 0, 0, 0};
      fishNum = curNum;
    }
    else if(stat == 3){
      int[] curNum = {2, 2, 3, 1, 7, 0, 0, 0, 0, 0};
      fishNum = curNum;
    }
    else if(stat == 4){
      int[] curNum = {1, 2, 2, 3, 1, 7, 0, 0, 0, 0};
      fishNum = curNum;
    }
    else if(stat == 5){
      int[] curNum = {1, 1, 2, 2, 2, 0, 7, 0, 0, 0};
      fishNum = curNum;
    }
    else if(stat == 6){
      int[] curNum = {1, 1, 1, 2, 3, 1, 0, 7, 0, 0};
      fishNum = curNum;
    }
    else if(stat == 7){
      int[] curNum = {0, 1, 2, 2, 1, 1, 2, 0, 7, 0};
      fishNum = curNum;
    }
    else if(stat == 8){
      int[] curNum = {0, 0, 1, 2, 2, 1, 2, 1, 0, 6};
      fishNum = curNum;
    }
    else if(stat == 9){
      int[] curNum = {2, 2, 2, 2, 2, 2, 2, 2, 2, 2};
      fishNum = curNum;
    }
    setupNum();
    vision *= 1.1;
  }
  
}
