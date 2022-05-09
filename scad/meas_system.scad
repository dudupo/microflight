
loadcellpath ="davidponar/workspace/STP-STEP-to-STL-Python-Converter/3DModelsToConvert/Converted-STLs/ULC.STEP.stl";



include <nutsnbolts/materials.scad>;
include <nutsnbolts/cyl_head_bolt.scad>;



module loadcell(x,y,z,ang){
    
    translate([x,y,z]){
        rotate(ang, [0,0,1]){
            
        rotate(-90, [1,0,0]){   
            import(loadcellpath);
         }
    }
    }

}  

d = 300;
height = 200;
for (i = [0:2]){
    loadcell(d*cos(i*2*180/3),d*sin(i*2*180/3),0,0);
}

module set_cylinders(){
for (i = [0:2]){
    translate([d*cos(i*2*180/3),d*sin(i*2*180/3), -height - 30]) {
        cylinder(h=height, r=50);
     }
}
}
translate([0,0,-height - 30]){
    cylinder(h=30, r=400);
}

module hallcyl(r){
    render(){
   difference(){
    cylinder(h=12, r = r);
    cylinder(h=12, r = r -20);
       }
   }
}

module holes(l, cld, h){
for (i = [0:2]){
    translate([(d-10)*cos(i*2*180/3),(d-10)*sin(i*2*180/3),h]){
        hole_through(name="M3", l=l, cld=cld, h=0.0, hcld=1.0);
    }
}
}

module halfcyl(r){
    render(){
        difference(){
            hallcyl(r);
            translate([0,-r,0]){
            cube([2*r,2*r,r], center=true);
            }
        }
    }
}

module quacyl(r){
    
    render(){
      difference() {
        halfcyl(r);
        translate([-r,0,0]){
        cube([2*r,2*r,r], center=true);
     }
  }
}
}

translate([0,0,-d/3+12]) {
    cylinder(h=12, r = 40);
}

difference(){
    translate([0,0,30]){
        hallcyl(d);
    };
    holes(30, 0.25, 45);
}

render(){
    difference(){
        set_cylinders();
        holes(40,4,-30);   
    }
}

for (i = [0:2]){
    rotate(60 + i*2*180/3,[0,0,1])      
         translate([0,0,4*d/3 +10]){
        rotate(-90, [1,0,0]){
            render(){
               difference(){ 
            quacyl(5*d/3);
                   translate([d+10,0,0]){
                   cube([3*d,3*d,d]);
                   }
           //halfcyl();
        }}}
    }
}    





//screw("M4x40", thread="modeled"); // screw M20x100 with thread
//nut("M20", thread="modeled");       // corresponding nut with thread
		    
//screw("M3x12");  




//{

//translate([0,0,30]) {
  //  cylinder(h=5, r=d-10);
//}
//}

//loadcell(0,d,0,0);
//loadcell(-d/2, -d/2,0,0);
