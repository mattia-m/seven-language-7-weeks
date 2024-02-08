% define a function to reverse the element of a list

% Base case: The reverse of an empty list is an empty list.
reverse_list([], []).

% Recursive case: Remove the head of the list, reverse the tail, and append the head to the end.
reverse_list([Head|Tail], Reversed) :-
    reverse_list(Tail, RevTail),
    append(RevTail, [Head], Reversed).


% define a function to find the smallest item of a list

% Base case: The smallest element in a list with one item is the item itself.
smallest([Min], Min).

% Recursive case: Compare the head of the list with the smallest element in the tail.
smallest([Head|Tail], Min) :-
    smallest(Tail, TailMin),
    (Head < TailMin -> Min = Head ; Min = TailMin).


% define a function to sort a list

% we should start defininig an insert predicate (arity 3) that insert in the right point of the list

insert(X, [], [X]).
insert(X, [Y|Ys], [X,Y|Ys]) :- X =< Y.
insert(X, [Y|Ys], [Y|Zs]) :- X > Y, insert(X, Ys, Zs).

% next we define the insertion_sort predicate (arity 2) that sort a list using insert previously defined

insertion_sort([], []).
insertion_sort([X|Xs], Sorted) :-
    insertion_sort(Xs, SortedTail),
    insert(X, SortedTail, Sorted).