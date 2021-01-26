% Gebze Technical University
% Computer Engineering Department
% CSE341 Programming Languages
% Homework 4 - Part 4
% Author: Ömer Faruk Bitikçioğlu

% Define a Prolog predicate “element(E,S)” that returns true if E is in S
element(E, [E|_]).
element(E,[_|Tail]) :-
    element(E,Tail).

% Define a Prolog predicate “union(S1,S2,S3)” that returns true if S3 is the union of S1 and S2
union([],Set,Set).
union([X|L],Set,Z):-
    member(X,Set),!,
    union(L,Set,Z).
union([X|L],Set,[X|Z]):-
    not(member(X,Set)),!,
    union(L,Set,Z).


% Define a Prolog predicate “intersect(S1,S2,S3)” that returns true if S3 is the intersection of of S1 and S2
intersect([],_,[]).
intersect([X|L],Set,[X|Z]):-
    member(X,Set),!,
    intersect(L,Set,Z).
intersect([X|L],Set,Z):-
    not(member(X,Set)),
    intersect(L,Set,Z).


% Define a Prolog predicate “equivalent(S1,S2)” that returns true if S1 and S2 are equivalent sets
equivalent(S1, S2) :- subset(S1, S2), subset(S2, S1).