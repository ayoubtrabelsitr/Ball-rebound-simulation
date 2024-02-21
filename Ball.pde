class Ball{
  PVector position, velocity, acceleration;
  float radius, weight;
  
  public Ball(PVector pos, PVector vel, float r, float w){
    this.position = pos;
    this.velocity = vel;
    this.acceleration = new PVector();
    this.radius = r;
    this.weight = w;
  }
  
  public void create(){
    pushMatrix();
    noStroke();
    fill(0, 153, 0);
    translate(this.position.x, this.position.y, this.position.z);
    rotateX(QUARTER_PI);
    sphere(this.radius);
    popMatrix(); 
  }
  
  //Newton third law of motion
  //Pour chaque action, on a un réaction. La balle perd de la force en raison de l'energie perdu sur la friction 
  public void boundaryCollision(Box box){
    //Right
    if(this.position.x >= box._width/2 - this.radius){
      boundaryHit = true;
      angleRebound = ((degrees(PVector.angleBetween(this.velocity, Right)))-180)/-180; //get Angle and normalize it between 0 and 1
      this.position.x =  box._width/2 - this.radius;
      this.velocity.x *= -box.dampingForce; 
    }
    
    //Left
    if(this.position.x <= -box._width/2 + this.radius){
      boundaryHit = true;
      angleRebound = ((degrees(PVector.angleBetween(this.velocity, Left)))-180)/-180; //get Angle and normalize it between 0 and 1
      this.position.x =  -box._width/2 + this.radius;
      this.velocity.x *= -box.dampingForce; 
    }
    
    //Up
    if(this.position.y <= -box._height/2 + this.radius){
      boundaryHit = true;
      angleRebound = ((degrees(PVector.angleBetween(this.velocity, Up)))-180)/-180; //get Angle and normalize it between 0 and 1
      this.position.y =  -box._height/2 + this.radius;
      this.velocity.y *= -box.dampingForce;  
    }
    
    //Down
    if(this.position.y >= box._height/2 - this.radius){
      boundaryHit = true;
      angleRebound = ((degrees(PVector.angleBetween(this.position, Down)))-180)/-180; //get Angle and normalize it between 0 and 1
      this.position.y =  box._height/2 - this.radius;
      this.velocity.y *= -(box.dampingForce);
    }
    
    //Front
    if(this.position.z >= box._depth/2 - this.radius){
      boundaryHit = true;
      angleRebound = ((degrees(PVector.angleBetween(this.velocity, Front)))-180)/-180; //get Angle and normalize it between 0 and 1
      this.position.z =  box._depth/2 - this.radius;
      this.velocity.z *= -box.dampingForce; 
    }
    
    //Back
    if(this.position.z <= -box._width/2 + this.radius){
      boundaryHit = true;
      angleRebound = ((degrees(PVector.angleBetween(this.velocity, Back)))-180)/-180; //get Angle and normalize it between 0 and 1
      this.position.z =  -box._depth/2 + this.radius;
      this.velocity.z *= -box.dampingForce; 
    }
    /*La force de friction acte dans le sense inverse du déplacement et depend de la normale du surface de collision avec la balle et le coefficient*/
    frictionForce = this.velocity.copy();
    frictionForce.normalize();
    frictionForce.mult(-1);
    frictionForce.mult(angleRebound * frictionCoeff);
  }
  //Newton second law
  //L'acceleration depend de la force applique et la masse de l'objet
  public void keyPressed(){
    if(keyPressed){
      //Appliquer une force aléatoire sur tout les axes
      if(key == ' '){
        randomForce = new PVector(random(-maxForce, maxForce), random(-maxForce, 0), random(-maxForce, maxForce));
        this.applyForce(randomForce);
        randomForce = new PVector(0, 0, 0);
      } 
      //Appliquer une force constant qui pousse vers le haut
      if(key == 'f'){
        PVector force = new PVector(0, -maxForce, 0);
        this.applyForce(force);
      }
    }
  }
  
  
  public void move(){
    this.velocity.add(this.acceleration);
    this.applyForce(this.gravity());
    //this.applyForce(gravity);
    //Si il y a un contact avec la surface, calculer la deceleration en fonction de la force de friction
    if(boundaryHit == true){
      this.applyForce(frictionForce);
      boundaryHit = false;
      frictionForce = new PVector(0, 0, 0);
    }
    deceleration = new PVector(0, 0, 0);
    this.acceleration = new PVector(0, 0, 0);
    this.applyForce(this.airResistance());
    
    //Mettre à jour la position en fonction de la vitesse
    PVector speed = this.velocity.copy();
    speed.add(this.velocity.copy());
    this.position.add(speed.mult(0.5));
  }
  
  //Calculer l'acceleration en fonction de la force et l'appliquer sur la balle. a = F/m
  public void applyForce(PVector force){
    PVector acceleration = PVector.div(force, this.weight);
    this.velocity.add(acceleration);
    acceleration = new PVector(0, 0, 0);
  }
  
  //Calculer la resistance en fonction de la vitesse et la densite d'air
  public PVector airResistance(){
    PVector airDragForce = new PVector(0, 0, 0);
    airDragForce = this.velocity.copy();
    airDragForce.normalize();
    airDragForce.mult(-1);
    airDragForce.mult(dragCoefficient * airDensity);
    airDragForce.mult(this.radius);
    return airDragForce;
  }
  
  public PVector gravity(){
    return gravity;
  }
  
}
