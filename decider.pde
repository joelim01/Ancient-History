//sorts the objects in the display array based on their chronological order or based on their visit freqency

void decider (float index){
  
  if (index == 1){
    
    class CustomComparator implements Comparator<Visit>{
            public int compare(Visit o1, Visit o2) {
                Visit v1 = (Visit) o1;
                Visit v2 = (Visit) o2;
                return (v1.epochDate<v2.epochDate) ? -1 : (v1.epochDate==v2.epochDate) ? 0 : 1;
                
            }
    }
  
  Collections.sort(visits, new CustomComparator());
  lastViewed=1;
  chronVisits();
    
  }
    if (index == 2){
      
      class CustomComparator2 implements Comparator<Visit>{
            public int compare(Visit o1, Visit o2) {
                Visit v1 = (Visit) o1;
                Visit v2 = (Visit) o2;
                return (v1.numVisits>v2.numVisits) ? -1 : (v1.numVisits==v2.numVisits) ? 0 : 1;
                
            }
  }
  
  Collections.sort(visits, new CustomComparator2());
  lastViewed=2;  
  freqVisits();
  }
    if (index == 3){
 //   catVisits();
  }
  
}
  
  
