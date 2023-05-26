#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Nombre incorrect d'arguments. Utilisation : ./my_calculator.sh nombre1 opérateur nombre2"
    exit 1
fi

num1=$1
operator=$2
num2=$3

case $operator in
    +)
        result=$(echo "$num1 + $num2" | bc)
        echo "Le résultat de $num1 $operator $num2 est : $result"
        ;;
    -)
        result=$(echo "$num1 - $num2" | bc)
        echo "Le résultat de $num1 $operator $num2 est : $result"
        ;;
    /)
        result=$(echo "scale=2; $num1 / $num2" | bc)
        echo "Le résultat de $num1 $operator $num2 est : $result"
        ;;
    *)
        echo "Opérateur invalide. Les opérateurs valides sont : +, - et /"
        exit 1
        ;;
esac

