# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "equatable/version"

Gem::Specification.new do |s|
  s.name        = "equatable"
  s.version     = Equatable::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Viktar Basharymau"]
  s.email       = ["viktar.basharymau@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{This gem allows user to easily override == and hash methods.}
  s.description = %q{require 'equatable'
class Sock
  attr_reader :size, :color
  
  equatable :size, :color

  def initialize(size, color)
    @size, @color = size, color
  end
end}

  s.add_development_dependency "rspec", "~> 2.6"
  s.add_dependency "rake", "~> 0.9.2"
  s.add_dependency 'nokogiri'

  s.rubyforge_project = "equatable"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
