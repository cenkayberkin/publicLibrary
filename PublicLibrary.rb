class Book

  def initialize(name,isbn,author)
    @name = name
    @isbn = isbn
    @author = author
    @shelf = nil
  end

  def to_s
    "Book => Name: #{@name} , isbn: #{@isbn} , author: #{@author}"
  end

  def enshelf(shelf)
    raise ArgumentError.new("Book enshelf argument error") if shelf.nil? or shelf.class != Shelf

    @shelf = shelf
    shelf.booksHash[@name] = self
  end

  def unshelf()
    if @shelf != nil
      @shelf.booksHash.delete(@name)
      @shelf = nil
    else
      puts "Book #{@name} doesnt belong to any shelf."
    end
  end
end

class Shelf
  attr_reader :name, :booksHash

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
  attr_reader :name, :numberOfShelfs

  def initialize(name)
    @name = name
    @shelfsHash = {}
    @numberOfShelfs = 0
  end

  def addShelf(shelf)
    raise ArgumentError.new("Library addShelf argument error") if shelf.nil? or shelf.class != Shelf

    @shelfsHash[shelf.name] = shelf
    @numberOfShelfs += 1
  end

  def allBooks
    puts "All Books in the library: #{@name}"
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
b1 = Book.new("blue wings","1234","John")
b1.enshelf(shelf1)
b2 = Book.new("red wings","4334","Martin")
b2.enshelf(shelf1)
b3 = Book.new("yellow wings","4322","Cassie")
b3.enshelf(shelf1)
b4 = Book.new("black wings","3121","Sharon")
b4.enshelf(shelf1)
b1.unshelf

shelf2 = Shelf.new("A2")
Lib1.addShelf(shelf2)
b5 = Book.new("Nice Sea","9987","Bob")
b5.enshelf(shelf2)
b6 = Book.new("Red Woman","4573","Tim")
b6.enshelf(shelf2)
b7 = Book.new("Game of thrones","8765","Bran")
b7.enshelf(shelf2)

Lib1.allBooks
