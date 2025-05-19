#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

typedef enum
{
    INT, FLOAT, DOUBLE
} tag_t;

typedef union
{
    int i;
    float f;
    double d;
} value_t;

typedef struct
{
    tag_t tag;
    value_t value;
} polynumber_t;

polynumber_t create_int(int numbah)
{
    polynumber_t cracker;
    cracker.tag = INT;
    cracker.value.i = numbah;
    return cracker;
}

polynumber_t create_float(float uptop)
{
    polynumber_t georgie;
    georgie.tag = FLOAT;
    georgie.value.f = uptop;
    return georgie;
}

polynumber_t create_double(double trouble)
{
    polynumber_t teamRocket;
    teamRocket.tag = DOUBLE;
    teamRocket.value.d = trouble;
    return teamRocket;
}

polynumber_t negate(polynumber_t positive)
{
    switch(positive.tag)
    {
        case INT:
            return create_int(-positive.value.i);
        case FLOAT:
            return create_float(-positive.value.f);
        case DOUBLE:
            return create_double(-positive.value.d);
        default:
            printf("you done goofed and gave me a fake number, try again");
            exit(EXIT_FAILURE);
    }
}

polynumber_t add(polynumber_t a, polynumber_t b)
{
    assert(a.tag == b.tag && "Mismatched types in add; not good!");
    switch(a.tag)
    {
        case INT:
            return create_int(a.value.i + b.value.i);
        case FLOAT:
            return create_float(a.value.f + b.value.f);
        case DOUBLE:
            return create_double(a.value.d + b.value.d);
        default:
            printf("impossible number to compute");
            exit(EXIT_FAILURE);
    }
}

int main()
{
    polynumber_t poly_int = create_int(42); // SPOILERS: it's the meaning of life
    polynumber_t poly_float = create_float(3.14f); // cutie and pumpkin are just types of pies
    polynumber_t poly_double = create_double(10.987654321); // idk, i got lazy

    printf("Poly int: %d\n", poly_int.value.i);
    printf("Poly float: %.02f\n", poly_float.value.f);
    printf("Poly double: %lf\n\n", poly_double.value.d);
    // negation
    printf("Negation:\n");
    polynumber_t neg_int = negate(poly_int);
    polynumber_t neg_float = negate(poly_float);
    polynumber_t neg_double = negate(poly_double);

    printf("Negated int: %d\n", neg_int.value.i);
    printf("Negated float: %.02f\n", neg_float.value.f);
    printf("Negated double: %lf\n\n", neg_double.value.d);

    //addition
    printf("Addition:\n");
    polynumber_t sum_int = add(poly_int, create_int(86));
    polynumber_t sum_float = add(poly_float, create_float(6.81f));
    polynumber_t sum_double = add(poly_double, create_double(12.3456789));

    printf("Summed int: %d\n", sum_int.value.i);
    printf("Summed float: %.02f\n", sum_float.value.f);
    printf("Summed double: %lf\n", sum_double.value.d);
}