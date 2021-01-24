% Gebze Technical University
% Computer Engineering Department
% CSE341 Programming Languages
% Homework 4 - Part 1
% Author: Ömer Faruk Bitikçioğlu

% knowledge base

flight(istanbul,izmir).
flight(istanbul,antalya).
flight(istanbul,gaziantep).
flight(istanbul,ankara).
flight(istanbul,van).
flight(istanbul,rize).
flight(izmir,isparta).
flight(isparta,burdur).
flight(antalya,konya).
flight(antalya,gaziantep).
flight(konya,ankara).
flight(ankara,van).
flight(van,rize).
flight(edirne,edremit).
flight(edremit,erzincan).

% rules

route(X,Y) :- flight(X,Y).

