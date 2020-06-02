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

time_t_of_processor= expinv(relaibility_t)/(lamda)

%Number 4.

e = -(lamda*5)
disp('The probability that the processor will fail in its five year of operation')

probability_of_component=1-exp(e)

%Number 5.

relaibility_t = 0.5
disp('The maximum value of lamda_T, the processor has a realiability of 50% after 2 years')

lamda_T= expinv(relaibility_t)/(1000000*2)

disp('MTTF of the processor')

MTTF = 1/(lamda_T*1000000)

MTTF = ceil(MTTF)
