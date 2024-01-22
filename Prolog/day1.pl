% Defining authors and their books
author_book(palahniuk, fight_club).
author_book(palahniuk, choke).
author_book(palahniuk, survivor).
author_book(follett, the_pillars_of_the_earth).
author_book(follett, world_without_end).
author_book(follett, a_dangerous_fortune).

% Defining books and their publishers
book_publisher(fight_club, w_w_norton).
book_publisher(choke, doubleday).
book_publisher(survivor, w_w_norton).
book_publisher(the_pillars_of_the_earth, pan_macmillan).
book_publisher(world_without_end, pan_macmillan).
book_publisher(a_dangerous_fortune, dell).

% Query to retrieve all books by a specific author
books_by_author(Author, Books) :-
    findall(Book, author_book(Author, Book), Books).

% Query to get the publisher of a book
publisher_of_book(Book, Publisher) :-
    book_publisher(Book, Publisher).

% Query to get all publishers for a specific author
publishers_of_author(Author, Publishers) :-
    findall(Publisher, (author_book(Author, Book), book_publisher(Book, Publisher)), PublishersList),
    list_to_set(PublishersList, Publishers).

% i have to interrogate my knowledge base by doing
$ books_by_author(palahniuk, Books).