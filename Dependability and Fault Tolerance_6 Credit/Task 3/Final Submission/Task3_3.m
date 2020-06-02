clear all;
close all;
format long

%Task 3.3
%Subtask 2


failure_rate =2;
per=[0, .5, 1, 1.5, 2]
temp=[2, 1.5, 1, .5, 0]
repair_rate=100;
t = [0:0.01:1]; 	% t is a vector of time values from 0 to 1

% Markov model for a system component
% The model has 5 states

% the initial state probabilities
P0 = [1, 0,0,0];	% P0(1)=1 means: the system starts in state 1 with probability 1
% transition rate matrix Q = [q11, q12; q21; q22]
% q12 = transition rate from state 1 to state 2
%for k=1:5
lamda_P=0
lamda_T=2
    Q = [-3*lamda_P-3*lamda_T, 3*lamda_P, 3*lamda_T, 0;
         0, -2*lamda_P-2*lamda_T, 0, 2*lamda_P+ 2*lamda_T;
         repair_rate, lamda_P, -3*lamda_P-2*lamda_T-repair_rate, 2*lamda_P+ 2*lamda_T;
         0, 0, 0, 0];

    for i = 1:length(t)
        P(i,:) = P0 * expm(Q*t(i));   % expm computes the matrix exponential
        % row i of P now contains the state probability vector for time t(i)
    end
    
    R1 = 1- P(:,4);                 % the reliability R(t) of the system is the probability of (still) being in state 1 at time t
