# Understanding a Provided NDS

## Learning Goals

- Print out a complex nested data structure using the `pp` library
- Print out a complex nested data structure using iteration

## Introduction

In our examples in this module, we've had the advantage of knowing what the NDS
modeled: usually a vending machine. But programmers are often asked to work
with an NDS whose nature, history, and culture they don't already know. How do
programmers get to "know" the NDS they have to work with?

It's obvious that if you don't know what the structure is and how it's put
together, you're going to have a hard time writing code to process the NDS into
_insight_. This lesson provides two reliable techniques for getting to know the
NDS you have to work with.

## Print out a complex nested data structure using the `pp` library

Let's suppose someone gave you a Ruby file and all it had in it was this:

```ruby
vm = [[[{:name=>"Vanilla Cookies", :pieces=>3}, {:name=>"Pistachio Cookies", :pieces=>3}, {:name=>"Chocolate Cookies", :pieces=>3}, {:name=>"Chocolate Chip Cookies", :pieces=>3}], [{:name=>"Tooth-Melters", :pieces=>12}, {:name=>"Tooth-Destroyers", :pieces=>12}, {:name=>"Enamel Eaters", :pieces=>12}, {:name=>"Dentist's Nighmare", :pieces=>20}], [{:name=>"Gummy Sour Apple", :pieces=>3}, {:name=>"Gummy Apple", :pieces=>5}, {:name=>"Gummy Moldy Apple", :pieces=>1}]], [[{:name=>"Grape Drink", :pieces=>1}, {:name=>"Orange Drink", :pieces=>1}, {:name=>"Pineapple Drink", :pieces=>1}], [{:name=>"Mints", :pieces=>13}, {:name=>"Curiously Toxic Mints", :pieces=>1000}, {:name=>"US Mints", :pieces=>99}]]]
```

We can paste this code into IRB and `vm` will be successfully assigned. There's
nothing wrong with this code. Ruby can read it easily. But whoever left us this
file forgot that code has to be understood by humans too.

We can get a human-friendly version of this output by using the [`pp`][pp], or
"pretty-print" library provided by Ruby. In order to "activate" `pp`, we have
to add a `require` statement at the top of the file. Ruby ships with lots of
features by default. Some of these can slow Ruby down. By default, Ruby only
"activates" the most-commonly used methods. Some of its features are inactive
by default and we say we want to "activate" them by using `require`.

Customarily, `require` statements are stacked at the top of the file.

```ruby
require 'pp'

vm = [[[{:name=>"Vanilla Cookies", :pieces=>3}, {:name=>"Pistachio Cookies", :pieces=>3}, {:name=>"Chocolate Cookies", :pieces=>3}, {:name=>"Chocolate Chip Cookies", :pieces=>3}], [{:name=>"Tooth-Melters", :pieces=>12}, {:name=>"Tooth-Destroyers", :pieces=>12}, {:name=>"Enamel Eaters", :pieces=>12}, {:name=>"Dentist's Nighmare", :pieces=>20}], [{:name=>"Gummy Sour Apple", :pieces=>3}, {:name=>"Gummy Apple", :pieces=>5}, {:name=>"Gummy Moldy Apple", :pieces=>1}]], [[{:name=>"Grape Drink", :pieces=>1}, {:name=>"Orange Drink", :pieces=>1}, {:name=>"Pineapple Drink", :pieces=>1}], [{:name=>"Mints", :pieces=>13}, {:name=>"Curiously Toxic Mints", :pieces=>1000}, {:name=>"US Mints", :pieces=>99}]]]
```

In this code we have gained the method `pp`. We can now `pp` all sorts of
things:

```ruby
require 'pp'

# Some simple things to pp
a_privateer = ["John", "Paul", "Jones"]
an_integer = 42

## pp something nested, but simple
a_o_a = [ [1,2,3], [4,5,6], [7,8,9]]

## pp something nested, but complex
vm = [[[{:name=>"Vanilla Cookies", :pieces=>3}, {:name=>"Pistachio Cookies", :pieces=>3}, {:name=>"Chocolate Cookies", :pieces=>3}, {:name=>"Chocolate Chip Cookies", :pieces=>3}], [{:name=>"Tooth-Melters", :pieces=>12}, {:name=>"Tooth-Destroyers", :pieces=>12}, {:name=>"Enamel Eaters", :pieces=>12}, {:name=>"Dentist's Nighmare", :pieces=>20}], [{:name=>"Gummy Sour Apple", :pieces=>3}, {:name=>"Gummy Apple", :pieces=>5}, {:name=>"Gummy Moldy Apple", :pieces=>1}]], [[{:name=>"Grape Drink", :pieces=>1}, {:name=>"Orange Drink", :pieces=>1}, {:name=>"Pineapple Drink", :pieces=>1}], [{:name=>"Mints", :pieces=>13}, {:name=>"Curiously Toxic Mints", :pieces=>1000}, {:name=>"US Mints", :pieces=>99}]]]

pp a_privateer
pp an_integer
pp a_o_a
pp vm

```

