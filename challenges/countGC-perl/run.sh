#! /bin/bash

perl -e 'while(<>){
  chomp; 
  $gc = () = $_ =~ /[GC]/gi; 
  $len = length($_); 
  printf "%.6f\n", $gc/$len if $len > 0}
' < input > out/output.txt
