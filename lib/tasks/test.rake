namespace :test do

	desc "to print something"
	task :print, [:a, :b] => :environment do |t, args|

		a = args[:a] || "something"
		b = args[:b] || "something"
		# Product.all.each do |p|
		# 	puts p.price
		# end

		puts a
		puts b


	end

	task :second => :environment do
		puts "My second task"
	end
end