Output:

```text
["John", "Paul", "Jones"]
42
[[1, 2, 3], [4, 5, 6], [7, 8, 9]]
[[[{:name=>"Vanilla Cookies", :pieces=>3},
   {:name=>"Pistachio Cookies", :pieces=>3},
   {:name=>"Chocolate Cookies", :pieces=>3},
   {:name=>"Chocolate Chip Cookies", :pieces=>3}],
  [{:name=>"Tooth-Melters", :pieces=>12},
   {:name=>"Tooth-Destroyers", :pieces=>12},
   {:name=>"Enamel Eaters", :pieces=>12},
   {:name=>"Dentist's Nighmare", :pieces=>20}],
  [{:name=>"Gummy Sour Apple", :pieces=>3},
   {:name=>"Gummy Apple", :pieces=>5},
   {:name=>"Gummy Moldy Apple", :pieces=>1}]],
 [[{:name=>"Grape Drink", :pieces=>1},
   {:name=>"Orange Drink", :pieces=>1},
   {:name=>"Pineapple Drink", :pieces=>1}],
  [{:name=>"Mints", :pieces=>13},
   {:name=>"Curiously Toxic Mints", :pieces=>1000},
   {:name=>"US Mints", :pieces=>99}]]]
```

As we can see, `pp` has tried to make our structures easier to read for humans.
It doesn't have much to offer when dealing with simple data, but we start to
see its power with NDS'. Let's focus on the `vm` output. We'll just work with
the first few lines.

It's a good idea to save the outpout of `pp` into a file. Then we can use
our editor to reformat the output to help us get a handle on things.

```text
[ # outermost structures is an Array
  [ #oh, but another one immediately, so it's an AoA
    [ # yet another!? It's an AoAoA where the inner Arrays are full of ..
      {:name=>"Vanilla Cookies", :pieces=>3}, # Hashes with two keys!
      {:name=>"Pistachio Cookies", :pieces=>3}, # and another Hash
      {:name=>"Chocolate Cookies", :pieces=>3}, # and another Hash
      {:name=>"Chocolate Chip Cookies", :pieces=>3} # and another Hash
    ], # end of inner hash
    [
      {:name=>"Tooth-Melters", :pieces=>12},
     {:name=>"Tooth-Destroyers", :pieces=>12},
```

From the above, we know a lot about what we're working with. As you already
know from other lessons, we have an AoAoAoH with keys `:name` and `:pieces`.


## Print Out a Complex Nested Data Structure Using Iteration

We can use what we just learned to help guide us to write some "scratch" Ruby
code to help us understand our structure. It's important to realize that we
don't just write code to _solve_ problems, sometimes we need to write code to
_understand how we might solve_ a problem.

We're going to use simple iteration to print out a "picture" of our NDS.

Here's some simple nested `while...do...end` statements used to reveal the
structure of a nested data structure:

```ruby
vm = [[[{:name=>"Vanilla Cookies", :pieces=>3}, {:name=>"Pistachio Cookies", :pieces=>3}, {:name=>"Chocolate Cookies", :pieces=>3}, {:name=>"Chocolate Chip Cookies", :pieces=>3}], [{:name=>"Tooth-Melters", :pieces=>12}, {:name=>"Tooth-Destroyers", :pieces=>12}, {:name=>"Enamel Eaters", :pieces=>12}, {:name=>"Dentist's Nighmare", :pieces=>20}], [{:name=>"Gummy Sour Apple", :pieces=>3}, {:name=>"Gummy Apple", :pieces=>5}, {:name=>"Gummy Moldy Apple", :pieces=>1}]], [[{:name=>"Grape Drink", :pieces=>1}, {:name=>"Orange Drink", :pieces=>1}, {:name=>"Pineapple Drink", :pieces=>1}], [{:name=>"Mints", :pieces=>13}, {:name=>"Curiously Toxic Mints", :pieces=>1000}, {:name=>"US Mints", :pieces=>99}]]]


row_index = 0
while row_index < vm.length do
  puts "Row #{row_index} has #{vm[row_index]} columns"

  column_index = 0
  while column_index < vm[row_index].length do
    coord = "#{row_index}, #{column_index}"
    inner_len = vm[row_index][column_index].length
    # Remember \t is a TAB character for indentation
    puts "\tCoordinate [#{coord}] points to an #{vm[row_index][column_index].class} of length #{inner_len}"

    inner_index = 0
    while inner_index < inner_len do
      puts "\t\t (#{coord}, #{inner_len}) is: #{vm[row_index][column_index][inner_index]}"
      inner_index += 1
    end

    column_index += 1
  end

  row_index += 1
end
```

