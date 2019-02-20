$(function () {

  console.log('index.js. loaded ... ');
  getBooks()
})



// showing a list
// showing a single element
// showing has_many 

// call a function
// in the function, do an ajax req

// take the response from the req, and create class object
// custom function on the class, ( show some html to put on the DOM)
// append the html to the DOM

function getBooks() {
  $.ajax({
    url: 'http://127.0.0.1:3000/books',
    method: 'get',
    dataType: 'json'
  }).done(function (response) {

    console.log('response: ', response);

    let book = new Book(response[0])
    let bookDisplay = book.bookHTML()
    // append to the DOM
    debugger;
  })
}

class Book {
  constructor(obj) {
    this.title = obj.title
  }
}

Book.prototype.bookHTML = function () {
  return (`
    <div>${this.title}</div>
  `)
}