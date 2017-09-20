%±àÐ´Ä¿±êº¯Êý
function [ sol,eval] = fitness(sol,options)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
       x=sol(1); 
       eval=x+10*sin(5*x)+7*cos(4*x); 

end

