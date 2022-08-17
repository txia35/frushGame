class fish06 extends fish{
  PImage self;
  float selfSize = selfSizes[5];
  float r;
  
  fish06(PImage s, float w, float h){
    type = 5;
    x = w;
    y = h;
    angle = random(2 * PI);
    self = s;
    r = self.width / 2 * selfSize;
    score = scores[5];
    speed = 4;
  }
  
  boolean checkEat(selfFish me){
    float dist = sqrt((me.aX - x) * (me.aX - x) + (me.aY - y) * (me.aY - y));
    if(dist <= r + me.r){
      return true;
    }
    return false;
  }
  
  void drawSelf(selfFish me){
    pushMatrix();
    translate((- me.aX + x) / vision + width / 2, (- me.aY + y) / vision + height / 2);
    rotate(angle);
    image(self,  - r / vision,  - r / vision, 2 * r / vision, 2 * r / vision);
    popMatrix();
  }
}
