import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;

String file = "rpsm.csv";
String dataFile = file;

UnfoldingMap map;

ArrayList<Student> students = new ArrayList();
ArrayList<Student> monStudents = new ArrayList();
ArrayList<Student> tuesStudents = new ArrayList();
ArrayList<Student> wedStudents = new ArrayList();
ArrayList<Student> thurStudents = new ArrayList();
ArrayList<Student> friStudents = new ArrayList();
ArrayList<Student> satStudents = new ArrayList();

int[] incomeColor = {0, 0, 0}; //color values vary by stu.incat

int change;

void setup() {
  size(800, 600, P2D);
  smooth();

  // Create Map
  map = new UnfoldingMap(this);
  map.zoomAndPanTo(11, new Location(43.7572038, -79.5099306));
  MapUtils.createDefaultEventDispatcher(this, map);
  map.setTweening(true);
  background(120);
  
  // Load data
  Table rpsmCSV = loadTable(dataFile, "header, csv");
  for (TableRow rpsmRow : rpsmCSV.rows()) {
    Student stu = new Student();
    
  // Read data
  stu.day = rpsmRow.getString("lessonDay");
  
  stu.id = rpsmRow.getString("studentID");
  stu.fullinc = rpsmRow.getString("incomeCat");
  float stulat = rpsmRow.getFloat("lat1");
  float stulng = rpsmRow.getFloat("lon1");
  stu.stuloc = new Location(stulat, stulng);
    
  float leslat = rpsmRow.getFloat("lat2");
  float leslng = rpsmRow.getFloat("lon2");
  stu.lesloc = new Location(leslat, leslng);
  stu.school= rpsmRow.getString("lessonLocation");
    
  stu.lesson = rpsmRow.getString("className");
  stu.time = rpsmRow.getString("lessonTime");
    
  if (stu.fullinc.length() > 0) {
    if (stu.fullinc.charAt(0) == ('A')) {stu.incat = 'A';}
    else if (stu.fullinc.charAt(0) == 'B') {stu.incat = 'B';} 
      else if (stu.fullinc.charAt(0) == 'C') {stu.incat = 'C';}
      else if (stu.fullinc.charAt(0) == 'D') {stu.incat = 'D';}
      else if (stu.fullinc.charAt(0) == 'E') {stu.incat = 'E';} 
      else if (stu.fullinc.charAt(0) == 'F') {stu.incat = 'F';} 
      else if (stu.fullinc.charAt(0) == 'G') {stu.incat = 'G';} 
      else {stu.incat = 'I';}
    }
    //add the student
    students.add(stu);
    
    if (stu.day.equals("Monday")){
      monStudents.add(stu);
    }
    
    if (stu.day.equals("Tuesday")){
      tuesStudents.add(stu);
    }
    
    if (stu.day.equals("Wednesday")){
      wedStudents.add(stu);
    }
    
    if (stu.day.equals("Thursday")){
      thurStudents.add(stu);
    }
    
    if (stu.day.equals("Friday")){
      friStudents.add(stu);
    }
    
    if (stu.day.equals("Saturday")){
      satStudents.add(stu);
    }
    
  }
  println("Loaded " + students.size() + " students.");
}

void draw() {
  // Draw map and darken it a bit
  map.draw();
  fill(0, 150);
  rect(0, 0, width, height);
  
  //create buttons
  rect(10, 10, 50, 50);
  rect(70, 10, 50, 50);
  rect(130, 10, 50, 50);
  rect(190, 10, 50, 50);
  rect(250, 10, 50, 50);
  rect(310, 10, 50, 50);
  rect(370, 10, 50, 50);
  rect(430, 10, 50, 50);
  
  textSize(20);
  fill(255);
  text("MON", 10, 42);
  text("TUE", 75, 42);
  text("WED", 133, 42);
  text("THU", 194, 42);
  text("FRI", 259, 42);
  text("SAT", 316, 42);
  text("SUN", 375, 42); //sunday is a dud
  text("ALL", 436, 42);
  
   //conditionals for buttons
   if((mouseX > 10 && mouseX < 60) && (mouseY > 10 && mouseY < 60)) {
     //display monday students
     display(monStudents);
     fill(255, 255, 255, 100);
     rect(10, 10, 50, 50);
     change = 1;
     println("monday");
   } else if ((mouseX > 70 && mouseX < 120) && (mouseY > 10 && mouseY < 60)) {
     //display tuesday students
     display(tuesStudents);
     change = 2;
     fill(255, 255, 255, 100);
     rect(70, 10, 50, 50);
     println("tuesday");
   } else if ((mouseX > 130 && mouseX < 180) && (mouseY > 10 && mouseY < 60)) {
     //display wednesday students
     display(wedStudents);
     change = 3;
     fill(255, 255, 255, 100);
     rect(130, 10, 50, 50);
     println("wednesday");
   } else if ((mouseX > 190 && mouseX < 240) && (mouseY > 10 && mouseY < 60)) {
     //display thursday students
     display(thurStudents);
     fill(255, 255, 255, 100);
     rect(190, 10, 50, 50);
     change = 4;
     println("thursday");
   } else if ((mouseX > 250 && mouseX < 300) && (mouseY > 10 && mouseY < 60)) {
     //display friday students
     display(friStudents);
     fill(255, 255, 255, 100);
     rect(250, 10, 50, 50);
     change = 5;
     println("friday");
   } else if ((mouseX > 310 && mouseX < 360) && (mouseY > 10 && mouseY < 60)) {
     //display saturday students
     display(satStudents);
     fill(255, 255, 255, 100);
     rect(310, 10, 50, 50);
     change = 6;
     println("saturday");
   } else if ((mouseX > 370 && mouseX < 420) && (mouseY > 10 && mouseY < 60)) {
     //display "sunday" students (actually using Friday's data because they're both empty)
     display(friStudents);
     fill(255, 255, 255, 100);
     rect(370, 10, 50, 50);
     change = 7;
     println("sunday");
   } else if ((mouseX > 430 && mouseX < 490) && (mouseY > 10 && mouseY < 60)) {
     //display ALL students
     fill(255, 255, 255, 100);
     rect(430, 10, 50, 50);
     display(students);
     change = 8;
     println("sunday");
   } else {
     flag(change);
   }
   
   //println(mouseX, mouseY);
  }

