class Book
  attr_accessor :name, :isbn, :author, :shelf

  def initialize(name,isbn,author)
    @name = name
    @isbn = isbn
    @author = author
    @shelf = nil
  end

  def to_s
    "Name: #{@name} , isbn: #{@isbn} , author: #{@author}"
  end

  def enshelf(shelf)
    @shelf = shelf
    shelf.booksHash[@name] = self
  end

  def unshelf()
    @shelf.booksHash.delete(@name)
    @shelf = nil
  end
end

class Shelf
  attr_accessor :booksHash ,:name

  def initialize(name)
    @name = name
    @booksHash = {}
  end

  def allBooks
    @booksHash.each do |key,value|
      puts "#{value}"
    end
  end
end

class Library
  attr_accessor :name, :shelfsHash, :numberOfShelfs

  def initialize(name)
    @name = name
    @shelfsHash = {}
    @numberOfShelfs = 0
  end

  def addShelf(shelf)
    @shelfsHash[shelf.name] = shelf
    @numberOfShelfs += 1
  end

  def allBooks
    puts "All Books in the library:"
    @shelfsHash.each do |key,value|
      puts "Shelf name: #{value.name}"
      value.allBooks
      puts ""
    end
  end
end

Lib1 = Library.new("Great Alexander Library")
shelf1 = Shelf.new("A1")
Lib1.addShelf(shelf1)

puts "Number of shelves: #{Lib1.numberOfShelfs}"

b1 = Book.new("blue wings","1234","Ahmet")
b1.enshelf(shelf1)

b2 = Book.new("red wings","4334","Cenk")
b2.enshelf(shelf1)

b3 = Book.new("yellow wings","4322","Mehmet")
b3.enshelf(shelf1)

b4 = Book.new("black wings","3121","Kazim")
b4.enshelf(shelf1)

b1.unshelf

Lib1.allBooks