```text
Row 0 has [[{:name=>"Vanilla Cookies", :pieces=>3}, {:name=>"Pistachio Cookies", :pieces=>3}, {:name=>"Chocolate Cookies", :pieces=>3}, {:name=>"Chocolate Chip Cookies", :pieces=>3}], [{:name=>"Tooth-Melters", :pieces=>12}, {:name=>"Tooth-Destroyers", :pieces=>12}, {:name=>"Enamel Eaters", :pieces=>12}, {:name=>"Dentist's Nighmare", :pieces=>20}], [{:name=>"Gummy Sour Apple", :pieces=>3}, {:name=>"Gummy Apple", :pieces=>5}, {:name=>"Gummy Moldy Apple", :pieces=>1}]] columns
	Coordinate [0, 0] points to an Array of length 4
		 (0, 0, 4) is: {:name=>"Vanilla Cookies", :pieces=>3}
		 (0, 0, 4) is: {:name=>"Pistachio Cookies", :pieces=>3}
		 (0, 0, 4) is: {:name=>"Chocolate Cookies", :pieces=>3}
		 (0, 0, 4) is: {:name=>"Chocolate Chip Cookies", :pieces=>3}
	Coordinate [0, 1] points to an Array of length 4
		 (0, 1, 4) is: {:name=>"Tooth-Melters", :pieces=>12}
		 (0, 1, 4) is: {:name=>"Tooth-Destroyers", :pieces=>12}
		 (0, 1, 4) is: {:name=>"Enamel Eaters", :pieces=>12}
		 (0, 1, 4) is: {:name=>"Dentist's Nighmare", :pieces=>20}
	Coordinate [0, 2] points to an Array of length 3
		 (0, 2, 3) is: {:name=>"Gummy Sour Apple", :pieces=>3}
		 (0, 2, 3) is: {:name=>"Gummy Apple", :pieces=>5}
		 (0, 2, 3) is: {:name=>"Gummy Moldy Apple", :pieces=>1}
Row 1 has [[{:name=>"Grape Drink", :pieces=>1}, {:name=>"Orange Drink", :pieces=>1}, {:name=>"Pineapple Drink", :pieces=>1}], [{:name=>"Mints", :pieces=>13}, {:name=>"Curiously Toxic Mints", :pieces=>1000}, {:name=>"US Mints", :pieces=>99}]] columns
	Coordinate [1, 0] points to an Array of length 3
		 (1, 0, 3) is: {:name=>"Grape Drink", :pieces=>1}
		 (1, 0, 3) is: {:name=>"Orange Drink", :pieces=>1}
		 (1, 0, 3) is: {:name=>"Pineapple Drink", :pieces=>1}
	Coordinate [1, 1] points to an Array of length 3
		 (1, 1, 3) is: {:name=>"Mints", :pieces=>13}
		 (1, 1, 3) is: {:name=>"Curiously Toxic Mints", :pieces=>1000}
		 (1, 1, 3) is: {:name=>"US Mints", :pieces=>99}
```

## Lab

In the following lab, we've provided you a method called `directors_database`
which provides a bunch of information about movies and their directors. Your
job is to take the NDS returned by `directors_database` and learn about its
structure. You'll write your solution in `lib/nds_explore.rb`.

## Conclusion

It's important to understand your "encyclopedia of facts," your NDS
***before*** you start trying to code methods to produce insight from it. It's
entirely legitimate to take time to write code to help you understand the NDS'
structure. This effort is rarely wasted. Your first tool is `pp` and your
second tool is writing simple scripts for iterating through the NDS. How much
work you need to do to understand your NDS will vary with its complexity.

With a good understanding of the NDS, we're going to invent methods that help
us work with the NDS more easily.  We'll explore how to do that more in the
next lesson.

## Resources

* [`pp`][pp] documentation

[pp]: https://ruby-doc.org/stdlib-2.4.1/libdoc/pp/rdoc/PP.html
