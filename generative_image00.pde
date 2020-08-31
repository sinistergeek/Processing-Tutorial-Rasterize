PImage img;
int OFF_MAX = -100;
void settings(){

System.setProperty("jogl.disable.openglcore", "false");
size(900,900,P3D);

}
void setup(){
  

  
  img = loadImage("uuu.jpeg");
  img.resize(900,900);
}
void draw() {
  
  
  background(#f1f1f1);
  fill(0);
  noStroke();
  sphereDetail(3);
  float tiles = 100;
  float tileSize = width/tiles;
  push();
  translate(width/2,height/2,-100);
  //rotateY(radians(frameCount));

  for (int x = OFF_MAX; x < tiles; x++) {
    for (int y = OFF_MAX; y < tiles; y++) {
      color c = img.get(int(x*tileSize),int(y*tileSize));
      float b = map(brightness(c),0,255,1,0);
      float z = map(b,0,1,-150,150);
      
      push();
      translate(x*tileSize - width/2, y*tileSize - height/2, z);
      rotateX(frameCount*.2);
       rotateY(frameCount*.2);

      sphere(tileSize*b*0.9);
      fill(colorFromOffset(int(x)),colorFromOffset(int(y)));
      
      box((float)(5 + (Math.sin(frameCount/20.0)) * 5));
      pop();
      
    }
  }
  pop();
}
int colorFromOffset(int offset){
return (int) ((offset + OFF_MAX)/(2.8 *OFF_MAX) * 255);

}
