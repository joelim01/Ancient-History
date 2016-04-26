class Visit {

  String fullURL;
  String siteURL;
  String pageURL;
  String category;
  String timestamp;
  color visitColor;
  float epochDate;
  float xPosCurrent;
  float yPosCurrent;
  float xPosOld;
  float yPosOld;
  float numVisits;
  Bezier2DTween bt;
  Bezier2D b1, b2;

  Visit (String URL1, String URL2, String URL5, String date6, float eDate7, float numVis) {

    fullURL = URL1;
    pageURL = URL2;
    siteURL = URL5;
    timestamp = date6;
    epochDate = eDate7;
    visitColor = color(siteURL.length(), pageURL.length(), fullURL.length());
    xPosCurrent = 0;
    yPosCurrent = 0;
    xPosOld = 0;
    yPosOld = 0;
    numVisits = numVis;
    
  }

  void createPath() { //Based on ijeomamotion, this function creates bezier curve paths for the motion of the visits
    
    b1 = new Bezier2D(g, xPosOld, yPosOld, (((xPosCurrent-xPosOld)/2)+xPosOld), yPosOld+75, (((xPosCurrent-xPosOld)/2)+xPosOld), yPosOld+75, xPosCurrent, yPosCurrent);
    if (b1 != null) {
    }
    bt = new Bezier2DTween("b1", b1, 0f, 1f, 100f);
    bt.play();
    
  }

//controls to allow zooming, determine if the zoom level is fine enough to show the URL and date info, and code to display the text
  void display() {
    fill(visitColor);
    rect(bt.getX(), bt.getY(), ((float(width)-40)/(visits.size())), (3*siteURL.length()/(float) zoomer.getZoomScale()));
    if (zoomer.getZoomScale() >= 500.0) {
      PVector mousePosition = zoomer.getMouseCoord();
      if ( dist(bt.getX(), bt.getY(), mousePosition.x, mousePosition.y) < .1) {
        pushMatrix();
        translate(bt.getX()+(float(width)-40)/(1.5*(visits.size())), bt.getY());
        rotate(4.71238898);
        textFont(ourFont, .02);
        text(fullURL +" , "+ timestamp, 0, 0);
        popMatrix();
      }
    } 
    else if (zoomer.getZoomScale() >= 1.5 && zoomer.getZoomScale() <500&& lastViewed ==1) {
      PVector mousePosition = zoomer.getMouseCoord();
      if (mousePosition.x >= bt.getX() &&
      mousePosition.x <= bt.getX()+ (float(width)-40)/visits.size() && 
      mousePosition.y > bt.getY() && 
      mousePosition.y < bt.getY() + (3*siteURL.length()/(float) zoomer.getZoomScale())) {
        pushMatrix();
        translate(bt.getX()+(float(width)-40)/(1.5*(visits.size())), bt.getY());
        rotate(4.71238898);
        textFont(ourFont, (float) (15.5/(zoomer.getZoomScale())));
        text(siteURL +" , "+ timestamp, 0, 0);
        popMatrix();
      }
    }else if (zoomer.getZoomScale() >= 1.5 && zoomer.getZoomScale() <500 && lastViewed ==2) {
      PVector mousePosition = zoomer.getMouseCoord();
      if (mousePosition.x >= bt.getX() &&
      mousePosition.x <= bt.getX()+ (float(width)-40)/visits.size() && 
      mousePosition.y > bt.getY() && 
      mousePosition.y < bt.getY() + (3*siteURL.length()/(float) zoomer.getZoomScale())) {
        pushMatrix();
        translate(bt.getX()+(float(width)-40)/(1.5*(visits.size())), bt.getY());
        rotate(4.71238898);
        textFont(ourFont, (float) (15.5/(zoomer.getZoomScale())));
        text(siteURL +" , Visited: "+(int) numVisits, 0, 0);
        popMatrix();
      }
  }
}
  }

