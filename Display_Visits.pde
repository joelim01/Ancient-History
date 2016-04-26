void display (){
  
//Display each visit in the visits array  
  for (float i=0; i < visits.size(); i++) {
    Visit visitTemp = (Visit) visits.get(int(i));
       visitTemp.display();
    
  }
}
  
//Order the visits by Chronological Date Assuming that the input data is ordered Chronologically
void chronVisits() {
  //Loop through the visits
  for (float i=0; i < visits.size(); i++) {
    //For the first visit, set the origin position and set the color
    if (i == 0) {
      
      Visit visitTemp = (Visit) visits.get(int(i));
      visitTemp.xPosOld = visitTemp.xPosCurrent;
      visitTemp.xPosCurrent = 20;
      visitTemp.yPosOld = visitTemp.yPosCurrent;
      visitTemp.yPosCurrent = (height/2);
      visitTemp.createPath();
      visitTemp.visitColor = color(255,100, 100);
      visits.set(int(i), visitTemp);
      
    } else {
      //For following every visit, incrementally increase the position but do not override the color
      Visit visitTemp = (Visit) visits.get(int(i));
      visitTemp.xPosOld = visitTemp.xPosCurrent;
      visitTemp.xPosCurrent = 20+(i*((float(width)-40)/(visits.size())));
      visitTemp.yPosOld = visitTemp.yPosCurrent;
      visitTemp.yPosCurrent = (height/2);
      visitTemp.createPath();
      noStroke();
      visits.set(int(i), visitTemp);
      
    }
  }
}

//Order the visits by Frequency
void freqVisits() {
  ArrayList visitsTemp; //create a copy of an existing array list of ordered visit metadata
  visitsTemp = (ArrayList) visits.clone();
  positionCounter = 0;
  int deleted = 0;
  int drawn = 0;


//This code takes the initial global data set, visits, and creates two Temporary Array Lists that are clones of that data. It then compares each entry
  //against the 
  while (visitsTemp.size ()>0) { //loop through VisitTemp array, comparing the first object in the arrayList to every other object in the arrayList
    for (int j=0; j <= visitsTemp.size(); j++) {

      if (visitsTemp.size()==j) { //when the loop completes, remove the visit from the VisitTemp array
      
        visitsTemp.remove(0);
        deleted++;
        
      }
      
      if (j == 0) { //then visitTemp and visitTemp2 are the same obj, don't test
      
        Visit visitTemp = (Visit) visitsTemp.get(0); //grab the first object to compare and load into a temp obj, set all of the position data from current to old
        visitTemp.xPosOld = visitTemp.xPosCurrent;
        visitTemp.xPosCurrent = 20 + (positionCounter*((float(width)-40)/(visits.size()))); // set the new x position of the temp object
        positionCounter ++;
        visitTemp.yPosOld = visitTemp.yPosCurrent;
        visitTemp.yPosCurrent= (height/2);// set the y position of the temp object
        visitTemp.createPath(); //create a path between the old and new position
        visitTemp.visitColor = color(255, 100, 100);
        visits.set(drawn, visitTemp); //load temp obj into array to update original obj
        drawn++; 
        
      } 
      
      else if (visitsTemp.size() > j && j > 0) { 
        
        Visit visitTemp = (Visit) visitsTemp.get(0); //get the first item to compare and load into a temp obj
        Visit visitTemp2 = (Visit) visitsTemp.get(j); //get the second item to compare and load into a temp obj
        
        if (visitTemp.siteURL.equals(visitTemp2.siteURL)) {
          visitTemp2.xPosOld = visitTemp2.xPosCurrent;
          visitTemp2.xPosCurrent =  20 + (positionCounter*((float(width)-40)/(visits.size())));
          positionCounter ++;
          visitTemp2.yPosOld = visitTemp2.yPosCurrent;
          visitTemp2.yPosCurrent = (height/2)+(15);
          visitTemp2.createPath();
          noStroke();
         // visitTemp2.visitColor = color(0, 0, 255);
          //fill(0, 255, 0);
         // rect(visitTemp2.xPosCurrent, visitTemp2.yPosCurrent, ((float(width)-40)/(visits.size())), 60);
          visits.set(drawn, visitTemp2);
          drawn++;
          visitsTemp.remove(int(j)); // visitsTemp(j) is the same as visitsTemp(0) so we don't want to leave it in the list, as that will create duplicate entries.
          deleted++;
          j--;
         
        
        }
      }
    }
  }
}

