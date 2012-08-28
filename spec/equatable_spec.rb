require 'equatable'

class Sock
  include Equatable
  
  attr_reader :size, :color, :price
  
  def initialize(size, color, price)
    @size, @color, @price = size, color, price
  end
  
  equatable :size, :color
end

describe Equatable do
    
  subject { Sock.new(10, :black, 20) }
  
  describe "#hash" do
    it "should have the same hash as another similar sock" do
      subject.hash.should == Sock.new(10, :black, 300).hash
    end
    
    it "should have FixNum hash" do
      subject.hash.should be_kind_of(::Fixnum)
    end
  end
  
  describe "#==" do
    it "should be equal to the similar sock" do
      subject.should == Sock.new(10, :black, 0)
    end
    
    it "should not be equal to the sock with another size" do
      subject.should_not == Sock.new(11, :black, 20)
    end

    it "should not be equal to the sock with another color" do
      subject.should_not == Sock.new(10, :green, 20)
    end
    
    it "should not be equal to another kind of object" do
      subject.should_not == "something different"
    end
  end
  
  describe "#eql?" do
    it "should be equal to the similar sock" do
      subject.should eql(Sock.new(10, :black, 0))
    end
    
    it "should not be equal to the sock with another size" do
      subject.should_not eql(Sock.new(11, :black, 20))
    end

    it "should not be equal to the sock with another color" do
      subject.should_not eql(Sock.new(10, :green, 20))
    end
    
    it "should not be equal to another kind of object" do
      subject.should_not eql("something different")
    end
  end
end
