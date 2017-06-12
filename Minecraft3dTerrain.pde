int col,row,scale=20,w=2000, h=1500;
float terrain[][],flying=0;
void setup()
{
  size(1000, 600, P3D);
  col=w/scale;
  row=h/scale;
  terrain=new float[col][row];
  for(float y=0, yoff=0;y<row;y++)
  {
    yoff+=0.2;
    for(float x=0, xoff=0;x<col;x++)
    {
      terrain[(int)x][(int)y]=map(noise(xoff,yoff),0,1,-100,100);
      xoff+=0.2;
    }
  }
}

void draw()
{
  flying+=-0.1;
  for(float y=0, yoff=flying;y<row;y++)
  {
    yoff+=0.2;
    for(float x=0, xoff=0;x<col;x++)
    {
      terrain[(int)x][(int)y]=map(noise(xoff,yoff),0,1,-100,100);
      xoff+=0.2;
    }
  }
  
  
  background(0);
  stroke(200,0,0,150);
  fill(244);
  translate(width/2, (height/2)+50);
  rotateX(PI/3);
  translate(-w/2,-h/2);
  for(int y=0;y<row-1;y++)
  {
    //beginShape(TRIANGLE_STRIP);
    for(int x=0;x<col;x++)
    {
      pushMatrix();
      translate(x*scale, y*scale, terrain[x][y]);
      box(scale);
      popMatrix();
    }
    //endShape();
  }
}