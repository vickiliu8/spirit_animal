require "sinatra"

get "/" do
	@rand_num = rand(8)
	erb :home
end

get "/match/:match_num/:avoid_num" do |match, avoid|

	animals = [
   	 	{:description => "Freakishly tall.", :image => "giraffe.jpg", :name => "Giraffe"},
		{:description => "You're ready.", :image => "sponge.jpg", :name => "Sponge"},
		{:description => "\#Illuminati", :image => "oprah.jpg", :name => "Oprah"},
		{:description => "You are an enigma.  So majestic and yet so disgusting.", :image => "ostrich.jpg", :name => "Pissing Ostrich"},
		{:description => "Whoa dude.  Chill out.  Maybe you should see a therapist or something for your anger issues.", :image => "baboon.jpg", :name => "Angry Baboon"},
		{:description => "You're the kinda dude who gets knocked down by a wave and pops right back up.", :image => "penguin.jpg", :name => "Derpy Penguin"},
		{:description => "*various catcalling noises*  You definitely know how to work your assets.", :image => "beefcake.jpg", :name => "Beefcake"},
		{:description => "Always happy.  Like, maybe a little too happy.", :image => "quokka.jpg", :name => "Quokka"}
	]

	@match_name = animals[match.to_i][:name]
	@avoid_name = animals[avoid.to_i][:name]
	@match_pic = animals[match.to_i][:image]
	@avoid_pic = animals[avoid.to_i][:image]
	erb :match_index
end


get "/animal/:index" do |index|


animals = [
   	 	{:description => "Freakishly tall.", :image => "giraffe.jpg", :name => "Giraffe"},
		{:description => "You're ready.", :image => "sponge.jpg", :name => "Sponge"},
		{:description => "\#Illuminati", :image => "oprah.jpg", :name => "Oprah"},
		{:description => "You are an enigma.  So majestic and yet so disgusting.", :image => "ostrich.jpg", :name => "Pissing Ostrich"},
		{:description => "Whoa dude.  Chill out.  Maybe you should see a therapist or something for your anger issues.", :image => "baboon.jpg", :name => "Angry Baboon"},
		{:description => "You're the kinda dude who gets knocked down by a wave and pops right back up.", :image => "penguin.jpg", :name => "Derpy Penguin"},
		{:description => "*various catcalling noises*  You definitely know how to work your assets.", :image => "beefcake.jpg", :name => "Beefcake"},
		{:description => "Always happy.  Like, maybe a little too happy.", :image => "quokka.jpg", :name => "Quokka"}
	]
@match_num = rand(8)
@avoid_num = rand(8)

while @match_num == index.to_i 
	@match_num = rand(8)

end

while (@avoid_num == @match_num || @avoid_num == index.to_i)
	@avoid_num = rand(8)
end

@name = animals[index.to_i][:name] #to_i
@description = animals[index.to_i][:description]
@image = animals[index.to_i][:image]

erb :animal_index
end