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
    if [[ ! $a =~ ^[0-9]+$ ]] || [[ ! $b =~ ^[0-9]+$ ]] || [[ ! $c =~ ^[0-9]+$ ]] || [[ $a = 0 ]]; then
        echo "input.txt: wrong format or a = 0"
        exit 1
    fi
else
    while true; do
        echo "Enter coefficients a, b, c:"
        read a b c
        if [[ $a =~ ^[0-9]+$ ]] && [[ $b =~ ^[0-9]+$ ]] && [[ $c =~ ^[0-9]+$ ]] && [[ ! $a = 0 ]]; then
            break
        else
            echo "Invalid input or a = 0"
        fi
    done
fi

d=$(echo "$b*$b-4*$a*$c" | bc -l)

if (( $(echo "$d < 0" | bc -l) )); then
    echo "No real roots"
elif (( $(echo "$d == 0" | bc -l) )); then
    x=$(echo "scale=2; -$b/(2*$a)" | bc -l)
    echo "One (or two equal) roots: x = $x"
else
    x1=$(echo "scale=2; (-$b+sqrt($d))/(2*$a)" | bc -l)
    x2=$(echo "scale=2; (-$b-sqrt($d))/(2*$a)" | bc -l)
    echo "Two roots: x1 = $x1, x2 = $x2"
fi
