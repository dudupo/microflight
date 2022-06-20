include <nutsnbolts/materials.scad>;
include <nutsnbolts/cyl_head_bolt.scad>;


cm              = 10               ;
sidelength      = 0.5   * cm       ;
width           = 1     * cm       ;
length          = 10    * cm       ;
delta           = 4     * cm       ;
discenter       = 1.1   * cm       ;
teta            = 80               ;

// -------------------------------------------

cm                  = 10               ;
Base_sidelength     = 30    * cm       ;
Base_height         = 3     * cm       ;
delta               = 4     * cm       ;
discenter           = 1.1   * cm       ;

// -------------------------------------------

cm          =   10                  ;
mm          =   0.1         * cm    ;
radious     =   5           * cm    ;
height      =   8           * cm    ;
ulcfside    =   52.2        * mm    ;
ulcsside    =   21.2        * mm    ;

ulcfsideHead    =   52.2        * mm  + mm   ;
ulcssideHead    =   21.2        * mm  + mm   ;
// ------------------------------------------------------


// cm          =   10;
// mm          =   0.01 * cm;
// radious     =   5   * cm;
// height      =   8   * cm;
// ulcfside    =   3   * cm;
// ulcsside    =   1.5 * cm;




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
