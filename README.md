# Objective:
Explore using OpenSSL to perform some cryptographic tasks and understand RSA.

# Description:
This is assignment is to be submitted by individual students (no teams.
In some questions of this homework, you will need to download and install OpenSSL, which is a
popular open source library and an accompanying standalone application that implements many
cryptographic operations and algorithms. If you write your own software, you can use the library. In
this homework, it will be sufficient to use the standalone application only.
The free OpenSSL software is available for various operating system platforms. After installing
OpenSSL, you can make sure that it is installed properly by checking the version, on the command line
by running the following command:
```$ openssl version OpenSSL 1.1.1h 22 Sep 2020```
OpenSSL supports many different operations. Run ```man openssl``` or the OpenSSL ```help```
command to see the manual, which lists the operations. You can also use this command to get help on
a particular command (e.g., the enc command that you will be using in this assignment). You can also
find online manual pages describing the OpenSSL commands at
[Openssl Offical documents](https://www.openssl.org/docs/man1.1.1/) (assuming you are using OpenSSL version 1.1.1).


# Exersice 1: 
Create two plaintext files:
1. me.txt: a text file containing the first 16 characters of your first and last names (concatenate
it with your email address if your name is less than 16 characters long). The length of the file
should be exactly 16 bytes and must not have any newline characters.
2. me5times.txt: a text file with the same content as me.txt but repeated 5 times. The file
should exactly be 80 bytes long and should not have any newline characters.
3. me.key: a file containing a random key to be used for 128-bit AES. The file should contain 16
bytes for the key. Use the OpenSSL rand command to generate this key.
## Hints:
* Make sure to remove all special and newline characters and byte order marks (BOM) placed by
text editors at the beginning/end of the file. You can use a hex editor to do so. Check the files
sizes before running your commands.
* Use IV value of 0 (i.e., use the command option –iv 00000000000000000000000000000000)
whenever IV is needed.
* Do not use padding or salting


## Run commands to perform the following steps:
* Encrypt the file me5times.txt using ECB and generate the ciphertext in file me5timsecb.enc using the key you generated in file me.key
* Encrypt the file me5times.txt using CBC and generate the ciphertext in file me5timscbc.enc using the key you generated in file me.key
* Decrypt the encrypted files and make sure that you are getting the correct plaintext
* Inspect the ECB and CBC ciphertexts using a hex editor and record/explain any special
observations.




# Question 2: 
Decrypt the given file q2file.enc using the key provided in q2.key into an output file called
q2file.txt. Inspect the output file and give the first line of the plaintext file. The cipher used
AEC-128-CBC with no salt. You should figure out on your own if I should be using padding or not



# Question 3: 
Open SSL has a speed command that can measure the performance of different crypto algorithms.
Use this commands to report the performance bandwidth (measured in Mbits/sec) for the following
cryptographic algorithms:
* SHA256
* AES-128-CBC
* AES-256-CBC
* RSA2048 (sign with private key)
* RSA2048 (verify with public key)
Notice that RSA2048 has a comparable level of security to AES128


# Question 4: 
In this exercise, you will manually design and use RSA parameters to encrypt the value 10. You
should select two prime numbers p and q having values between 10 and 40 and then perform the
following steps:
1. Generate a public key (e,n)
2. Generate the private key d
3. Encrypt the value 10
4. Decrypt the cipher text and verify that it will give you back 10.




# Soloutions :
* Soloutions are provided in the code part 
* Walkthrought video is presented in [here](https://www.youtube.com/watch?v=S4h5TPdeQVE)

# Credits :
Dr. Qutaibah Malluhi , Qatar University 
