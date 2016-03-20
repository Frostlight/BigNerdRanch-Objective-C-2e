//
//  main.c
//  BMICalc
//
//  Created by Vincent on 3/20/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#include <stdio.h>
#include <time.h>

// Here is the declaration of the struct Person
typedef struct {
    float heightInMeters;
    int weightInKilos;
} Person;

float bodyMassIndex(Person p) {
    return p.weightInKilos / (p.heightInMeters * p.heightInMeters);
}

int main(int argc, const char * argv[]) {
    Person person;
    person.weightInKilos = 96;
    person.heightInMeters = 1.8;
    printf("person weighs %d kilograms\n", person.weightInKilos);
    printf("person is %.2f meters tall\n", person.heightInMeters);
    
    float bmi = bodyMassIndex(person);
    printf("person has a BMI of %.2f\n", bmi);
    
    long secondsSince1970 = time(NULL);
    printf("It has been %ld seconds since 1970\n", secondsSince1970);
    
    struct tm now;
    localtime_r(&secondsSince1970, &now);
    printf("The time is %d:%d:%d\n", now.tm_hour, now.tm_min, now.tm_sec);
    
    // Find the time 4 million seconds into the future
    long timeFuture = secondsSince1970 + 4000000; // now + 4 million seconds
    struct tm future;
    
    localtime_r(&timeFuture, &future);
    printf("In four million seconds, the date will be %d/%d/%d\n",
           future.tm_mon + 1, future.tm_mday, future.tm_year + 1900);
    // tm_mon = month of year, where January = 0
    // tm_mday = day of month (1-31)
    // year = years since 1900
    
    return 0;
}
