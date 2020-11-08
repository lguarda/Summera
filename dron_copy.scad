include<utils.scad>
include<hexagone.scad>

/*dif() {*/
    rotate([180,0,0])
        dif() {
            import("/home/leo/Downloads/164_Bottom_Frame.stl");
            mv(0,0,12) {
                cube([600,600,11.99], center=true);
            }
        }

    /*union() {*/
        /*mv(100-38/4, -145, -5)*/
            /*cube([20,20,3]);*/

        /*mv(100-38/4, -65, -5)*/
            /*cube([20,20,3]);*/

        /*mv(100-4, -135, -5)*/
            /*cube([8,90,3]);*/
    /*}*/
/*}*/
