#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'haml'
 
get '/test2' do
  haml :index
end
 
# This one shows how you can use refer to
# variables in your Haml views.
# This method uses member variables.
get '/hello/:name' do|name|
  @name = name
  haml :hello
end
 
# This method shows you how to inject
# local variables
get '/goodbye/:name' do|name|
  haml :goodbye, :locals => { :name => name }
end
 
__END__
@@ layout
%html
  %head
    %title Haml on Sinatra Example
  %body
    =yield
 
@@ index
#header
  %h1 Haml on Sinatra Example
#content
  %p
    This is an example of using Haml on Sinatra.
    You can use Haml in all your projeccts now, instead
    of Erb. I'm sure you'll find it much easier!
  %div#things
  %span#rice Chicken Fried
  %p.beans{ :food => 'true' } The magical fruit
  %h1.class.otherclass#id La La La
  
- (42...47).each do |i|
  %p= i
%p See, I can count!