require 'spec_helper'
FactoryGirl.define :user do |f|
  f.password "foobar"
  f.password_confirmation { |u| u.password }
  f.email "foo@example.com"
end