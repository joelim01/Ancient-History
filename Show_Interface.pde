//Create P5 interface

void showInterface (){
  controlP5 = new ControlP5(this);
  controlP5.setAutoDraw(false);
  controlWindow = controlP5.addControlWindow("controlP5window",100,100,240,150);
  controlWindow.hideCoordinates();
  controlWindow.setBackground(color(255));
  controlWindow.setTitle("Options");
  r1 = controlP5.addRadioButton("radioButton",10,10);
  r1.setColorForeground(color(0,0,0));
  r1.setColorActive(color(100,150,200));
  r1.setColorLabel(color(255));
  r1.setItemsPerRow(5);
  r1.setSpacingColumn(100);
  r1.moveTo(controlWindow);
 
  addToRadioButton(r1,"Chronological",1);
  addToRadioButton(r1,"Site URL",2);
 // addToRadioButton(r1,"Category",3);
 
}

void addToRadioButton(RadioButton theRadioButton, String theName, int theValue ) {
  Toggle t = theRadioButton.addItem(theName,theValue);
  t.captionLabel().setColorBackground(color(80));
  t.captionLabel().style().movePadding(2,0,-1,2);
  t.captionLabel().style().moveMargin(-2,0,0,-3);
  t.captionLabel().style().backgroundWidth = 96;
  
}

void controlEvent(ControlEvent theEvent) {
  print("got an event from "+theEvent.group().name()+"\t");
  for(int i=0;i<theEvent.group().arrayValue().length;i++) {
    print(int(theEvent.group().arrayValue()[i]));
  }
 decider(theEvent.group().value()); //when the radio button controlling Display type changes, pass that info to the decider
}



