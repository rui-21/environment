puts "計算をはじめます"
puts "何回計算を繰り返しますか？"
number = gets.to_i
for n in 1..number do
  puts "#{n}回目の計算"
  puts "2つの値を入力してください"
  a = gets.to_i
  b = gets.to_i
  puts "a+b=#{a+b}"
  puts "a-b=#{a-b}"
  puts "a*b=#{a*b}"
  puts "a/b=#{a/b}"
end
puts "計算を終了します"