def encode(plaintext, key)
  # exclusive vs inclusive dots!
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  #p cipher
  ciphertext_chars = plaintext.chars.map do |char|
    #p 'cipher.find_index(char)'
    #p cipher.find_index(char)
    #p cipher
    #p char
    (65 + cipher.find_index(char)).chr
  end
  return ciphertext_chars.join
end

def decode(ciphertext, key)
  # and here
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  #p cipher
  #p ciphertext.chars.map
  plaintext_chars = ciphertext.chars.map do |char|
    #p char.ord
    cipher[char.ord - 65]
    #p cipher[64 - char.ord]
    #p cipher[4]
    #exit
  end
  return plaintext_chars.join
end

puts encode("theswiftfoxjumpedoverthelazydog", "secretkey")
puts decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# Intended output:
#
# > encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
#
# > decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# => "theswiftfoxjumpedoverthelazydog"