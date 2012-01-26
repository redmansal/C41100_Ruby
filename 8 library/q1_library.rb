#
# q1_library.rb
#
# author:        Colm Nolan 
# last modified: 17 November, 2011
# description:   This makes a library database and reocords are added
 
 

require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database  => "libDatabase")


ActiveRecord::Schema.define do
  create_table :users do |table|
    table.column :name, :string
    table.column :age, :integer
  end

  create_table :books do |table|
    table.column :user_id, :integer
    table.column :borrower, :string
    table.column :title, :string
    table.column :borrowed_when, :string
    table.column :due_back, :string
  end
end


class User < ActiveRecord::Base
  has_many :books
end

class Book < ActiveRecord::Base
  belongs_to :user
end

user = User.create(:name => 'Mary Doyle', :age => 50)
user.books.create(:borrower => 'Mary Doyle', :title => '1984', :borrowed_when => '13/06/2011', :due_back => '20/06/2011')
user.books.create(:borrower => 'Mary Doyle', :title => 'Gone With The Wind', :borrowed_when => '20/06/2011', :due_back => '20/06/2011')

user2 = User.create(:name => 'Robert De Niro', :age => 30)
user2.books.create(:borrower => 'Robert De Niro', :title => 'The Gathering', :borrowed_when => '13/06/2011', :due_back => '20/06/2011')
user2.books.create(:borrower => 'Robert De Niro', :title => 'Catch 22', :borrowed_when => '20/06/2011', :due_back => '20/06/2011')
user2.books.create(:borrower => 'Robert De Niro', :title => 'Moby-Dick', :borrowed_when => '20/06/2011', :due_back => '20/06/2011')


puts "find what books Robert De Niro has out from the library"
p user2.books

puts "find what books Mary Doyle has out from the library"
p user.books

#country.regions.create(:region_size => 22000, :name => 'Munster')
#country.regions.create(:region_size => 12421, :name => 'Connaght')
#country.regions.create(:region_size => 30000, :name => 'Ulster')

puts "find all the users of the library"
p User.find(:all)

puts "find all the books length out(small library!)"
p Book.find(:all)


