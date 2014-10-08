#creating array
f = File.new("data.csv", "r")
unemployments = f.readlines
f.close

#counting
count = 0
sum = 0
unemployments.each do |unemployment|
	sum = sum + unemployment.split(",")[1].to_f
	count = count + 1
end

#variance
average = sum/count
sum_variance = 0
unemployments.each do |unemployment|
	variant = average - unemployment.split(",")[1].to_f
	variance = variant**2
	sum_variance = sum_variance + variance 
end
#standerd deviation
standered_deviation = (sum_variance/count)**0.5

#zscore
z_scores = []
unemployments.each do |unemployment|
	z = (unemployment.split(",")[1].to_f - average)/standered_deviation
	z_scores.push(z)
end
#puts information
puts "your average is..."
puts average.to_s
puts "your standered_deviation is..."
puts standered_deviation
puts "your zscore is..."
puts z_scores
