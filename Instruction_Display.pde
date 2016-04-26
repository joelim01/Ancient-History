//display only when zoomer.getZoomScale()==1

void instructions() {
  if (zoomer.getZoomScale() <= 1.0) {
    fill(0);
    //stroke(0);
    textFont(ourFont);
    text("Ancient History | Joseph Lim | ITP ICM Fall 2011", 10, 20);
    textFont(ourFont, 15);
    text("Each line represents a unique web page visit between 6-2011 and 12-2011.", 10, 35); 
    text("Use the mouse wheel to ZOOM.", 10, 65);
    text("Use the right mouse button to PAN.", 10, 85);
    noStroke();
  }
}


