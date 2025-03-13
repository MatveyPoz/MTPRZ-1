#!/bin/bash
use_file=false
if [[ "$1" == "-f" ]]; then
    use_file=true
fi
if $use_file; then
    if [[ -f input.txt ]]; then
    read a b c < input.txt
else
    echo "No such file: input.txt"
    exit 1
fi
else
    echo "Enter coefficients a, b, c:"
    read a b c
fi
echo "Equation ($a)x^2 + ($b)x + ($c)"

sum=$(echo "scale=2; -($b)/$a" | bc)
product=$(echo "scale=2; $c/$a" | bc)

echo "Sum of roots: $sum"
echo "Product of roots: $product"

x1=$(echo "scale=2; ($sum + sqrt($sum^2 - 4*$product))/2" | bc)
x2=$(echo "scale=2; ($sum - sqrt($sum^2 - 4*$product))/2" | bc)

if [[ $x1 == $x2 ]]; then
    echo "Root: x = $x1"
else
    echo "Roots: x1 = $x1, x2 = $x2"
fi
