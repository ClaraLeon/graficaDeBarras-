Table tabla;

int datoMax;

int numeroFilas;

String [] edad; 

//arreglos de cada columna
int [] kennedy;
int datoKennedy = 0;

int [] cBolivar;
int datocBolivar = 0;

int [] suba;
int datoSuba = 0;

void setup() 
{
  size(980, 600);
  tabla = loadTable("suicidioHoM-localidades.csv", "header");

  numeroFilas = tabla.getRowCount();
  println(numeroFilas + " filas en la tabla");


  //cantidad de filas
  kennedy = new int [numeroFilas];
  cBolivar = new int [numeroFilas];
  suba = new int [numeroFilas];


  edad = new String [numeroFilas]; 
  for (int i = 0; i < numeroFilas; i++)
  {
    TableRow row = tabla.getRow(i);
    edad[i]= row.getString("edad");

    //guardar cada información de las filas en el arreglo correspondiente
    kennedy[i]= row.getInt("kennedy");
    cBolivar[i]= row.getInt("ciudadBolivar");
    suba[i]= row.getInt("suba");

    //determina el valor max de todas las columnas
    datoKennedy  = kennedy[i];
    if (datoKennedy > datoMax) 
    {
      datoMax = datoKennedy;
    }

    datocBolivar  = cBolivar[i];
    if (datocBolivar > datoMax) 
    {
      datoMax = datocBolivar;
    }

    datoSuba  = suba[i];
    if (datoSuba > datoMax) 
    {
      datoMax = datoSuba;
    }
  }
}

void draw() 
{
  background(255);
  dibujarGrafica();

  fill(0);
  text("Número de casos de suicidio por edad - 2018", 100, 20);

  text("Kennedy", 100, 50);
  text("Ciudad Bolívar", 230, 50);
  text("Suba", 400, 50);

  fill(#76AFCC);
  rect(160, 35, 20, 20);
  fill(#FFADB5);
  rect(320, 35, 20, 20);
  fill(#FFFDB9);
  rect(440, 35, 20, 20);
}

void dibujarGrafica()
{
  noStroke();
  fill(#B3686F);
  rect(90, 75, 800, 460);

  fill(255);
  rect(140, 125, 700, 350);

  //lineas guia
  strokeWeight(1);
  stroke(#f5f5f5);

  //vertical
  for (int i = 0; i < numeroFilas; i++)
  {
    float x = map(i, 0, numeroFilas-1, 140, 800); 
    line(x, 125, x, 475);

    //color del texto - edades
    fill(255);

    //texto edades
    pushMatrix(); 
    translate(x, 480); 
    rotate(PI/2); 
    text(edad[i], 0, 0);
    popMatrix();
  }

  //horizontal
  for (int i = 0; i < datoMax; i+=1) 
  {
    float y = map(i, 0, datoMax, 475, 80);
    line(140, y, 840, y);

    //texto con el valor de cada linea
    fill(255);
    text(i, 120, y);
  }
  //kennedy
  noStroke();
  fill(#76AFCC);
  for (int i = 0; i < numeroFilas; i++)
  {
    float x = map(i, 0, numeroFilas-1, 140, 800);
    float y = map(kennedy[i], 0, datoMax, 470, 100);
    //ellipse(x, y,10,10); 
    rect(x, y, 10, 475-y);
  }
  //ciudad bolivar
  noStroke();
  fill(#FFADB5);
  for (int i = 0; i < numeroFilas; i++)
  {
    float x = map(i, 0, numeroFilas-1, 140, 800);
    float y = map(cBolivar[i], 0, datoMax, 470, 100);
    //ellipse(x, y,10,10); 
    rect(x+10, y, 10, 475-y);
  }
  //suba
  noStroke();
  fill(#FFFDB9);
  for (int i = 0; i < numeroFilas; i++)
  {
    float x = map(i, 0, numeroFilas-1, 140, 800);
    float y = map(suba[i], 0, datoMax, 470, 100);
    //ellipse(x, y,10,10); 
    rect(x+20, y, 10, 475-y);
  }
}
