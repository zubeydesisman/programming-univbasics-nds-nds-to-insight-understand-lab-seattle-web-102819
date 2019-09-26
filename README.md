# Understanding a Provided NDS

## Learning Goals

- Identify complex nested data structures
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

Here, we're going to follow our first step on the strategy we covered in the 
last lesson:

> 1. Understand the NDS
>   * Pretty-Print NDS with pp
>   * Home-Grown Pretty-Print Arrays

## Identify Complex Nested Data Structures

Let's suppose someone gave you a Ruby file and all it had in it was this:

```text
vm = [[[{:name=>"Vanilla Cookies", :price=>3}, {:name=>"Pistachio Cookies", :price=>3}, {:name=>"Chocolate Cookies", :price=>3}, {:name=>"Chocolate Chip Cookies", :price=>3}], [{:name=>"Tooth-Melters", :price=>12}, {:name=>"Tooth-Destroyers", :price=>12}, {:name=>"Enamel Eaters", :price=>12}, {:name=>"Dentist's Nightmare", :price=>20}], [{:name=>"Gummy Sour Apple", :price=>3}, {:name=>"Gummy Apple", :price=>5}, {:name=>"Gummy Moldy Apple", :price=>1}]], [[{:name=>"Grape Drink", :price=>1}, {:name=>"Orange Drink", :price=>1}, {:name=>"Pineapple Drink", :price=>1}], [{:name=>"Mints", :price=>13}, {:name=>"Curiously Toxic Mints", :price=>1000}, {:name=>"US Mints", :price=>99}]]]
```

We can paste this code into IRB and `vm` will be successfully assigned. There's
nothing wrong with this code. Ruby can read it easily. But whoever left us this
file forgot that code has to be understood by humans too. Because it's so
_dense_, our minds actively start finding ways to _not_ read what it says.  Our
brains start suggesting we skip over this monster NDS. In our experience, one
sure way to have a hard time reading and writing code that uses an NDS is to
skim it and not read it.

So what can we do to help our poor brains out? Ruby (ta-dah!) to the rescue
(again)!

## Print Out a Complex Nested Data Structure Using the `pp` Library

We can get a human-friendly version of this output by using the [`pp`][pp], or
"pretty-print," library provided by Ruby. In order to "activate" `pp`, we have
to add a `require` statement at the top of the file.

Why do we have to add a `require` statement? Ruby ships with lots of features
by default. Some of these can slow Ruby down. By default, Ruby only "activates"
the most-commonly-used features. Some of its features are inactive by default
and we say we want to "activate" them by using `require`. In time, you'll want
to use other libraries (debugging libraries, network libraries, etc.).

Customarily, `require` statements are stacked at the top of the file.

```ruby
require 'pp'

# Our NDS
vm = [[[{:name=>"Vanilla Cookies", :price=>3}, {:name=>"Pistachio Cookies", :price=>3}, {:name=>"Chocolate Cookies", :price=>3}, {:name=>"Chocolate Chip Cookies", :price=>3}], [{:name=>"Tooth-Melters", :price=>12}, {:name=>"Tooth-Destroyers", :price=>12}, {:name=>"Enamel Eaters", :price=>12}, {:name=>"Dentist's Nightmare", :price=>20}], [{:name=>"Gummy Sour Apple", :price=>3}, {:name=>"Gummy Apple", :price=>5}, {:name=>"Gummy Moldy Apple", :price=>1}]], [[{:name=>"Grape Drink", :price=>1}, {:name=>"Orange Drink", :price=>1}, {:name=>"Pineapple Drink", :price=>1}], [{:name=>"Mints", :price=>13}, {:name=>"Curiously Toxic Mints", :price=>1000}, {:name=>"US Mints", :price=>99}]]]

# Some simple things to pp
a_privateer = ["John", "Paul", "Jones"]
an_integer = 42

## pp something nested, but simple
a_o_a = [ [1,2,3], [4,5,6], [7,8,9]]

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
[[[{:name=>"Vanilla Cookies", :price=>3},
   {:name=>"Pistachio Cookies", :price=>3},
   {:name=>"Chocolate Cookies", :price=>3},
   {:name=>"Chocolate Chip Cookies", :price=>3}],
  [{:name=>"Tooth-Melters", :price=>12},
   {:name=>"Tooth-Destroyers", :price=>12},
   {:name=>"Enamel Eaters", :price=>12},
   {:name=>"Dentist's Nightmare", :price=>20}],
  [{:name=>"Gummy Sour Apple", :price=>3},
   {:name=>"Gummy Apple", :price=>5},
   {:name=>"Gummy Moldy Apple", :price=>1}]],
 [[{:name=>"Grape Drink", :price=>1},
   {:name=>"Orange Drink", :price=>1},
   {:name=>"Pineapple Drink", :price=>1}],
  [{:name=>"Mints", :price=>13},
   {:name=>"Curiously Toxic Mints", :price=>1000},
   {:name=>"US Mints", :price=>99}]]]
```