%Rfa = 1-(1- exp(-failure_rate * t)').^4
%Rf = exp(-failure_rate*t)';  % for comparison: the closed formula for the reliability of a single component
%[R, Rfa, R-Rfa]
lamda_P=.5
lamda_T=1.5
    Q = [-3*lamda_P-3*lamda_T, 3*lamda_P, 3*lamda_T, 0;
         0, -2*lamda_P-2*lamda_T, 0, 2*lamda_P+ 2*lamda_T;
         repair_rate, lamda_P, -3*lamda_P-2*lamda_T-repair_rate, 2*lamda_P+ 2*lamda_T;
         0, 0, 0, 0];

    for i = 1:length(t)
        P(i,:) = P0 * expm(Q*t(i));   % expm computes the matrix exponential
        % row i of P now contains the state probability vector for time t(i)
    end
    
    R2 = 1- P(:,4); 
    
lamda_P=1
lamda_T=1
    Q = [-3*lamda_P-3*lamda_T, 3*lamda_P, 3*lamda_T, 0;
         0, -2*lamda_P-2*lamda_T, 0, 2*lamda_P+ 2*lamda_T;
         repair_rate, lamda_P, -3*lamda_P-2*lamda_T-repair_rate, 2*lamda_P+ 2*lamda_T;
         0, 0, 0, 0];

    for i = 1:length(t)
        P(i,:) = P0 * expm(Q*t(i));   % expm computes the matrix exponential
        % row i of P now contains the state probability vector for time t(i)
    end
    
    R3 = 1- P(:,4);                 % the reliability R(t) of the system is the probability of (still) being in state 1 at time t
%Rfa = 1-(1- exp(-failure_rate * t)').^4
%Rf = exp(-failure_rate*t)';  % for comparison: the closed formula for the reliability of a single component
%[R, Rfa, R-Rfa]
lamda_P=1.5
lamda_T=0.5
    Q = [-3*lamda_P-3*lamda_T, 3*lamda_P, 3*lamda_T, 0;
         0, -2*lamda_P-2*lamda_T, 0, 2*lamda_P+ 2*lamda_T;
         repair_rate, lamda_P, -3*lamda_P-2*lamda_T-repair_rate, 2*lamda_P+ 2*lamda_T;
         0, 0, 0, 0];

    for i = 1:length(t)
        P(i,:) = P0 * expm(Q*t(i));   % expm computes the matrix exponential
        % row i of P now contains the state probability vector for time t(i)
    end
    
    R4 = 1- P(:,4); 
    
lamda_P=2
lamda_T=0
    Q = [-3*lamda_P-3*lamda_T, 3*lamda_P, 3*lamda_T, 0;
         0, -2*lamda_P-2*lamda_T, 0, 2*lamda_P+ 2*lamda_T;
         repair_rate, lamda_P, -3*lamda_P-2*lamda_T-repair_rate, 2*lamda_P+ 2*lamda_T;
         0, 0, 0, 0];

    for i = 1:length(t)
        P(i,:) = P0 * expm(Q*t(i));   % expm computes the matrix exponential
        % row i of P now contains the state probability vector for time t(i)
    end
    
    R5 = 1- P(:,4);    
    
    Rfb = exp(-failure_rate*1*t)'
    
    figure(1)
    hold on
    plot(t, R1,t,R2,t,R3,t,R4,t,R5,t, Rfb)

    xlabel('t value')
    ylabel('R(t) Reliability')
    legend('R1','R2','R3', 'R4', 'R5','Rfb')
%end subtask 3.3.2


% Subtask 3, part - 1, Miu =100000

failure_rate =2;
per=[0, .5, 1, 1.5, 2]
temp=[2, 1.5, 1, .5, 0]
repair_rate=100000;
t = [0:0.01:1]; 	% t is a vector of time values from 0 to 1

% Markov model for a system component
% The model has 5 states

% the initial state probabilities
P0 = [1, 0,0,0];	% P0(1)=1 means: the system starts in state 1 with probability 1
% transition rate matrix Q = [q11, q12; q21; q22]
% q12 = transition rate from state 1 to state 2
%for k=1:5
lamda_P=0
lamda_T=2
    Q = [-3*lamda_P-3*lamda_T, 3*lamda_P, 3*lamda_T, 0;
         0, -2*lamda_P-2*lamda_T, 0, 2*lamda_P+ 2*lamda_T;
         repair_rate, lamda_P, -3*lamda_P-2*lamda_T-repair_rate, 2*lamda_P+ 2*lamda_T;
         0, 0, 0, 0];

    for i = 1:length(t)
        P(i,:) = P0 * expm(Q*t(i));   % expm computes the matrix exponential
        % row i of P now contains the state probability vector for time t(i)
    end
    
    R1 = 1- P(:,4);                 % the reliability R(t) of the system is the probability of (still) being in state 1 at time t
%Rfa = 1-(1- exp(-failure_rate * t)').^4
%Rf = exp(-failure_rate*t)';  % for comparison: the closed formula for the reliability of a single component
%[R, Rfa, R-Rfa]
lamda_P=.5
lamda_T=1.5
    Q = [-3*lamda_P-3*lamda_T, 3*lamda_P, 3*lamda_T, 0;
         0, -2*lamda_P-2*lamda_T, 0, 2*lamda_P+ 2*lamda_T;
         repair_rate, lamda_P, -3*lamda_P-2*lamda_T-repair_rate, 2*lamda_P+ 2*lamda_T;
         0, 0, 0, 0];

    for i = 1:length(t)
        P(i,:) = P0 * expm(Q*t(i));   % expm computes the matrix exponential
        % row i of P now contains the state probability vector for time t(i)
    end
    
    R2 = 1- P(:,4); 
    
lamda_P=1
lamda_T=1
    Q = [-3*lamda_P-3*lamda_T, 3*lamda_P, 3*lamda_T, 0;
         0, -2*lamda_P-2*lamda_T, 0, 2*lamda_P+ 2*lamda_T;
         repair_rate, lamda_P, -3*lamda_P-2*lamda_T-repair_rate, 2*lamda_P+ 2*lamda_T;
         0, 0, 0, 0];

    for i = 1:length(t)
        P(i,:) = P0 * expm(Q*t(i));   % expm computes the matrix exponential
        % row i of P now contains the state probability vector for time t(i)
    end
    
    R3 = 1- P(:,4);                 % the reliability R(t) of the system is the probability of (still) being in state 1 at time t
%Rfa = 1-(1- exp(-failure_rate * t)').^4
%Rf = exp(-failure_rate*t)';  % for comparison: the closed formula for the reliability of a single component
%[R, Rfa, R-Rfa]
lamda_P=1.5
lamda_T=0.5
    Q = [-3*lamda_P-3*lamda_T, 3*lamda_P, 3*lamda_T, 0;
         0, -2*lamda_P-2*lamda_T, 0, 2*lamda_P+ 2*lamda_T;
         repair_rate, lamda_P, -3*lamda_P-2*lamda_T-repair_rate, 2*lamda_P+ 2*lamda_T;
         0, 0, 0, 0];

    for i = 1:length(t)
        P(i,:) = P0 * expm(Q*t(i));   % expm computes the matrix exponential
        % row i of P now contains the state probability vector for time t(i)
    end
    
    R4 = 1- P(:,4); 
    
lamda_P=2
lamda_T=0
    Q = [-3*lamda_P-3*lamda_T, 3*lamda_P, 3*lamda_T, 0;
         0, -2*lamda_P-2*lamda_T, 0, 2*lamda_P+ 2*lamda_T;
         repair_rate, lamda_P, -3*lamda_P-2*lamda_T-repair_rate, 2*lamda_P+ 2*lamda_T;
         0, 0, 0, 0];

    for i = 1:length(t)
        P(i,:) = P0 * expm(Q*t(i));   % expm computes the matrix exponential
        % row i of P now contains the state probability vector for time t(i)
    end
    
    R5 = 1- P(:,4);    
    Rfb = exp(-failure_rate*1*t)'
    
    figure(2)
    hold on
    plot(t, R1,t,R2,t,R3,t,R4,t,R5, t, Rfb)

    xlabel('t value')
    ylabel('R(t) Reliability')
    legend('R1','R2','R3', 'R4', 'R5', 'Rfb')
    
%end Subtask 3.3.3 part -1 for miu =100000


% Subtask 3, part - 2, Miu =1

failure_rate =2;
per=[0, .5, 1, 1.5, 2]
temp=[2, 1.5, 1, .5, 0]
repair_rate=1;
t = [0:0.01:1]; 	% t is a vector of time values from 0 to 1

% Markov model for a system component
% The model has 5 states

% the initial state probabilities
P0 = [1, 0,0,0];	% P0(1)=1 means: the system starts in state 1 with probability 1
% transition rate matrix Q = [q11, q12; q21; q22]
% q12 = transition rate from state 1 to state 2
%for k=1:5
lamda_P=0
lamda_T=2
    Q = [-3*lamda_P-3*lamda_T, 3*lamda_P, 3*lamda_T, 0;
         0, -2*lamda_P-2*lamda_T, 0, 2*lamda_P+ 2*lamda_T;
         repair_rate, lamda_P, -3*lamda_P-2*lamda_T-repair_rate, 2*lamda_P+ 2*lamda_T;
         0, 0, 0, 0];

    for i = 1:length(t)
        P(i,:) = P0 * expm(Q*t(i));   % expm computes the matrix exponential
        % row i of P now contains the state probability vector for time t(i)
    end
    
    R1 = 1- P(:,4);                 % the reliability R(t) of the system is the probability of (still) being in state 1 at time t
%Rfa = 1-(1- exp(-failure_rate * t)').^4
%Rf = exp(-failure_rate*t)';  % for comparison: the closed formula for the reliability of a single component
%[R, Rfa, R-Rfa]
lamda_P=.5
lamda_T=1.5
    Q = [-3*lamda_P-3*lamda_T, 3*lamda_P, 3*lamda_T, 0;
         0, -2*lamda_P-2*lamda_T, 0, 2*lamda_P+ 2*lamda_T;
         repair_rate, lamda_P, -3*lamda_P-2*lamda_T-repair_rate, 2*lamda_P+ 2*lamda_T;
         0, 0, 0, 0];

    for i = 1:length(t)
        P(i,:) = P0 * expm(Q*t(i));   % expm computes the matrix exponential
        % row i of P now contains the state probability vector for time t(i)
    end
    
    R2 = 1- P(:,4); 
    
lamda_P=1
lamda_T=1
    Q = [-3*lamda_P-3*lamda_T, 3*lamda_P, 3*lamda_T, 0;
         0, -2*lamda_P-2*lamda_T, 0, 2*lamda_P+ 2*lamda_T;
         repair_rate, lamda_P, -3*lamda_P-2*lamda_T-repair_rate, 2*lamda_P+ 2*lamda_T;
         0, 0, 0, 0];

    for i = 1:length(t)
        P(i,:) = P0 * expm(Q*t(i));   % expm computes the matrix exponential
        % row i of P now contains the state probability vector for time t(i)
    end
    
    R3 = 1- P(:,4);                 % the reliability R(t) of the system is the probability of (still) being in state 1 at time t
%Rfa = 1-(1- exp(-failure_rate * t)').^4
%Rf = exp(-failure_rate*t)';  % for comparison: the closed formula for the reliability of a single component
%[R, Rfa, R-Rfa]
lamda_P=1.5
lamda_T=0.5
    Q = [-3*lamda_P-3*lamda_T, 3*lamda_P, 3*lamda_T, 0;
         0, -2*lamda_P-2*lamda_T, 0, 2*lamda_P+ 2*lamda_T;
         repair_rate, lamda_P, -3*lamda_P-2*lamda_T-repair_rate, 2*lamda_P+ 2*lamda_T;
         0, 0, 0, 0];

    for i = 1:length(t)
        P(i,:) = P0 * expm(Q*t(i));   % expm computes the matrix exponential
        % row i of P now contains the state probability vector for time t(i)
    end
    
    R4 = 1- P(:,4); 
    
lamda_P=2
lamda_T=0
    Q = [-3*lamda_P-3*lamda_T, 3*lamda_P, 3*lamda_T, 0;
         0, -2*lamda_P-2*lamda_T, 0, 2*lamda_P+ 2*lamda_T;
         repair_rate, lamda_P, -3*lamda_P-2*lamda_T-repair_rate, 2*lamda_P+ 2*lamda_T;
         0, 0, 0, 0];

    for i = 1:length(t)
        P(i,:) = P0 * expm(Q*t(i));   % expm computes the matrix exponential
        % row i of P now contains the state probability vector for time t(i)
    end
    
    R5 = 1- P(:,4);    
    Rfb = exp(-failure_rate*1*t)'
    
    figure(3)
    hold on
    plot(t, R1,t,R2,t,R3,t,R4,t,R5,t , Rfb)

    xlabel('t value')
    ylabel('R(t) Reliability')
    legend('R1','R2','R3', 'R4', 'R5', 'Rfb')
    
%end Subtask 3.3.3 part 2,  for miu =1
