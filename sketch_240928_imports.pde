PImage photo_1, photo_2, photo_3, photo_4;



StringList inventory;

ArrayList<Picture> pedacitos = new ArrayList<Picture>();

ArrayList<Picture[]> semillas = new ArrayList<Picture[]>();

StringList manual_hashes;

int sample = 10;


int size_x = 2;
int size_y = 2;

int[] r;

void setup() {
  
  inventory = new StringList();
  inventory.append("fig_1");
  inventory.append("fig_2");
  inventory.append("fig_3");
  inventory.append("fig_4");
  
  r[0] = int(random(255));
  r[1] = int(random(255));
  r[2] = int(random(255));
  r[3] = int(random(255));
  
  photo_1 = loadImage("seed-"+r[0]+".png"); 
  photo_2 = loadImage("seed-"+r[1]+".png"); 
  photo_3 = loadImage("seed-"+r[2]+".png");  
  photo_4 = loadImage("seed-"+r[3]+".png"); 


  //inventory.append("pilar");
  //inventory.append("aperture");
  //inventory.append("void");

  
  int counter = 0;
  
  size(1000,1000);
  background(253,248,249);
  for(int i=0;i<size_x;i++){
    for(int j=0;j<size_y;j++){
      
      
      
      //fill(253,248,249);
      //rect(100*i,100*j,100,100);
      //fill(0);
      //text(inventory.get(1),40+(i*100),50+(j*100));
      
      
      for(int n=0; n<inventory.size(); n++){
        
        counter = counter + 1;
        pedacitos.add(new Picture(i,j,inventory.get(n),r[n]));
        
        
      }
        
    }
  }
  
  //println(counter);
  
  
  
  
  
  
  
  // dim 1: inventory.size();
  // dim 2: 3
  // dim 3: 3
  //int counter_agotado = 0;
  
  //int nuevacount = 0;
  
  manual_hashes = new StringList();

  for(int x=0;x<sample;x++){
    
    //boolean flag_existe = false;
    
    
    //for(int y=0;y<pedacitos.size();y++){
      
      
      int counter2 = 0;
      Picture[] picturelist = new Picture[size_x*size_y];
      
      // recorrer el posible objeto picturelist
      ArrayList<Picture>[][] mesirven_memory = new ArrayList[size_x][size_y];
      
      for(int i=0;i<size_x;i++){
        for(int j=0;j<size_y;j++){
          
            //quiero armar un objeto picturelist unico
            // que tenga 9 objetos Picture
            // que no se repita el index lineal
            // que no se repita el index de dos dimensiones

            // tengo 45 pedacitos, pero solo 5 me sirven por posicion
           
            ArrayList<Picture> mesirven = new ArrayList<Picture>();
            
            mesirven_memory[i][j] = mesirven;
            //como tener un listado por posicion de las cosas que aun me sirven
            
            for(int i3=0;i3<pedacitos.size();i3++){
              
     
              // uno por uno de los 45 pedacitos
              
              Picture objeto_temporal = pedacitos.get(i3);
              
              //println(objeto_temporal.display());
              
              for(int n3=0;n3<inventory.size();n3++) {
              
                
                // si un objeto del inventario (digamos door) de los 45 pedacitos que sean door, devuelveme las posiciones posibles
                
                // si la posicion es en la que voy, luego
                
                
           
                
                if (objeto_temporal.get_j(inventory.get(n3)) == j && objeto_temporal.get_i(inventory.get(n3)) == i) {
                  
                  // si cada uno de los pedacitos (45) esta en la posicion actual, agregalo
                  
                  // deberia poder removerlo de la lista en la que está
                  
                  
                  
                   mesirven_memory[i][j].add(objeto_temporal);
                  
                  
                  
                }
              }
              
              
            }
            
            
              }  // end j
  } // end i
  
  
  for(int i=0;i<size_x;i++){
        for(int j=0;j<size_y;j++){
              
             // recorre el inventario de los mesirven
             //println(mesirven_memory[i][j].size());
             
             
             for(int m=0; m<inventory.size()+1;m++){
         
                 if(mesirven_memory[i][j].size() != 0) {
               
                int choice = int(random(mesirven_memory[i][j].size()));
          
            
                  // me sirven 5 tipos (segun el inventario) en la posicion, elijo al azar, y la saco de las posibles. 
                  if (i==1 && j==1) {
                    
                    //picturelist[counter2] = new Picture(i,j,"void");
                    
                    picturelist[counter2] = mesirven_memory[i][j].get(choice);
                 
                } else {
                  
                  picturelist[counter2] = mesirven_memory[i][j].get(choice);
                  
                  }
                  
                  //print(picturelist[counter2].display());
                  mesirven_memory[i][j].remove(choice);
              
                //println(mesirven_memory[i][j].size());
                
                 } else {
                   
                   //print("en esa posicion "+str(i)+" "+str(j)+" se agotaron \n");
                   
                   counter2 = counter2+ 1;

                 }

             }
            
    }  // end j
  } // end i
  
  if(semillas.size() == 0) {
    
     semillas.add(picturelist);
    
  }
  
  
  
  
  
  //ESTO ESTA MUY PERMISIVO, NO HAY FORMA DE VER SI EXISTIA O NO
  
  //hice todo y empiezo a recorrer las semillas que tengo
 

    String hash1 = "hola-";
      
      for(int g=0; g<picturelist.length; g++){
        hash1 = hash1 + "-" + picturelist[g].display();
      }
      
      //println(hash1);
    
    if (manual_hashes.hasValue(hash1)) {
      
      
    } else {
      
      
      
      
      String hash = "hola-";
      
      for(int g=0; g<picturelist.length; g++){
        hash = hash + "-" + picturelist[g].display();
      }
      
      println(hash);
      manual_hashes.append(hash);
      semillas.add(picturelist);
      hash = "";
      //println(picturelist[0].display()+" "+picturelist[1].display()+" "+picturelist[2].display()+" "+picturelist[3].display());
      //println(picturelist);
      
     
    }
    
    } 
   
  for(int x=0;x<semillas.size();x++){
    
    background(253,248,249);
  println(semillas.size());

  //int number_selected = int(random(semillas.size()));
  int number_selected = x;
  //println(" ");
  //println(manual_hashes.get(number_selected));
  
  
  //println("nuevacount: "+str(nuevacount));
  int counter_final = 0;
  for(int i=0;i<size_x;i++){
    for(int j=0;j<size_y;j++){
      
      
      
      fill(253,248,249);
      //rect(100*i,100*j,100,100);
      fill(0);
      
      String texto = semillas.get(number_selected)[counter_final].display();
      if (texto == "fig_1") {
        
        pushMatrix();
 
        translate((i*300)+80, (j*300)-100);
        rotate(radians(45));
        image(photo_1, 200, 20);
        
        popMatrix();
        
      } else if (texto=="fig_2") {
        
        pushMatrix();
 
        translate((i*300)+80, (j*300)-100);
        rotate(radians(45));
        image(photo_2, 200, 20);
        
        popMatrix();
        
      } else if (texto == "fig_3") {
        pushMatrix();
 
        translate((i*300)+80, (j*300)-100);
        rotate(radians(45));
        image(photo_3, 200, 20);
        
        popMatrix();
        
      } else {
        
        pushMatrix();
 
        translate((i*300)+80, (j*300)-100);
        rotate(radians(45));
        image(photo_4, 200, 20);
        
        popMatrix();
        
        //text(semillas.get(number_selected)[counter_final].display(),30+(i*100),50+(j*100));
  
      }
      
      
      String signature = str(semillas.get(number_selected)[0].get_code())+"-"+str(semillas.get(number_selected)[1].get_code())+"-"+str(semillas.get(number_selected)[2].get_code())+"-"+str(semillas.get(number_selected)[4].get_code())+"-";
      text(signature, 860,900);
      String filex = str(x);
      saveFrame("ws_"+signature+"-"+filex+".png");
      
      
  counter_final = counter_final +1;
  
    }}
}

  }

  
 

 
class Picture { 
  int i_pos, j_pos; 
  String tipo;
  int codigo;
  
  Picture (int i_, int j_, String tipo_, int codigo_) {  
    i_pos = i_; 
    j_pos = j_; 
    tipo = tipo_;
    codigo = codigo_;
  } 
  
  String id_by_pos(int i_, int j_) {
    
    return tipo;
    
  }
  
  String display() {
    
    return tipo;
  }
  
  int get_i(String tipo_2) {
   
    if (tipo_2 == tipo) {
    
      return i_pos;
    
    } else {
      
      return 100;
      
    }
    
  }
  
  
  int get_j(String tipo_2) {
   
    if (tipo_2 == tipo) {
      
    return j_pos;
    
    } else {
      
      return 100;
      
    }
    
  }
  
  int get_code() {
    
    return codigo;
  }
    
  
} 
