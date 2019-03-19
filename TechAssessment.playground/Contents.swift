import Foundation
import XCTest

// Напиши функцию/класс которые помогут вернуть уникальные значнеия из списка адресной книги
// если учесть что уникальными являются пара "имя телеофн"

struct Contact {
  let name: String
  let phone: Int
  
  init(name: String, phone: Int) {
    self.name = name
    self.phone = phone
  }
}

let adressBook: [Contact] = [
  Contact(name: "Gregory", phone: 135666),
  Contact(name: "Gregory", phone: 154234),
  Contact(name: "gregory", phone: 154234),
  Contact(name: "Lisa", phone: 126323),
  Contact(name: "James", phone: 123234),
  Contact(name: "James", phone: 123234),
  Contact(name: "Eric", phone: 765345),
  Contact(name: "Robert", phone: 234234),
  Contact(name: "Allison", phone: 231523),
  Contact(name: "Chris", phone: 122331),
  Contact(name: "Remy", phone: 833453),
  Contact(name: "remy", phone: 833243),
  Contact(name: "Remy", phone: 833453),
  Contact(name: "Lawrence", phone: 235123),
  Contact(name: "Martha", phone: 132636),
  Contact(name: "Jessica", phone: 132266),
  Contact(name: "Chi", phone: 132686),
]

// // // // // // // // // // // // // // // // // // // // // // // // // //
// 3х буквенный Diff
// Напиши реализацию метода который принимает две строки и
// возвращает true если они идентичны по длине и имееют отличие не более чем на три буквы

protocol DiffProtocol: class {
  func threeLetterDiff(_ input1: String, _ input2: String) -> Bool
}


class DiffClass: DiffProtocol {
  func threeLetterDiff(_ input1: String, _ input2: String) -> Bool {
    // your code here
    return true
  }
  
}

// TestCase

class DiffClassTests: XCTestCase {
  var testDiff: DiffClass!
  
  override func setUp() {
    super.setUp()
    self.testDiff = DiffClass()
  }
  
  func testThreeLetterDiff() {
    XCTAssertFalse(self.testDiff.threeLetterDiff("One", "Three"), "false - different length")
    XCTAssertFalse(self.testDiff.threeLetterDiff("String", "Threes"), "false - 4 letter difference")
    XCTAssertTrue(self.testDiff.threeLetterDiff("Hello", "World"), "true - 3 letter difference")
    XCTAssertTrue(self.testDiff.threeLetterDiff("Clamp", "Cramp"), "true  - 1 letter difference")
  }
}

DiffClassTests.defaultTestSuite.run()




// // // // // // // // // // // // // // // // // // // // // // // // // //
// Заверши реалзиацию класса чтобы получить ожидаемое поведение, см TODO

class Person {
  var name: String!
  
  init(_ fullName: String) {
    name = fullName
  }
}

class Book {
  var title: String!
  var author: String!
  
  init(_ bookTitle: String, _ bookAuthor: String) {
    title = bookTitle
    author = bookAuthor
  }
}


// --- Your code goes below this line ---

protocol LibraryProtocol: class {
  var catalogue: [String: Book] { get }
  var checkedOutBooks: [String: Person] { get set }
  
  func searchByTitle(_ title: String) -> String

  func checkIn(_ bookId: String) -> String
  func checkOut(_ bookId: String, _ person: Person) -> String
}

class Library: LibraryProtocol {
  
  var catalogue: [String: Book] = [
    "ORW": Book("1984", "George Orwell"),
    "RAY": Book("Fahrenheit 451", "Ray Bradbury")
  ]
  
  var checkedOutBooks = [String: Person]()
  
  func searchByTitle(_ title: String) -> String {
    
    // TODO: это метод поиска названия книги в Dictionary catalog
    //
    // Returns "Available" если книга есть и никто ее не взял
    //
    // Returns "Checked out by name" если книга есть и занята другим человеком
    //
    // Returns "Not in catalogue" если книга отсутствует в каталоге
    
    return ""
  }
  
  func checkOut(_ bookId: String, _ person: Person) -> String {
    
    // TODO: метод добавляет запись в Dictionary checkedOutBooks
    //
    // Returns "Error: Book already checked out" если книга уже присутствует в Dictionary
    //
    // Returns "Successfully checked out" книга успешно добавлена, так же добавляется пара bookId - person
    //
    // Returns "Book doesn't exist" если книга отсутствует в Dictionary catalog
    
    return ""
  }
  
  func checkIn(_ bookId: String) -> String {
    
    // TODO: метод убирает пару bookId - person key-value из Dictionary checkedOutBooks
    //
    // Returns "Book doesn't exist" если книга отсутствует в Dictionary catalog
    //
    // Returns "Error: Can't check-in a book that hasn't been checked out" если книга отсутствует в Dictionary checkedOutBooks
    //
    // Returns "Successfully checked in" при успешном удалении
    
    return ""
  }
  
}


let lib = Library()
let borrower1 = Person("Curious George")
let borrower2 = Person("Mark Twain")

// George searches for a book
let searchResult = lib.searchByTitle("1984")
print(searchResult)

// Expected Output in console:
// "Available"

// George checks out the book
let borrowResult = lib.checkOut("ORW", borrower1)
print(borrowResult)

// Expected Output in console:
// "Successfully checked out"

// Mark searches for a book
let searchResult2 = lib.searchByTitle("1984")
print(searchResult2)

// Expected Output in console:
// "Checked out by Curious George"

// Mark tries to borrow a book that's already checked out
let borrowResult2 = lib.checkOut("ORW", borrower2)
print(borrowResult2)

// Expected Output in console:
// "Error: Book already checked out"

// A book is checked in
let checkInResult = lib.checkIn("RAY")
print(checkInResult)

// Expected Output in console:
// "Error: Can't check in a book that hasn't been checked out"

// George checks in his book
let checkInResult2 = lib.checkIn("ORW")
print(checkInResult2)

// Expected Output in console:
// "Successfully checked in"

// Mark attempts to borrow the book again
let borrowResult3 = lib.checkOut("ORW", borrower2)
print(borrowResult3)

// Expected Output in console:
// "Successfully checked out"
