class Contact < ActiveRecord::Base
  attr_accessible :from, :body, :name
end