void display(ArrayList<Student> s){
// Iterate over students
  
  for (Student stu : s) {
    for(Student sec : s) {
      if(stu.stuloc == sec.stuloc) {
        stu.offset = 20;
      } else {
        stu.offset = 12;
      }
    }
    // get locations
    ScreenPosition pos = map.getScreenPosition(stu.stuloc);
    ScreenPosition lespos = map.getScreenPosition(stu.lesloc);
    
    //for displaying text on the lines
    float midPointX = ((pos.x + lespos.x) / 2);
    float midPointY = ((pos.y + lespos.y) / 2);
    
    //different colors for different income category
    switch(stu.incat) {
    case 'A': 
      incomeColor[0] = 255;
      incomeColor[1] = 0;
      incomeColor[2] = 0; //red
    break;
    case 'B': 
      incomeColor[0] = 255;
      incomeColor[1] = 165;
      incomeColor[2] = 0; //orange
    break;
    case 'C':
      incomeColor[0] = 255;
      incomeColor[1] = 255;
      incomeColor[2] = 0; //yellow
    break;
    case 'D':
      incomeColor[0] = 0;
      incomeColor[1] = 255;
      incomeColor[2] = 0; //green
    break;    
    case 'E':
      incomeColor[0] = 0;
      incomeColor[1] = 0;
      incomeColor[2] = 255; //blue
    break;
    case 'F':
      incomeColor[0] = 75;
      incomeColor[1] = 0;
      incomeColor[2] = 130; //indigo
    break;
    case 'G':
      incomeColor[0] = 255;
      incomeColor[1] = 0;
      incomeColor[2] = 255; //violet
    break;
    default: //category I
      incomeColor[0] = 0;
      incomeColor[1] = 0;
      incomeColor[2] = 0; //black
    break;
    }
    
    if (stu.showLabel) {
      fill(0);
      text(stu.id, pos.x - textWidth(stu.id)/2, pos.y);
    }
    if (stu.showschoLabel) {
      fill(0);
      text(stu.school, lespos.x - textWidth(stu.school)/2, lespos.y);

    }
    if (stu.showLessonLabel) { //display lesson type in the middle of the line
      fill(0);
      text(stu.lesson, midPointX, midPointY);
    }
    if (stu.showTimeLabel) { //display time in the middle of the line, with an offset
      fill(0);
      text(stu.time, midPointX, midPointY + stu.offset);
    }
    //println(stu.offset);
    
    //draw students' home addresses
    noStroke();
    //fill(255, 0, 0, 100);
    fill(incomeColor[0], incomeColor[1], incomeColor[2], 100);
    ellipse(pos.x, pos.y, 10, 10);
  
    //draw students' lesson addresses
    fill(255, 255, 255, 100);
    ellipse(lespos.x, lespos.y, 10, 10);
   
    //draw lines leading from class address to home address  
    fill(0, 0, 255);
    stroke(255, 255, 255, 50);
    strokeWeight(0.8); 
    line(pos.x, pos.y, lespos.x, lespos.y);
   
   if (dist(pos.x, pos.y, mouseX, mouseY) < 10) {
      //stu.showLabel = true;
      stu.showTimeLabel = true;
      stu.showLessonLabel = true;
   } else {
     //stu.showLabel = false;
     stu.showTimeLabel = false;
     stu.showLessonLabel = false;
   }
   //println(stu.showLabel);
  }
}

void flag(int i){
switch(i) {
    case 1: 
      display(monStudents);
      fill(255, 255, 255, 100);
      rect(10, 10, 50, 50);
    break;
    case 2: 
      display(tuesStudents);
      fill(255, 255, 255, 100);
      rect(70, 10, 50, 50);
    break;
    case 3:
      display(wedStudents);
      fill(255, 255, 255, 100);
      rect(130, 10, 50, 50);
    break;
    case 4:
      display(thurStudents);
      fill(255, 255, 255, 100);
      rect(190, 10, 50, 50);
    break;    
    case 5:
      display(friStudents);
      fill(255, 255, 255, 100);
      rect(250, 10, 50, 50);
    break;
    case 6:
      display(satStudents);
      fill(255, 255, 255, 100);
      rect(310, 10, 50, 50);
    break;
    case 7:
      display(friStudents);
      fill(255, 255, 255, 100);
      rect(370, 10, 50, 50);
    break;
    case 8: 
      display(students);
      fill(255, 255, 255, 100);
      rect(430, 10, 50, 50);
    break;
    }
}
