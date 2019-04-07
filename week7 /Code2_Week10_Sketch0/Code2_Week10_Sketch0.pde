int num = 10;
DataShape d1_TotalIndividual;
DataShape d5_TotalAdult;
DataShape d2_TotalChildren;
DataShape d3_SingleMale;
DataShape d4_SingleFemale;


ChartCode cc1_TotalIndividual;
ChartCode cc5_TotalAdult;
ChartCode cc2_TotalChildren;
ChartCode cc3_SingleMale;
ChartCode cc4_SingleFemale;


void setup(){
  size(600,600);
  background(0);
  //api data
  JSONArray data = loadJSONArray("https://data.cityofnewyork.us/resource/wece-v9d7.json");
  
  //chart
  for (int i = 0; i < num ; i ++){
    
    JSONObject data1 = data.getJSONObject(i);
    String SingleMale = data1.getString("single_adult_men_in_shelter");
    String SingleFemale = data1.getString("single_adult_women_in_shelter");
    String TotalChildren = data1.getString("total_children_in_shelter");
    String TotalAdult = data1.getString("total_adults_in_shelter");
    String TotalIndividual = data1.getString("total_individuals_in_shelter");
    
    d1_TotalIndividual = new DataShape(70 + i * 50, height/2 - 30,  int(TotalIndividual)/200, color(255), TotalIndividual, 500);
    d2_TotalChildren = new DataShape(70 + i * 50, height/2 - 30, int(TotalChildren)/200, color(0, 255, 0), TotalChildren, 360);
    d3_SingleMale = new DataShape(70 + i * 50, height/2 - 30, int(SingleMale)/200, color(0, 0, 255), SingleMale, 300);
    d4_SingleFemale = new DataShape(70 + i * 50, height/2 - 30, int(SingleFemale)/200, color(255, 0, 0), SingleFemale,280);
    d5_TotalAdult = new DataShape(70 + i * 50, height/2 - 30, int(TotalAdult)/200, color(100, 100, 100), TotalAdult, 400);
    
    
      
    d1_TotalIndividual.display();
    d5_TotalAdult.display();
    d2_TotalChildren.display();
    d3_SingleMale.display();
    d4_SingleFemale.display();
    
    println(i);

  }
  
  //title
  
  textSize(30);
  fill(255);
  text("NYC HOMLESS SHELTER REPORT", 80, 60);

  
  //Chartcode
  cc1_TotalIndividual = new ChartCode(200, 100, color(255), "TotalIndividual");
  cc5_TotalAdult = new ChartCode(200, 125, color(100, 100, 100), "TotalAdult");
  cc2_TotalChildren = new ChartCode(200, 150, color(0, 255, 0), "TotalChildren");
  cc3_SingleMale = new ChartCode(200, 175, color(0, 0, 255), "SingleMale");
  cc4_SingleFemale = new ChartCode(200, 200, color(255, 0, 0), "SingleFemale");
 
  
  cc1_TotalIndividual.display();
  cc5_TotalAdult.display();
  cc2_TotalChildren.display();
  cc3_SingleMale.display();
  cc4_SingleFemale.display();
  
}

void draw(){
  //println(mouseX, mouseY);
  
}
