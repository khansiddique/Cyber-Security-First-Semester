% A system consisting of a single component
%lamda = 2 per year
x_time = 0:0.1:2

X = [x_time]
%probability = 0:0.1:1

y_RelOneSer = exp(-2*x_time)

Y = [y_RelOneSer]
plot(X,Y)

xlable 't value', ylable 'R(t) reliability'

