#!/bin/bash
echo "Digite um número:"
read num

if [ $num -gt 10 ]; then
    echo "O número é maior que 10."
else
    echo "O número é menor ou igual a 10."
fi