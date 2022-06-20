include <nutsnbolts/materials.scad>;
include <nutsnbolts/cyl_head_bolt.scad>;

module blabla(){
    cube([10,10,10], center = true);

}


module rotation_sym(r, N, z, rot) {
     for (i = [0:N-1]) {
        rotate(  - rot* i*2*180/(N), [0,0,1] ) {
            translate([r*cos(i*2*180/(N)),r*sin(i*2*180/N),z]) {
                children();
            }
        }
    }
}
