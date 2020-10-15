#!/bin/bash

declare -A flip_coin

echo "Welcome to Flip Coin Combination"
read -p "Enter the number of flip : " n

function Singlet () {

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
echo "Percentage of H $((${flip_coin[H]} * 100 / $n))"
echo "Percentage of T $((${flip_coin[T]} * 100 / $n))"
}

function Doublet () {
for (( i=0; i<n; i++ ))
do
   double=$((RANDOM%4))
   case $double in
               0) flip_coin[HH]="$((flip_coin[HH]+1))"
                       ;;
               1) flip_coin[HT]="$((flip_coin[HT]+1))"
                       ;;
               2) flip_coin[TH]="$((flip_coin[TH]+1))"
                       ;;
               3) flip_coin[TT]="$((flip_coin[TT]+1))"
                       ;;
               *) echo "Something went wrong"
                       ;;
   esac
done
echo "Percentage of HH $((${flip_coin[HH]} * 100 / $n))"
echo "Percentage of HT $((${flip_coin[HT]} * 100 / $n))"
echo "Percentage of TH $((${flip_coin[TH]} * 100 / $n))"
echo "Percentage of TT $((${flip_coin[TT]} * 100 / $n))"
}

function Triplet () {
for (( i=0; i<n; i++ ))
do
   triple=$((RANDOM%8));
   case $triple in
               0) flip_coin[HHH]="$((flip_coin[HHH]+1))"
                       ;;
               1) flip_coin[HHT]="$((flip_coin[HHT]+1))"
                       ;;
               2) flip_coin[HTH]="$((flip_coin[HTH]+1))"
                       ;;
               3) flip_coin[THH]="$((flip_coin[THH]+1))"
                       ;;
               4) flip_coin[HTT]="$((flip_coin[HTT]+1))"
                       ;;
               5) flip_coin[THT]="$((flip_coin[THT]+1))"
                       ;;
               6) flip_coin[TTH]="$((flip_coin[TTH]+1))"
                       ;;
               7) flip_coin[TTT]="$((flip_coin[TTT]+1))"
                       ;;
               *) echo "Something went wrong"
                       ;;
   esac
done
echo "Percentage of HHH $((${flip_coin[HHH]} * 100 / $n))"
echo "Percentage of HHT $((${flip_coin[HHT]} * 100 / $n))"
echo "Percentage of HTH $((${flip_coin[HTH]} * 100 / $n))"
echo "Percentage of THH $((${flip_coin[THH]} * 100 / $n))"
echo "Percentage of HTT $((${flip_coin[HTT]} * 100 / $n))"
echo "Percentage of THT $((${flip_coin[THT]} * 100 / $n))"
echo "Percentage of TTH $((${flip_coin[TTH]} * 100 / $n))"
echo "Percentage of TTT $((${flip_coin[TTT]} * 100 / $n))"
}
Singlet
Doublet
Triplet
echo "${flip_coin[@]}"
echo "${!flip_coin[@]}"

lose=`echo ${flip_coin[H]}`
win=`echo ${flip_coin[H]}`

for i in ${flip_coin[@]}
do
   if [[ $i -gt $win ]]
then
    win=$i
   fi
done

echo "Winning Combination" $win
