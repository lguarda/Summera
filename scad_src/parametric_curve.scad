function factorial(n) = n == 0 ? 1 : factorial(n - 1) * n;

function vec_min_one(vec) =
    [
    for (i=[0:len(vec)-2])
        vec[i]
    ];

// https://en.wikipedia.org/wiki/Binomial_coefficient
// n! / (k! ((n-k)!))
function binomial_coefficient_full(n, k) = factorial(n) / (factorial(k) * factorial(n -k ));
precomputed_binomial_coef = [
[1],
[1, 1],
[1, 2, 1],
[1, 3, 3, 1],
[1, 4, 6, 4, 1],
[1, 5, 10, 10, 5, 1],
[1, 6, 15, 20, 15, 6, 1],
[1, 7, 21, 35, 35, 21, 7, 1],
];
function binomial_coefficient(n, k) =
    n < len(precomputed_binomial_coef) ?
    precomputed_binomial_coef[n][k] :
    binomial_coefficient_full(n, k);

// https://en.wikipedia.org/wiki/Bernstein_polynomial
function bernstein_polynomial(n,k,t) = binomial_coefficient(n,k) * pow(t, k) * pow(1-t, n-k);

// https://en.wikipedia.org/wiki/B%C3%A9zier_curve#Explicit_definition
function bezier_point(points, step, origin=0) =
    origin < len(points)-1 ?
    bernstein_polynomial(len(points)-1, origin, step) * vec_min_one(points[origin]) + bezier_point(points, step, origin + 1) :
    bernstein_polynomial(len(points)-1, origin, step) * vec_min_one(points[origin]);

// https://en.wikipedia.org/wiki/B%C3%A9zier_curve#Rational_B%C3%A9zier_curves
function weigted_vec(vec) = vec_min_one(vec) * vec[len(vec)-1];

function bezier_calc_point_weight(points, step, origin=0) =
    origin < len(points)-1 ?
    bernstein_polynomial(len(points)-1, origin, step) * weigted_vec(points[origin]) + bezier_calc_point_weight(points, step, origin + 1) :
    bernstein_polynomial(len(points)-1, origin, step) * weigted_vec(points[origin]);

function bezier_calc_point_weight_only(points, step, origin=0) =
    origin < len(points)-1 ?
    bernstein_polynomial(len(points)-1, origin, step) * points[origin][len(points[origin])-1] + bezier_calc_point_weight_only(points, step, origin + 1) :
    bernstein_polynomial(len(points)-1, origin, step) * points[origin][len(points[origin])-1];

function bezier_weighted_point(point, step) =
    bezier_calc_point_weight(point, step)/bezier_calc_point_weight_only(point, step);


function bezier_list(points, step) =
    [
    for (i=[0:step])
        bezier_weighted_point(points, 1/step * i)
        /*len(points[0]) > 3*/
            /*? bezier_weighted_point(points, 1/step * i)*/
            /*: bezier_point(points, 1/step * i)*/
            /*for summera*/
        /*bezier_point(points, 1/step * i)*/
    ];

module line(p1, p2, r) {
    hull() {
        translate(p1)
            circle(r=r, $fn=50);
        translate(p2)
            circle(r=r, $fn=50);
    }
}

module line_sphere(p1, p2, r) {
    hull() {
        translate(p1)
            sphere(r=r, $fn=50);
        translate(p2)
            sphere(r=r, $fn=50);
    }
}

module line_cylinder(p1, p2, r) {
    hull() {
        translate(p1)
            cylinder(r=r, h=1, $fn=50);
        translate(p2)
            cylinder(r=r, h=1, $fn=50);
    }
}

module cyle(p1, p2, r1, r2) {
    hull() {
        translate(p1) {
            cylinder(r=r1, h=0.1);
            /*sphere(r=r1, h=0.1);*/
        }
        translate(p2) {
            cylinder(r=r2, h=0.1);
            /*sphere(r=r2, h=0.1);*/
        }
    }
}

function vec_to_3(vec) = [vec[0], vec[1], vec[2]];

module polyline(points, r) {
    for ( i = [0 : len(points)-2] ) {
        line(points[i], points[i+1], r);
    }
}

