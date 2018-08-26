class Particle {
  float radius=15f;
  PVector location=new PVector(0,0);
  PVector velocity=new PVector(0,0);
  PVector acceleration;
  float mass=1;
  float elasticity=1f;
  float lifeTime=-1;
  float lifeTimer=0;
  color ballColor=color(255,255,255);
  Boolean useGravity=true;
  Particle(float x, float y) {  
    // values 
    ballColor=color(random(255),random(255),random(255));
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  void addForce(PVector appliedForce){
    acceleration.add(appliedForce.x/mass,appliedForce.y/mass);
  }
  void display() {
    if(lifeTime>-1)
      fill(ballColor,lifeTime);
    else
      fill(ballColor,255);
    ellipse(location.x,location.y,radius*2,radius*2);
    checkCollision();
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    if(lifeTime>=-1)
       lifeTime-=1;
       
  }
  void setVelocity(float xVelocity , float yVelocity){
    velocity.set(xVelocity,yVelocity);
  }
  void checkCollision(){

    
    
    if(location.x+radius>width||location.x-radius<1){
      if(location.x+radius>width+1){
        location.x=width-radius;
      }
      if(location.x-radius<-1){
        location.x=radius;
      }
      velocity.set(-velocity.x,velocity.y);
    }
    if(location.y+radius>height||location.y-radius<1){
      if(location.y+radius>height+1){
        location.y=height-radius;
      }
      if(location.y<-1){
        location.y=radius;
      }
      velocity.set(velocity.x,-velocity.y);
    }
  }
  
  Boolean checkParticleCollision(Particle other){
    
    Float dist = location.dist(other.location);
    
    if(dist<radius+other.radius){
      
      Float ui = this.velocity.x;
      Float uj = other.velocity.x;          
      this.velocity.x = (other.mass*(uj-ui) + this.mass*ui + other.mass*uj)/( this.mass + other.mass);
      other.velocity.x = (this.mass*(ui-uj) + this.mass*ui + other.mass*uj)/( this.mass + other.mass);
        
      ui = this.velocity.y;
      uj = other.velocity.y;          
      this.velocity.y = (other.mass*(uj-ui) + this.mass*ui + other.mass*uj)/( this.mass + other.mass);
      other.velocity.y = (this.mass*(ui-uj)+ this.mass*ui + other.mass*uj)/( this.mass + other.mass);

      if(location.x<other.location.x-other.radius+0.1){
        location.x-=(1);
      }
      else if(location.x>other.location.x+other.radius-0.1){
        location.x+=(1);
      }
      if(location.y<other.location.y-other.radius+0.1){
        location.y-=(1);
      }
      else if(location.y>other.location.y+other.radius-0.1){
        location.y+=(1);
      }
       return true;
    }
    else{ 
      return false;
    }
  }
}
