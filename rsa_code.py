

def invmod(a,b): return 0 if a==0 else 1 if b%a==0 else b - invmod(b%a,a)*b//a



plain_text=10
p=11
q=29
n=p*q
toitent=(p-1) * (q-1)
e=23

private_key = invmod(e,toitent)
#private_key = 207


print("Plain Text .... ",plain_text)
print('Private Key .... ',private_key)



cipher_text=pow(plain_text,e)
cipher_text %= n
print("Cipher Text ..... ",cipher_text)

decrypted_text=pow(cipher_text,private_key)
decrypted_text %= n

print("Decrypted Msg ..... ",decrypted_text)


print(f"p={p}\nq={q}\nn={n}\ntoitent={toitent}\ne={e}\nd={private_key}")
