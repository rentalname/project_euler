<<~NOTE
  Problem 22 Names scores

    Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

    For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

    What is the total of all the name scores in the file?

NOTE

def name_score(name)
  name.each_char.inject(0){|m, n| m += (n.ord - 64)}
end

str = File.open('022_p1.txt').read

sort_list = str.gsub(/\"/,'').split(',').map(&:strip).sort

answer = 0
sort_list.each.with_index(1) do |name, idx|
  ans += (name_score(name) * idx)
end

puts "A. #{answer}"