As we can see, `pp` has tried to make our structures easier to read _for humans_.
It doesn't have much to offer when dealing with simple data, but we start to
see its power with NDS'. Let's focus on the `vm` output. We'll just work with
the first few lines.

It's a good idea to save the output of `pp` into a file. Then we can use our
editor to reformat the output to help us get a handle on things. We've added
some comments to show our thought process as we looked at the `pp`'d NDS.

```text
[ # outermost structure is an Array
  [ #oh, but another one immediately, so it's an AoA
    [ # yet another!? It's an AoAoA where the inner Arrays are full of ..
      {:name=>"Vanilla Cookies", :price=>3}, # Hashes with two keys!
      {:name=>"Pistachio Cookies", :price=>3}, # and another Hash
      {:name=>"Chocolate Cookies", :price=>3}, # and another Hash
      {:name=>"Chocolate Chip Cookies", :price=>3} # and another Hash
    ], # end of inner array
    [ #...and so on...
      {:name=>"Tooth-Melters", :price=>12},
     {:name=>"Tooth-Destroyers", :price=>12},
```

From the above, we've learned a lot about what we're working with. As you
already know from previous lessons, we have an AoAoAoH with keys `:name` and
`:price`.

## Print Out a Complex Nested Data Structure Using Iteration

We can use what we just learned to help guide us to write some "scratch" Ruby
code to help us understand our structure. It's important to realize that we
don't just write code to _solve_ problems, sometimes we need to write code to
_understand how we might solve_ a problem. Sometimes pretty-printing with `pp`
is just simply not enough.

Here's some simple nested `while...do...end` statements used to reveal the
structure of the NDS. Writing this looping code was greatly helped by `pp`'s
output as guidance:

> **Reflect and Recall**: Remember, we taught some basic loops to memorize in a
> previous lesson, the "Nested Iteration Lab." If reading this `while...end`
> code feels like writing an alien newspaper, go back and review those
> materials. The remaining labs will not stop using this pattern and you need
> to be strong as granite with this skill.

```ruby
vm = [[[{:name=>"Vanilla Cookies", :price=>3}, {:name=>"Pistachio Cookies", :price=>3}, {:name=>"Chocolate Cookies", :price=>3}, {:name=>"Chocolate Chip Cookies", :price=>3}], [{:name=>"Tooth-Melters", :price=>12}, {:name=>"Tooth-Destroyers", :price=>12}, {:name=>"Enamel Eaters", :price=>12}, {:name=>"Dentist's Nightmare", :price=>20}], [{:name=>"Gummy Sour Apple", :price=>3}, {:name=>"Gummy Apple", :price=>5}, {:name=>"Gummy Moldy Apple", :price=>1}]], [[{:name=>"Grape Drink", :price=>1}, {:name=>"Orange Drink", :price=>1}, {:name=>"Pineapple Drink", :price=>1}], [{:name=>"Mints", :price=>13}, {:name=>"Curiously Toxic Mints", :price=>1000}, {:name=>"US Mints", :price=>99}]]]


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
      puts "\t\t (#{coord}, #{inner_index}) is: #{vm[row_index][column_index][inner_index]}"
      inner_index += 1
    end

    column_index += 1
  end

  row_index += 1
end
```

