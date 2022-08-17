class fish{
  float x;
  float y;
  float r;
  int score;
  float angle;
  float speed;
  int type;
  
  void drawSelf(selfFish me){}
  
  void update(){
    boolean near = me.checkNear(this);
    float difX;
    float difY;
    if(near && !(x < 0 || x > totWid) && !(y <0 || y > totHei)){
      difX = me.aX - this.x;
      difY = me.aY - this.y;
      float newAngle = 0;
      if(difX < 0 && difY != 0){
        newAngle = atan((difY)/(difX));
      }
      else if(difX > 0 && difY != 0){
        newAngle = PI + atan((difY)/(difX));
      }
      else if(difX == 0 && difY != 0){
        newAngle = PI + PI / 2 * (abs(difY) / (difY));
      }
      else if(difY == 0 && difX != 0){
        newAngle = PI / 2 + PI / 2 * (abs(difX) / (difX));
      }
      
      if(this.type <= me.level){
        newAngle += PI;
      }
      
      this.angle = newAngle;
    }
    
    if(x < 0 || x > totWid){
      angle += PI;
      angle = -angle;
    }
    if(y < 0 || y > totHei){
      angle = -angle;
    }
    
    x -= cos(angle) * speed;
    y -= sin(angle) * speed;
  }
  
  boolean checkEat(selfFish me){return false;}
}
