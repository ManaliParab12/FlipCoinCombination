#!/bin/bash -x

declare -A flip_coin

echo "Welcome to Flip Coin Combination"
H=0
T=0
read -p "Enter the number of flip : " n

for (( i=0; i<n; i++ ))
do
   single=$((RANDOM%2))

   if [ $single -eq 1 ]
   then
       flip_coin[H]="$((flip_coin[H]+1))"
   else
       flip_coin[T]="$((flip_coin[T]+1))"
   fi
done

HPercent=`echo $((${flip_coin[H]} * 100 / $n))`
TPercent=`echo $((${flip_coin[T]} * 100 / $n))`

echo "Percentage of Head " $HPercent
echo "Percentage of Tail" $TPercent
