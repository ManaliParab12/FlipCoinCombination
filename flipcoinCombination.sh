#!/bin/bash -x

declare -A flip_coin

echo "Welcome to Flip Coin Combination"
read -p "Enter the number of flip : " n

function s () {

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

function d () {
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
   esac
done
echo "Percentage of HH $((${flip_coin[HH]} * 100 / $n))"
echo "Percentage of HT $((${flip_coin[HT]} * 100 / $n))"
echo "Percentage of TH $((${flip_coin[TH]} * 100 / $n))"
echo "Percentage of TT $((${flip_coin[TT]} * 100 / $n))"
}
s
d

