clear all;
close all;
format long

%Task 3.1
%Figure (a)
failure_rate = 2;
t = [0:0.1:2]; 	% t is a vector of time values from 0 to 2

% Markov model for a system component
% The model has 5 states

% the initial state probabilities
P0 = [1, 0,0,0,0];	% P0(1)=1 means: the system starts in state 1 with probability 1
% transition rate matrix Q = [q11, q12; q21; q22]
% q12 = transition rate from state 1 to state 2
Q = [-4*failure_rate, 4*failure_rate, 0, 0, 0;
     0, -3*failure_rate, 3*failure_rate, 0, 0;
     0, 0, -2*failure_rate, 2*failure_rate, 0;
     0, 0, 0, -failure_rate, failure_rate;
	 0, 0, 0, 0, 0];

for i = 1:length(t)
    P(i,:) = P0 * expm(Q*t(i));   % expm computes the matrix exponential
	% row i of P now contains the state probability vector for time t(i)
end    
R = 1- P(:,5);                 % the reliability R(t) of the system is the probability of (still) being in state 1 at time t
Rfa = 1-(1- exp(-failure_rate * t)').^4
%Rf = exp(-failure_rate*t)';  % for comparison: the closed formula for the reliability of a single component
[R, Rfa, R-Rfa]

% ----------- end of figure (a) --------------------
%Figure (b)

% Markov model for a system component
% The model has 5 states

% the initial state probabilities
P0b = [1, 0];	% P0(1)=1 means: the system starts in state 1 with probability 1
% transition rate matrix Q = [q11, q12; q21; q22]
% q12 = transition rate from state 1 to state 2
Qb = [-4*failure_rate, 4*failure_rate;
	 0, 0];

for i = 1:length(t)
    Pb(i,:) = P0b * expm(Qb*t(i));   % expm computes the matrix exponential
	% row i of P now contains the state probability vector for time t(i)
end    
R = 1-Pb(:,2);                 % the reliability R(t) of the system is the probability of (still) being in state 1 at time t
Rfb = exp(-failure_rate*4*t)'
%Rf = exp(-failure_rate*t)';  % for comparison: the closed formula for the reliability of a single component
[R, Rfb, R-Rfb]

% ----------- end of figure (b) --------------------

%Figure (c)

% Markov model for a system component
% The model has 5 states

% the initial state probabilities
P0c = [1, 0, 0,0];	% P0(1)=1 means: the system starts in state 1 with probability 1
% transition rate matrix Q = [q11, q12; q21; q22]
% q12 = transition rate from state 1 to state 2
Qc = [-4*failure_rate, 4*failure_rate, 0, 0;
     0, -3*failure_rate, 1*failure_rate, 2*failure_rate;
      0, 0, -2*failure_rate, 2*failure_rate;
	 0, 0, 0, 0];

for i = 1:length(t)
    Pc(i,:) = P0c * expm(Qc*t(i));   % expm computes the matrix exponential
	% row i of P now contains the state probability vector for time t(i)
end    
R = 1-Pc(:,4);                 % the reliability R(t) of the system is the probability of (still) being in state 1 at time t
Rfc = (2*exp(-failure_rate*2*t)' - 1*(exp(-failure_rate*4*t)')) 
%Rf = exp(-failure_rate*t)';  % for comparison: the closed formula for the reliability of a single component
[R, Rfc, R-Rfc]

% ----------- end of figure (c) --------------------

%Figure (d)

% Markov model for a system component
% The model has 5 states

% the initial state probabilities
P0d = [1, 0, 0, 0, 0];	% P0(1)=1 means: the system starts in state 1 with probability 1
% transition rate matrix Q = [q11, q12; q21; q22]
% q12 = transition rate from state 1 to state 2
Qd = [-4*failure_rate, 2*failure_rate,2*failure_rate, 0, 0;
      0, 0, -3*failure_rate, 2*failure_rate,failure_rate ;
      0,0, -3*failure_rate, 2*failure_rate,failure_rate ;
      0,0, 0, -2* failure_rate, 2* failure_rate;
	  0, 0, 0,0,0];

for i = 1:length(t)
    Pd(i,:) = P0d * expm(Qd*t(i));   % expm computes the matrix exponential
	% row i of P now contains the state probability vector for time t(i)
end    
R = 1-Pd(:,5);                 % the reliability R(t) of the system is the probability of (still) being in state 1 at time t
Rfd = (exp(-failure_rate*4*t)' - 4*(exp(-failure_rate*3*t)') + 4*(exp(-failure_rate*2*t)')) 
%Rf = exp(-failure_rate*t)';  % for comparison: the closed formula for the reliability of a single component
[R, Rfd, R-Rfd]

% ----------- end of figure (d) --------------------

%Figure (e)

% Markov model for a system component
% The model has 5 states

% the initial state probabilities
P0e = [1, 0, 0, 0, 0,0,0,0];	% P0(1)=1 means: the system starts in state 1 with probability 1
% transition rate matrix Q = [q11, q12; q21; q22]
% q12 = transition rate from state 1 to state 2
Qe = [-5*failure_rate, 4*failure_rate,0,0,1*failure_rate,0, 0, 0;
      0, -4*failure_rate, 2*failure_rate, failure_rate,0,failure_rate,0,0;
      0,0, -3*failure_rate, 2*failure_rate,0,0, failure_rate,0;
       0,0,0, -1*failure_rate,0,0, 0,failure_rate;
     0,0,0,0, -4*failure_rate, 4*failure_rate,0,0;
      0,0,0,0,0, -3*failure_rate, 2*failure_rate, failure_rate;
       0,0,0,0,0,0, -2*failure_rate, 2*failure_rate;
	  0,0,0,0, 0, 0,0,0];

for i = 1:length(t)
    Pe(i,:) = P0e * expm(Qe*t(i));   % expm computes the matrix exponential
	% row i of P now contains the state probability vector for time t(i)
end    
R = 1-Pe(:,8);                 % the reliability R(t) of the system is the probability of (still) being in state 1 at time t
Rfe = ( exp(-failure_rate*1*t)' - exp(-failure_rate*5*t)'+5* exp(-failure_rate*4*t)'- 8*(exp(-failure_rate*3*t)') + 4*(exp(-failure_rate*2*t)')) 
%Rf = exp(-failure_rate*t)';  % for comparison: the closed formula for the reliability of a single component
[R, Rfe, R-Rfe]

% ----------- end of figure (e) --------------------