class Box    
{
  float _width; // Largeur
  float _height; // Hauteur
  float _depth; // Profondeur
  PVector gravity; // Vect de gravité
  float dampingForce = 0.6;
  public Box(){  
    //Dimensions de la boîte
    this._width=width/2;
    this._height= height/2 ;
    this._depth= width/2 ; 
    gravity  = new PVector(0, 9.8, 0);// Initi vecteur de gravité (gravité vers le bas)
  }
  public Box(int _w, int _h, int _d){
    this._width = _w;
    this._height = _h;
    this._depth = _d;
    gravity  = new PVector(0, 9.8, 0);// Initi vecteur de gravité (gravité vers le bas)
  }
  
  public void create(){   
    pushMatrix();//Sauvegarde la matrice de transformation actuelle pour permettre des transformations locales.
    stroke(200);//couleur de la ligne
    strokeWeight(5);//épaisseur de la ligne
    noFill();// Desactiver le remplissage des formes.
    box(_width, _height, _depth);// Dessiner la boîte engoblante
    fill(200, 233, 255, 80);//couleur de remplissage du face sol
    rotateX(PI/2); //Rotation du support de la face
    translate(0, 0,-_height/2); // Déplacer le support vers le bas.
    rect(-_width/2, -_width/2, _width, _width); // Dessiner le rectangle vert centré par rapport à la boîte.
    popMatrix(); //Restaurer la matrice de transformation
  } 
}
  
  
