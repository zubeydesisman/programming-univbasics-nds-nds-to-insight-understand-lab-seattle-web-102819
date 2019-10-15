require 'pry'
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'directors_database'
# Call the method directors_database to retrieve the NDS
require 'pp'
def pretty_print_nds(nds)
  # Change the code below to pretty print the nds with pp
  pp nds
 #binding.pry
end


# def print_first_directors_movie_titles
#   first_director = directors_database[0][:movies]
#   #binding.pry
#     i = 0 
#     while i < first_director.length do
      
#       print first_director[i][:title] + "\n"
#       #binding.pry
#       i += 1 
#   end
# end
 def print_first_directors_movie_titles
   first_director = directors_database[0][:movies]
   for i in first_director do
     print i[:title] + "\n"
   end
 end