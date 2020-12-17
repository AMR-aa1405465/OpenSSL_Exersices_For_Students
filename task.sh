#!/usr/bin/env bash

check_correctNess(){
  #orignal is $1 ,
  original=`cat $1 2>/dev/null`
  decrypted=`cat $2 2>/dev/null`
  if [ "$original" == "$decrypted" ]; then
    echo "content Valid =)"
  else
    echo "Something bad happened...."
  fi

}




first_subRoutine(){
  echo "Creating File me, me5time and me.key ....."
  echo -n "amraboeleneen666" > "me.txt"
  cat me.txt me.txt me.txt me.txt me.txt > "me5times.txt"

  echo "Generting the key of 16 bytes....."
  openssl rand 16 > "me.key"

  echo "Creating a demo for ECB ......"
  openssl  aes-128-ecb -e -in me5times.txt -nosalt -nopad  -out me5tims.ecb.enc -kfile me.key 2>/dev/null
  openssl  aes-128-ecb -d -in me5tims.ecb.enc -nosalt -nopad -out me5tims_new.txt -kfile me.key 2>/dev/null
  echo "Comparing content of encrypted & decrypted messege using ECB"
  check_correctNess "me5times.txt" "me5tims_new.txt"

  echo -e "--------------------------------------------------------------------\n"

  echo "Creating a demo for CBC"
  openssl  aes-128-cbc -e -in me5times.txt -nosalt -nopad -iv 00000000000000000000000000000000 -out me5tims.cbc.enc -kfile me.key  2>/dev/null
  openssl  aes-128-cbc -d -in me5tims.cbc.enc -nosalt -nopad -iv 00000000000000000000000000000000 -out me5tims_new_cbc.txt -kfile me.key  2>/dev/null
  echo "Comparing content of encrypted & decrypted messege using CBC"
  check_correctNess "me5times.txt" "me5tims_new_cbc.txt"


  echo -e "--------------------------------------------------------------------\n"

  echo "ECB .... Notice same blocks give same results"
  cat me5tims.ecb.enc | xxd

  echo
  echo "CBC .... Notice same blocks does NOT give same results"
  cat me5tims.cbc.enc | xxd




}

second_subRoutine(){
  echo "Decrypting q2.file ->>>> "
  openssl aes-128-cbc -d -in ./q2file.enc -nosalt -nopad  -iv 00000000000000000000000000000000 -out q2file.txt -kfile ./q2.key 2>/dev/null
  echo -n "First line is:  "
  head -n 3 q2.txt
  echo "No pad is needed since 7147280 mod 16 = 0 "
}


third_subRoutine(){
  #openssl speed -seconds 1  -evp  sha256 aes-128-cbc aes-256-cbc rsa2048
  openssl speed -seconds 1  -evp  sha256 aes-128-cbc aes-256-cbc rsa2048 | tee performace_results.txt
  #The calculation is be carried out manually ....

}


forth_subRoutine(){
  echo -e "--------------------------------------------------------\n\n"
#For Using openssl usage with
  #openssl genpkey -algorithm RSA -out private_key.pem -pkeyopt rsa_keygen_bits:2048
  #openssl rsa -pubout -in private_key.pem -out public_key.pem
  #openssl rsautl -encrypt -inkey public_key.pem -pubin -in plaintext.txt -out EncryptedData.encrypted
  #openssl rsautl -decrypt -inkey private_key.pem -in EncryptedData.encrypted -out DecryptedData.txt

  python3 rsa_code.py

}


rm me5tims*


first_subRoutine
second_subRoutine
third_subRoutine
forth_subRoutine
