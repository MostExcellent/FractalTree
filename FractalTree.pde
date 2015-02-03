public int initLength;
public int treeSize;
public void setup() 
{
  size(640,480);
  initLength = 100;
  treeSize = 8;
} 
public void draw() 
{   
  background(255); 
  stroke(90,55,15);
  strokeWeight(treeSize);
  initLength = (int)map(mouseY, 0, height, 100, 80);
  line(320,480,320,480-initLength);
  drawBranches(320,480-initLength,initLength,-Math.PI/2,(Math.PI/2)*(float)mouseY/(float)height,(float)mouseX/(float)width,0.8,treeSize);
} 
public void drawBranches(int x,int y, double branchCount, double angle,
double split, double weighting,
double fractionLength, int smallestBranch) 
{
  float angle1 = (float)(angle + split*weighting);
  float angle2 = (float)(angle - split*(1-weighting));
  int endX1 = (int)(branchCount*fractionLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchCount*fractionLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchCount*fractionLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchCount*fractionLength*Math.sin(angle2) + y);
  if(smallestBranch != 0){
    stroke(90,55,15);
    strokeWeight(smallestBranch);
    line(x,y,endX1,endY1);
    line(x,y,endX2,endY2);
    drawBranches(endX1,endY1,branchCount*fractionLength,angle1,split,weighting,fractionLength,smallestBranch-1);
    drawBranches(endX2,endY2,branchCount*fractionLength,angle2,split,weighting,fractionLength,smallestBranch-1);
  }else{
    strokeWeight(1);
    fill(40, 200, 20);
    triangle(x,y,endX1,endY1,endX2,endY2);
  }
}
