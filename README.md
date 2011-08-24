# Description [![Build Status](https://secure.travis-ci.org/DNNX/equatable.png)](http://travis-ci.org/#!/DNNX/equatable)

This gem allows you to create `#hash`, `#==` and `#eql?` method based on which fields should be used for comparison of two objects.

# Installation

`gem install equatable`

# Usage

    require 'equatable'
    class Gadget
      attr_reader :model, :color, :price
      
      include Equatable
      equatable :model, :color  
    
      def initialize(model, color, price)
        @model, @color, @price = model, color, price
      end
    end
    
    a = Gadget.new(:iphone, :white, 1.0/0)
    b = Gadget.new(:iphone, :white, 500)
    c = Gadget.new(:samsung, :white, 100)
    
    puts a.hash
    # => 732625824
    puts b.hash
    # => 732625824
    puts c.hash
    # => 29937888
    
    puts a == b
    # => true
    puts b == c
    # => false
    puts a == c
    # => false
    
