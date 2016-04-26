//Joseph Lim, ITP 2011 ICM Final
//FireFox History


//Load Libs
import ijeoma.motion.*; 
import ijeoma.processing.geom.Bezier2D;
import ijeoma.processing.tween.Bezier2DTween;
import org.gicentre.utils.move.*;
import controlP5.*;

//Global Variables
ControlP5 controlP5;
ControlWindow controlWindow;
RadioButton r1;
String [][] csv;
ArrayList visits;
ZoomPan zoomer;
float positionCounter = 0;
PFont ourFont;
int lastViewed = 1;

//Main
void setup() {
  
  Motion.setup(this);
  visits = new ArrayList();
  //Set Window Size
  size(1000, 1080, P2D);
  smooth();
  zoomer = new ZoomPan(this);
  ourFont = loadFont("ErasITC-Light-18.vlw");                  // load the font (make sure it's in the Data folder)
  hint(ENABLE_NATIVE_FONTS);
  parser();
  loadVisits();
  decider(1);
  zoomer.setZoomScale(.8);
  chronVisits();
  frameRate(1000);

}

//Draw Loop
void draw() {
  
  background(255);
  instructions();
  zoomer.transform();
  display();

}



