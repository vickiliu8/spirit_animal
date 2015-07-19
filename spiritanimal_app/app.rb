require "sinatra"

get "/" do
	@rand_num = rand(8)
	erb :home
end

get "/match/:match_num/:avoid_num" do |match, avoid|

	animals = [
   	 	{:description => "blah", :image => "blah", :name => "Giraffe"},
		{:description => "blah", :image => "blah", :name => "Sponge"},
		{:description => "blah", :image => "blah", :name => "Oprah"},
		{:description => "blah", :image => "blah", :name => "Pissing Ostrich"},
		{:description => "blah", :image => "blah", :name => "Angry Baboon"},
		{:description => "blah", :image => "blah", :name => "Derpy Penguin"},
		{:description => "blah", :image => "blah", :name => "Beefcake"},
		{:description => "blah", :image => "blah", :name => "Quokka"}
	]

	@match_name = animals[match.to_i][:name]
	@avoid_name = animals[avoid.to_i][:name]
	erb :match_index
end


get "/animal/:index" do |index|


animals = [
	{:description => "blah", :image => "blah", :name => "Giraffe"},
	{:description => "blah", :image => "blah", :name => "Sponge"},
	{:description => "blah", :image => "blah", :name => "Oprah"},
	{:description => "blah", :image => "blah", :name => "Pissing Ostrich"},
	{:description => "blah", :image => "blah", :name => "Angry Baboon"},
	{:description => "blah", :image => "blah", :name => "Derpy Penguin"},
	{:description => "blah", :image => "blah", :name => "Beefcake"},
	{:description => "blah", :image => "blah", :name => "Quokka"}

	
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