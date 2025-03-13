#!/bin/bash

echo "Enter coefficients a, b and c: "
read a b c

d=$(echo "$b * $b - 4 * $a * $c" | bc -l)

if (( $(echo "$d < 0" | bc -l) )); then
    echo "No real roots"
elif (( $(echo "$d == 0" | bc -l) )); then
    x=$(echo "- $b / (2 * $a)" | bc -l)
    echo "One (or two equal) roots: x = $x"
else
    x1=$(echo "(- $b + sqrt($d)) / (2 * $a)" | bc -l)
    x2=$(echo "(- $b - sqrt($d)) / (2 * $a)" | bc -l)
    echo "Two roots: x1 = $x1, x2 = $x2"
fi
