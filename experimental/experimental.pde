ArrayList<Particle> particles=new ArrayList<Particle>();

 // short and quick definition


 

Particle player;
void setup() {
  noStroke();
  size(1080,720);
  background(111);
  strokeWeight(1);
  
  player=new Particle (width/2, height/2);
  player.ballColor=color(0,255,100);
  player.useGravity=false;
  player.radius=20;
  particles.add(player);
}
 

void draw() {
  player.location=new PVector(mouseX,mouseY);
  background(0);
  if(random(0,100)>60){
    Particle ball=new Particle (width/2+(random(-20,20)*20), height/2+(random(-20,20)*20));
    ball.velocity=new PVector(random(-1.1,1.1),random(-1.5,1.5));
    ball.lifeTime=255;
    particles.add(ball);
  }
  
  for(int j=0;j<particles.size();j++){
      if(player!=particles.get(j)){
          player.checkParticleCollision(particles.get(j));
        }
        
      }
  
  
  for(int i=0;i<particles.size();i++){
    particles.get(i).display() ;
    if(particles.get(i).useGravity)
      particles.get(i).addForce(World.gravity);
      
      
    //println(particles.get(i).velocity);
    if(particles.get(i)!=player){
    for(int j=0;j<particles.size();j++){
      if(i!=j){
        particles.get(i).checkParticleCollision(particles.get(j));
        }
        
      }
    }
      
        if(particles.get(i).lifeTime<=0&&particles.get(i).lifeTime>-1){
          particles.remove(i);
    }
  }
  
}
