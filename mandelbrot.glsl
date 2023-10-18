const int maxIterations = 69;

// https://arukiap.github.io/fractals/2019/06/02/rendering-the-mandelbrot-set-with-shaders.html
vec2 squareImaginary(vec2 number) {
    return vec2(pow(number.x, 2.0) - pow(number.y, 2.0), 2.0 * number.x * number.y);
}

float iterateMandelbrot(vec2 coord) {
    vec2 z = vec2(0,0);
    for (int i = 0; i < maxIterations; i++) {
        z = squareImaginary(z) + coord;
        if (length(z) > 2.0) {
            return float(i / maxIterations); // proportion of how many iterations "succeeded"
        }
    }
    return float(maxIterations);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    float color = iterateMandelbrot(fragCoord);
    fragColor = vec4(color, color, color, color);
}
