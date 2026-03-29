from Crypto.Cipher import AES

import hashlib
import os

key = bytes.fromhex('df29e8c9c187be77813476499c4bfcfe')

with open('best.onnx', 'rb') as f:
    plaintext = f.read()

hash_val = hashlib.sha256(plaintext).hexdigest().upper()
print(f'Expected hash: {hash_val}')
print(f'File size: {len(plaintext)} bytes')
print(f'max_blocks: {(len(plaintext) + 15) // 16}')

#PKCS7 pad to multiple of 16 bytes
pad_len = 16 - (len(plaintext) % 16)
plaintext_padded = plaintext + bytes([pad_len] * pad_len)

#Encrypt AES-128 ECB
cipher = AES.new(key, AES.MODE_ECB)
ciphertext = cipher.encrypt(plaintext_padded)

#Save encrypted file to put on SD card
with open('best_encrypted.bin', 'wb') as f:
    f.write(ciphertext)

print(f'Encrypted file saved as best_encrypted.bin')
