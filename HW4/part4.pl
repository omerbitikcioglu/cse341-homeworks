% Gebze Technical University
% Computer Engineering Department
% CSE341 Programming Languages
% Homework 4 - Part 4
% Author: Ömer Faruk Bitikçioğlu

% Define a Prolog predicate “element(E,S)” that returns true if E is in S
element(E, S) :- 

% Define a Prolog predicate “union(S1,S2,S3)” that returns true if S3 is the union of S1 and S2
union(S1, S2, S3) :- S3 is S1 + S2.
union(S1, S2, S3) :- intersect(S1, S2, SI), S3 is S1 + S2 - SI.

union([],S,S).
union(S,[],S):-S\=[].
union([X|TX],[X|TY],[X|TZ]):-union(TX,TY,TZ).
union([X|TX],[Y|TY],[X|TZ]):-lt(X,Y),union(TX,[Y|TY],TZ).
union([X|TX],[Y|TY],[Y|TZ]):-lt(Y,X),union([X|TX],TY,TZ).

% Define a Prolog predicate “intersect(S1,S2,S3)” that returns true if S3 is the intersection of of S1 and S2
intersect(S1, S2, S3) :- 

% Define a Prolog predicate “equivalent(S1,S2)” that returns true if S1 and S2 are equivalent sets
equivalent(S1, S2) :- S1 = S2.