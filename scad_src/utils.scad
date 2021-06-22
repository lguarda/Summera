module part(name) {
    echo(PART);
    if (PART == undef || PART == name) {
        children([0 : $children -1]);
    }
    else {
        %children([0 : $children -1]);
    }
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

module trans() {
    %children();
}

module hash() {
    #children();
}

module fidt() {
    children(0);
    difference() {
        trans()
        children(1);
        hash()
        children(0);
   }
}

module fid() {
    difference() {
        children(1);
        children(0);
   }
}

module dif() {
    difference() {
        children(0);
        children(1);
   }
}

module dift() {
    children(1);
    difference() {
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
    children(0);
    mirror([1,0,0]) {
        children(0);
   }
}

module miry() {
    children(0);
    mirror([0,1,0]) {
        children(0);
   }
}

module mirz() {
    children(0);
    mirror([0,0,1]) {
        children(0);
   }
}
