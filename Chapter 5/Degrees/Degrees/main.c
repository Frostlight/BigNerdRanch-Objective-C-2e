//
//  main.c
//  Degrees
//
//  Created by Vincent on 3/8/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

// Last temperature converted, in Celsius
static float lastTemperature = 0;

float fahrenheitFromCelsius(float celsius) {
    lastTemperature = celsius;
    float fahrenheit = celsius * 1.8 + 32.0;
    printf("%f Celsius is %f Fahrenheit\n", celsius, fahrenheit);
    return fahrenheit;
}

int main(int argc, const char * argv[]) {
    float freezingTempCelsius = 0;
    float freezingTempFahrenheit = fahrenheitFromCelsius(freezingTempCelsius);
    printf("Water freezes at %f degrees Fahrenheit\n", freezingTempFahrenheit);
    printf("The last temperature converted was %f\n", lastTemperature);
    return EXIT_SUCCESS;
}
