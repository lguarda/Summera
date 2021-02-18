function factorial(n) = n == 0 ? 1 : factorial(n - 1) * n;

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
    bernstein_polynomial(len(points)-1, origin, step) * points[origin] + bezier_point(points, step, origin + 1) :
    bernstein_polynomial(len(points)-1, origin, step) * points[origin];

// https://en.wikipedia.org/wiki/B%C3%A9zier_curve#Rational_B%C3%A9zier_curves
function weigted_vec3(vec) = [vec[0], vec[1], vec[2]] * vec[3];

function bezier_calc_point_weight(points, step, origin=0) =
    origin < len(points)-1 ?
    bernstein_polynomial(len(points)-1, origin, step) * weigted_vec3(points[origin]) + bezier_calc_point_weight(points, step, origin + 1) :
    bernstein_polynomial(len(points)-1, origin, step) * weigted_vec3(points[origin]);

function bezier_calc_point_weight_only(points, step, origin=0) =
    origin < len(points)-1 ?
    bernstein_polynomial(len(points)-1, origin, step) * points[origin][3] + bezier_calc_point_weight_only(points, step, origin + 1) :
    bernstein_polynomial(len(points)-1, origin, step) * points[origin][3];

function bezier_weighted_point(point, step) =
    bezier_calc_point_weight(point, step)/bezier_calc_point_weight_only(point, step);

function bezier_list(points, step) =
    [
    for (i=[0:step])
        len(points[0]) > 3
            ? bezier_weighted_point(points, 1/step * i)
            : bezier_point(points, 1/step * i)
    ];

module line(p1, p2, r) {
    hull() {
        translate(p1)
            circle(r=r, $fn=50);
        translate(p2)
            circle(r=r, $fn=50);
    }
}

module polyline(points, r) {
    for ( i = [0 : len(points)-2] ) {
        line(points[i], points[i+1], r);
    }
}

module plot_example_curve() {
    p1=[20, 0, 0, 1];
    p2=[0, 0, 0, 2];
    p3=[0, -50, 0, 1];
    p4=[-20, -40, 0, 1];
    step=50;
    polyline(bezier_list([p1, p2, p3, p4], step));
}
