clear all;
close all;
format long

failure_rate = 2;
t = [0:0.1:2]; 	% t is a vector of time values from 0 to 2

% Markov model for a system consisting of a single non-fault-tolerant component
% The model has two states: (1) functioning and (2) failed

% the initial state probabilities
P0 = [1, 0];	% P0(1)=1 means: the system starts in state 1 with probability 1
% transition rate matrix Q = [q11, q12; q21; q22]
% q12 = transition rate from state 1 to state 2
Q = [-failure_rate, failure_rate;
		0,	0];

for i = 1:length(t)
    P(i,:) = P0 * expm(Q*t(i));   % expm computes the matrix exponential
	% row i of P now contains the state probability vector for time t(i)
end    
R = P(:,1); 			% the reliability R(t) of the system is the probability of (still) being in state 1 at time t
Rf = exp(-failure_rate*t)';  % for comparison: the closed formula for the reliability of a single component
[R, Rf, R-Rf]
