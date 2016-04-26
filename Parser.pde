//for importing csv files into a 2d array
//by che-wei wang

void parser() {

  String lines[] = loadStrings("moz_places_edited.csv");
  int csvWidth=0;
  showInterface();

  //calculate max width of csv file
  //field 1 Full URL
  //field 2 Page URL
  //field 3 NULL
  //field 4 NULL
  //field 5 Site URL
  //field 6 Date
  //field 7 Epoch Date
  //field 7 Number of Visits

    for (int i=0; i < lines.length; i++) {
    String [] chars=split(lines[i], ',');
    if (chars.length>csvWidth) {
      csvWidth=chars.length;

    }
  }

  //create csv array based on # of rows and columns in csv file
  csv = new String [lines.length][csvWidth];


  //parse values into 2d array
  for (int i=0; i < lines.length; i++) {
    String [] temp = new String [lines.length];
    temp= split(lines[i], ',');
    for (int j=0; j < temp.length; j++) {
      csv[i][j]=temp[j];
    }
  }
}

