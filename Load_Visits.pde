//loading data from the CSV data file into an array of Visit objects.

void loadVisits() {
  for (int i = 0; i< csv.length; i++) {
    //field 1 Full URL
    //field 2 Page URL
    //field 5 Site URL
    //field 6 Date
    //field 7 Epoch Date
    String fullURL = csv[i][0];
    String siteURL = csv[i][1];
    String pageURL= csv[i][4];
    String timestamp =  csv[i][5];
    float epochDate = Float.parseFloat(csv[i][6]);
    float numVis = Float.parseFloat(csv[i][7]);
    visits.add(new Visit (fullURL, siteURL, pageURL, timestamp, epochDate, numVis));
    
  }

}
    