module polycylinder(points, diams) {
    for ( i = [0 : len(points)-2] ) {
        cyle(points[i], points[i+1], diams[i], diams[i+1]);
    }
}
module cylinder_bezier_list(points_diams) {
    polycylinder(bezier_list(points[0]), bezier_list(points[1]));
}

module polycyle(points) {
    for ( i = [0 : len(points)-2] ) {
        cyle(vec_to_3(points[i]), vec_to_3(points[i+1]), points[i][3], points[i+1][3]);
    }
}

module polycyle_multi(multi) {
    for ( i = [0 : len(multi[0])-2] ) {
        hull() {
            for ( j = [0 : len(multi)-1] ) {
                echo(multi[j][i]);
                cyle(vec_to_3(multi[j][i]), vec_to_3(multi[j][i+1]), multi[j][i][3], multi[j][i+1][3]);
            }
        }
    }
}

module plot_example_curve() {
    //with [x,y,x weigt]
    // for poly cycle i was fucked up it's
    // [x,y,z, diameter] and ther's no control on weight
    /*p1=[20, 0, 0, 10, 1];*/
    /*p2=[0, 0, 0, 2, 3];*/
    /*p3=[0, -50, 10, 10, 3];*/
    /*p4=[-20, -40, 0, 10, 1];*/
    /*step=50;*/
    /*color([1,0,0]) {*/
    /*polycyle(bezier_list([p1, p2, p3], step));*/
    /*[>polycyle(bezier_list([p1, p2, p3, p4], step));<]*/
    /*}*/
    /*echo(bezier_list([p1, p2, p3, p4], 3));*/
    /*echo(bezier_list([p1, p2, p3], 3));*/

    //forget the past this is the new method
    p1=[[20, 0, 0, 10], [1, 1]];
    p2=[[0, 0, 0, 2], [3, 1]];
    p3=[[0, -50, 10, 10], [3, 1]];
    p4=[[-20, -40, 0, 10], [1, 1]];

    cylinder_bezier_list([p1,p2,p3,p4], 3);
}

function quadric_bezier(t, p0, p1 ,p2) = (1-t)^2 * p0 + 2*(1-t) * t * p1 + t^2*p2;

function quadric_bezier_list(step, p0, p1 , p2) =
    [
    for (i=[0:step])
        quadric_bezier(1/step*i, p0, p1, p2)
    ];

module quadric_bezier_curve(step, p0, p1, p2) {
    points = quadric_bezier_list(step, p0, p1, p2);
    polycyle(points);
    /*echo(len(points));*/
    /*for ( i = [0 : len(points)-2] ) {*/
        /*poly(points[i], points[i+1], 1);*/
    /*}*/
}

// the purpose of this module is to create curve that passes through 3 point
module dual_quadric_bezier_curve(step, p1, p2, p3, f, a) {
    p2_m1 = -([cos(a),sin(a), 0,0] * f);
    p2_m2 = ([cos(a),sin(a), 0,0] * f);
    if (DEBUG_CURVE != undef) {
        translate(vec_to_3(p2+p2_m1))
        sphere(r=1);
        translate(vec_to_3(p2+p2_m2))
        sphere(r=1);
        translate(vec_to_3(p2))
        sphere(r=1);
    }
    quadric_bezier_curve(step, p1, p2 + p2_m1, p2);
    quadric_bezier_curve(step, p2, p2 + p2_m2, p3);
}

module example_linked_quadric() {
    p1=[20,0,0];
    p2=[0,20,0];
    p3=[20,20,0];

    color([1,0,0]) {
        dual_quadric_bezier_curve(15, p1, p2, p3, 10, 90);
    }
}

module example_simple_quadric() {
    p1=[20,0,0];
    p2=[0,20,10];
    p3=[20,20,0];

    quadric_bezier_curve(15, p1, p2, p3);
}
step=10;
p1=[20,0,0,2, 1];
p2=[0,20,0,2, 1];
p3=[20,20,0,2, 1];

plist = bezier_list([p1, p2, p3], step);

for (i=[0:len(plist)-1]) {
    translate(vec_to_3(plist[i]))
    sphere(r=1);
}
polycyle_multi([plist]);
plot_example_curve();
