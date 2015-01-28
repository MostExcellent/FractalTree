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
  fill(40, 200, 20);
  initLength = (int)map(mouseY, 0, height, 100, 80);
  line(320,480,320,480-initLength);
  drawBranches(320,480-initLength,initLength,-90,90*(float)mouseY/(float)height,(float)mouseX/(float)width,0.8,treeSize);
} 
public void drawBranches(int x,int y, double branchCount, double angle,
double split, double weighting,
double fractionLength, int smallestBranch) 
{
  float angle1 = (float)(angle + split*weighting);
  float angle2 = (float)(angle - split*(1-weighting));
  int endX1 = (int)(branchCount*fractionLength*Math.cos(Math.toRadians(angle1)) + x);
  int endY1 = (int)(branchCount*fractionLength*Math.sin(Math.toRadians(angle1)) + y);
  int endX2 = (int)(branchCount*fractionLength*Math.cos(Math.toRadians(angle2)) + x);
  int endY2 = (int)(branchCount*fractionLength*Math.sin(Math.toRadians(angle2)) + y);
  if(smallestBranch != 0){
    strokeWeight(smallestBranch);
    line(x,y,endX1,endY1);
    line(x,y,endX2,endY2);
    drawBranches(endX1,endY1,branchCount*fractionLength,angle1,split,weighting,fractionLength,smallestBranch-1);
    drawBranches(endX2,endY2,branchCount*fractionLength,angle2,split,weighting,fractionLength,smallestBranch-1);
  }else{
    strokeWeight(1);
    triangle(x,y,endX1,endY1,endX2,endY2);
  }
}
double distance(double x1, double y1, double x2, double y2) 
{
  return Math.sqrt(((x1-x2)*(x1-x2)) + ((y1-y2)*(y1-y2)));
}
