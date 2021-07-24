def main()
  puts "Welcome to Vigenère cipher encoder!"
  puts "-" * 60
  puts "[1]. Encrypt text\n[2]. Exit"
  choice = gets.chomp
  if choice == "1"
    puts "Text to be encrypted"
    usr_txt = gets.chomp
    puts "-" * 60
    puts "Key to encrypt the text"
    usr_key = gets.chomp
    def encrypt(txt, key)
      key_len = key.length
      key_int = []
      key.each_char do |i|
        char_code = i.ord
        key_int.push(char_code)
      end
      txt_int = []
      txt.each_char do |j|
        char_code = j.ord
        txt_int.push(char_code)
      end 
      result = ""
      r = txt_int.length
      r.times do |b|
        add = key_int[b % key_len]
        value = ((txt_int[b] - 32 + add) % 95)
        result += (value + 32).chr
      end
      puts "-" * 60
      puts "Final text: #{result}"
      main()
    end
    encrypt(usr_txt, usr_key)
  elsif choice == "2"
    exit
  else
    puts "Invalid choice"
    main()
  end
end
main()