Produces:

```text
Row 0 has [[{:name=>"Vanilla Cookies", :price=>3}, {:name=>"Pistachio Cookies", :price=>3}, {:name=>"Chocolate Cookies", :price=>3}, {:name=>"Chocolate Chip Cookies", :price=>3}], [{:name=>"Tooth-Melters", :price=>12}, {:name=>"Tooth-Destroyers", :price=>12}, {:name=>"Enamel Eaters", :price=>12}, {:name=>"Dentist's Nightmare", :price=>20}], [{:name=>"Gummy Sour Apple", :price=>3}, {:name=>"Gummy Apple", :price=>5}, {:name=>"Gummy Moldy Apple", :price=>1}]] columns
	Coordinate [0, 0] points to an Array of length 4
		 (0, 0, 0) is: {:name=>"Vanilla Cookies", :price=>3}
		 (0, 0, 1) is: {:name=>"Pistachio Cookies", :price=>3}
		 (0, 0, 2) is: {:name=>"Chocolate Cookies", :price=>3}
		 (0, 0, 3) is: {:name=>"Chocolate Chip Cookies", :price=>3}
	Coordinate [0, 1] points to an Array of length 4
		 (0, 1, 0) is: {:name=>"Tooth-Melters", :price=>12}
		 (0, 1, 1) is: {:name=>"Tooth-Destroyers", :price=>12}
		 (0, 1, 2) is: {:name=>"Enamel Eaters", :price=>12}
		 (0, 1, 3) is: {:name=>"Dentist's Nightmare", :price=>20}
	Coordinate [0, 2] points to an Array of length 3
		 (0, 2, 0) is: {:name=>"Gummy Sour Apple", :price=>3}
		 (0, 2, 1) is: {:name=>"Gummy Apple", :price=>5}
		 (0, 2, 2) is: {:name=>"Gummy Moldy Apple", :price=>1}
Row 1 has [[{:name=>"Grape Drink", :price=>1}, {:name=>"Orange Drink", :price=>1}, {:name=>"Pineapple Drink", :price=>1}], [{:name=>"Mints", :price=>13}, {:name=>"Curiously Toxic Mints", :price=>1000}, {:name=>"US Mints", :price=>99}]] columns
	Coordinate [1, 0] points to an Array of length 3
		 (1, 0, 0) is: {:name=>"Grape Drink", :price=>1}
		 (1, 0, 1) is: {:name=>"Orange Drink", :price=>1}
		 (1, 0, 2) is: {:name=>"Pineapple Drink", :price=>1}
	Coordinate [1, 1] points to an Array of length 3
		 (1, 1, 0) is: {:name=>"Mints", :price=>13}
		 (1, 1, 1) is: {:name=>"Curiously Toxic Mints", :price=>1000}
		 (1, 1, 2) is: {:name=>"US Mints", :price=>99}
```

With this looping code and pretty-printing, we should see how to access all
those `:price` keys that we can sum together to create the total value of all
the snacks in the vending machine.  We'll do that work in the next lab. 

## Lab

In the lab, we've provided you a method called `directors_database` which
provides a nested data structure about movies and their directors.  We've
stored the database in a lightly-encrypted format. We've done this to help you
learn how to learn about an NDS that's too complex for a human mind to easily
grasp. You'll want this skill to be strong as you start writing complex
programs.

In the lab, we're going to run some tests where we'll pass in that database to
the methods. Your job will to be to write the implementations that satisfy the
test. In one, you will use the pretty printer. In the other, you'll need to
extract some data using the standard `Array` and `Hash` methods you know
already and print it out.

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
