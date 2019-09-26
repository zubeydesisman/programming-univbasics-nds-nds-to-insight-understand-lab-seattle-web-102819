require 'spec_helper'

describe 'When using "pp" to display complex data structures,' do
  it 'pretty_print_nds prints the nds it is passed using the build-in pretty-printer' do
    # Advanced Ruby code. It's used to temporarily override
    # inclusion of `pp` so that we can catch that it was called.
    $pp_called_flag = false
    module Kernel
      alias :original_pp :pp
      def pp(*args)
        $pp_called_flag =  true
      end
    end
    # Ignore up to previous comment ^^

    # Code to analyze to get a passing result
    pretty_print_nds(directors_database)
    expect(!!$pp_called_flag).to eq(true), "Make sure you call `pp` in this pretty_print_nds"
    # end

    # Used to verify the test, safe to ignore from here to end of method
    module Kernel
      alias :pp :original_pp
    end
  end
end

describe 'When exploring the data structure using custom methods,' do
  it 'print_first_directors_movie_titles loops over Spielberg’s movies and prints out their names with newlines' do
    expect { print_first_directors_movie_titles }.to output("Jaws\nClose Encounters of the Third Kind\nRaiders of the Lost Ark\nE.T. the Extra-terrestrial\nSchindler's List\nLincoln\n").to_stdout
  end
end
