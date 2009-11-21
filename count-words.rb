# My first date with Ruby :)
#
# Author : sudar <http://sudarmuthu.com>
# Licence: GPL
#
# Prints the number of words (with their count) present in a given text file.
#
# Tested only in Windows :)
#

# The actual count function
def count_words (stream)
  word_list = {}
  while (line = stream.gets)
    line.split(' ').each do |word|
      word = remove_punctuation(word.downcase.strip)
      if word_list[word].nil?
        word_list[word] = 1
      else
        word_list[word] = word_list[word] + 1
      end
    end
  end
  word_list
end

# Remove punctuation
def remove_punctuation(word)
  word.gsub(/([,.\'\"\-#])/, '')
end

print "Enter input file: "
filename = gets.strip
print "Enter output file: "
rankfile = gets.strip

begin
  word_list = count_words(File.open(filename, 'r'))

  outputfile = File.open(rankfile, "a")
  outputfile.write "\n\nTotal Words #{word_list.length}"

  #Sort the hash and print
  word_list.sort{|a,b| b[1]<=>a[1]}.each do |count|
    outputfile.write "#{count[0]}\t#{count[1]} \n"
    #uncomment the below line to print the result in console
    #puts "#{count[0]}, #{count[1]}"
  end

  outputfile.close
rescue => err
  puts "Exception: #{err}"
  err
end