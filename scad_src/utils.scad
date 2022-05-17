module part(name) {
    echo(len(search(name, PART)));
    if (PART == undef || PART == name) {
        children([0 : $children -1]);
    }
    else {
        if (PART_ONLY == undef) {
            %children([0 : $children -1]);
        }
    }
}

module partno(name, r=0,g=1,b=1) {
    if (PART_ONLY == undef) {
        color([r,g,b]) {
            if (PART == undef || PART == name) {
                %children([0 : $children -1]);
            }
            else {
                %children([0 : $children -1]);
            }
        }
    }
}

module kube(x,y,z) {
    cube([x,y,z], center=true);
}

module mv(x, y, z) {
    translate([x,y,z]) {
        children([0 : $children -1]);

   }
}

module rot(x, y, z) {
    rotate([x,y,z]) {
        children([0 : $children -1]);
   }
}

module rez(x, y, z) {
    scale([x,y,z]) {
        children([0 : $children]);
   }
}

module co(r,g,b) {
    color([r,g,b]) {
        children([0 : $children]);
   }
}

module trans() {
    %children();
}

module hash() {
    #children();
}

module fidt() {
    children(0);
    render(convexity = 2) difference() {
        trans()
        children(1);
        hash()
        children(0);
   }
}

module fid() {
    render(convexity = 2) difference() {
        children(1);
        children(0);
   }
}

module int() {
    render(convexity = 2) intersection() {
        children(0);
        children(1);
   }
}

module dif() {
    render(convexity = 2) difference() {
        children(0);
        children(1);
   }
}

module dift() {
    children(1);
    render(convexity = 2) difference() {
        trans()
        children(0);
        hash()
        children(1);
   }
}

module mirrot(x, y ,z) {
    children(0);
    rotate([x, y, z]) {
        children(0);
    }
}

module mirx() {
    children([0:$children-1]);
    mirror([1,0,0]) {
        children([0:$children-1]);
   }
}

module miry() {
    children([0:$children-1]);
    mirror([0,1,0]) {
        children([0:$children-1]);
   }
}

module mxm(dist) {
    mirx() mv(dist,0,0)
    children([0:$children-1]);
}

module mym(dist) {
    miry() mv(0,dist,0)
    children([0:$children-1]);
}

module mirz() {
    children([0:$children-1]);
    mirror([0,0,1]) {
        children([0:$children-1]);
   }
}

module dif3() {
    dif() {
        dif() {
            children(0);
            children(1);
        }
        children(2);
    }
}

module dif4() {
    dif() {
        dif3() {
            children(0);
            children(1);
            children(2);
        }
        children(3);
    }
}

function inch_mm(x) = x*25.4;

function mm_inch(x) = x/25.4;
