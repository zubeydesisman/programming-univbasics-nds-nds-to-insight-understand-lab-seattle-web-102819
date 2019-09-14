require 'spec_helper'
require 'pp'

describe 'Directors Database' do
  it 'Pretty prints directors_database' do
    expect { pretty_print_nds }.not_to output(directors_database).to_stdout
    expect { pretty_print_nds }.to output(pretty_print_nds).to_stdout
  end

  it 'Iterates over Spielberg’s movies and prints out their names' do
    expect { print_first_directores_movie_title }.to output("\"Jaws\"\n\"Close Encounters of the Third Kind\"\n\"Raiders of the Lost Ark\"\n\"E.T. the Extra-terrestrial\"\n\"Schindler's List\"\n\"Lincoln\"\n").to_stdout
  end
end
