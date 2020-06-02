clear all
close all

%Task 2.1
% Number 1.

MTTF =2
lamda = 1/MTTF

lamda_T=lamda/1000000

disp('The MTTF of a single Transistor')
MTTF_single_transistor = 1/lamda_T


%Number 2.

e = -(lamda*1)
disp('The probability that the processor will fail in its first year of operation')

probability_of_component=1-exp(e)



%Number 3.

relaibility_t = 0.5
disp('The processor work with a reliability of more than 50%')

time_t_of_processor= log(relaibility_t)/(-lamda)

%Number 4.

e8 = -(lamda*8)
e5 = -(lamda*5)
e4 = -(lamda*4)
probability_of_component8=1-exp(e8)
probability_of_component5=1-exp(e5)
probability_of_component4=1-exp(e4)



probability_of_year_4_and_5 = probability_of_component5 - probability_of_component4
probability_of_year_4_and_8 = probability_of_component8 - probability_of_component4
disp('The probability that the processor will fail in its five year of operation')
probability_of_component = probability_of_year_4_and_5/probability_of_year_4_and_8 


%Number 5.

relaibility_t = 0.5
disp('The maximum value of lamda_T, the processor has a realiability of 50% after 2 years')

lamda_T= log(relaibility_t)/(-1000000*2)

disp('MTTF of the processor')

MTTF = 1/(lamda_T*1000000)

MTTF = ceil(MTTF)


%Task 2.2
% A system consisting of a single component
%Solution for 2.2.(1)
x_prob = 1:-0.1:0

X = [x_prob]
%probability = 0:0.1:1
lamda=2
y_RelOneSer = x_prob
y_RelTwoSer = x_prob.^2
y_RelFourSer = x_prob.^4
y_RelTwoPar = 1-(1-x_prob).^2
y_RelFourPar = 1-(1-x_prob).^4
%Y = [y_RelOneSer,y_RelTwoSer]
figure(1)
plot(X, y_RelOneSer, X, y_RelTwoSer, X, y_RelFourSer, X, y_RelTwoPar, X, y_RelFourPar)
set(gca, 'xdir', 'reverse')
xlabel('R(t) Reliability Single Component')
ylabel('R(t) Reliability')



%Solution for 2.2.(2)
%lamda = 2 per year
x_time = 0:0.1:2

X = [x_time]
%probability = 0:0.1:1
lamda=2
y_RelOneSer = exp(-lamda*x_time)
y_RelTwoSer = exp(-lamda*2*x_time)
y_RelFourSer = exp(-lamda*4*x_time)
y_RelTwoPar = 1-(1- exp(-lamda * x_time)).^2
y_RelFourPar = 1-(1- exp(-lamda * x_time)).^4
%Y = [y_RelOneSer,y_RelTwoSer]
figure(2)
plot(X, y_RelOneSer, X, y_RelTwoSer, X, y_RelFourSer, X, y_RelTwoPar, X, y_RelFourPar)

xlabel('t value')
ylabel('R(t) Reliability')



%Task 2.4
% Plot upper bound, lower bound and system's realiability in single chart
%Solution like as for 2.2.(1)
x_prob = 1:-0.1:0

X = [x_prob]
%probability = 0:0.1:1
%lamda=2
%y_RelOneSer = x_prob
y_RealiabilitySys = x_prob.^2 + x_prob.^3 - 3*x_prob.^5 + x_prob.^4 + x_prob.^6
y_RealiabilitySysUpper = x_prob.^2 + x_prob.^3 - x_prob.^5 + x_prob.^4 - x_prob.^6 - x_prob.^7 + x_prob.^9
y_RealiabilitySysLower = ((1-(1-x_prob).^2).^5).*(1-(1-x_prob).^3)
%y_RelFourPar = 1-(1-x_prob).^4
%Y = [y_RelOneSer,y_RelTwoSer]
figure(3)
plot(X, y_RealiabilitySysUpper, X, y_RealiabilitySys,  X, y_RealiabilitySysLower)
set(gca, 'xdir', 'reverse')
xlabel('R(t)')
ylabel('R(t) System Reliability')
legend('Upper Bound','System','Lower Bound')


%Task 2.5
% A system consisting of a single component
%Solution for 2.(a)
x_prob = 1:-0.1:0

X = [x_prob]
%probability = 0:0.1:1
lamda=2

y_RelMoutofN = 3*x_prob.^2 - 2*x_prob.^3
%Y = [y_RelOneSer,y_RelTwoSer]
figure(1)
hold on
plot(X, y_RelMoutofN)
set(gca, 'xdir', 'reverse')
xlabel('R(t) Reliability Single Component')
ylabel('R(t) Reliability')


%Task 2.5
%Solution for 2.(b)
%lamda = 2 per year
x_time = 0:0.1:2

X = [x_time]
%probability = 0:0.1:1
lamda=2

y_RelMoutofN = 3* exp(-lamda * x_time).^2 - 2* exp(-lamda * x_time).^3
%Y = [y_RelOneSer,y_RelTwoSer]
figure(2)
hold on
plot(X, y_RelMoutofN)

xlabel('t value')
ylabel('R(t) Reliability')

