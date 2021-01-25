% Gebze Technical University
% Computer Engineering Department
% CSE341 Programming Languages
% Homework 4 - Part 2
% Author: Ömer Faruk Bitikçioğlu

% knowledge base
flight(edirne, edremit).
flight(edremit, erzincan).
flight(istanbul, izmir).
flight(izmir, isparta).
flight(isparta, burdur).
flight(istanbul, antalya).
flight(antalya, konya).
flight(antalya, gaziantep).
flight(istanbul, gaziantep).
flight(istanbul, ankara).
flight(istanbul, van).
flight(istanbul, rize).
flight(ankara, konya).
flight(ankara, van).
flight(van, rize).

distance(edirne, edremit, 251).
distance(edremit, erzincan, 992).
distance(istanbul, izmir, 328).
distance(izmir, isparta, 308).
distance(isparta, burdur, 24).
distance(istanbul, antalya, 482).
distance(antalya, konya, 192).
distance(antalya, gaziantep, 592).
distance(istanbul, gaziantep, 847).
distance(istanbul, ankara, 351).
distance(istanbul, van, 1262).
distance(istanbul, rize, 967).
distance(ankara, konya, 227).
distance(ankara, van, 920).
distance(van, rize, 373).

% rules
sroute(A, B, Distance) :- A \= B, flight(A, B), distance(A, B, X), Distance is X.
sroute(A, B, Distance) :- A \= B, flight(B, A), distance(B, A, X), Distance is X.
sroute(A, B, Distance) :- A \= B, flight(A, X), distance(A, X, Distance1), sroute(X, B, Distance2), Distance is Distance1 + Distance2.
sroute(A, B, Distance) :- A \= B, flight(B, X), distance(B, X, Distance1), sroute(X, A, Distance2), Distance is Distance1 + Distance2.