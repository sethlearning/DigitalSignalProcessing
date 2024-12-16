%% Синусоидальный сигнал
x = linspace(0, 15, 500);
y = sin(x);
subplot(1,2,1); 
plot(x, y);
% Спектрограмма
subplot(1,2,2);
specgram(y);

%% Полигармоническое колебание, включающее три гармонических сигнала
subplot(1,2,1);
x = linspace(0, 15, 500);
y = 10*sin(x) + 4*sin(2*x) + 3*sin(12*x);
plot(x,y);
% Спектрограмма
subplot(1,2,2);
specgram(y);

%% Низкочастотный полигармонический сигнал
subplot(1,2,1);
x = linspace(-5, 5, 300);
y = sin(2*pi*30*x) + sin(2*pi*60*x) + sin(2*pi*120*x);
plot(x, y);
% Спектрограмма
subplot(1,2,2);
specgram(y);

%% Высокочастотный полигармонический сигнал
subplot(1,2,1);
x = linspace(-5, 5, 300);
y = sin(2*pi*1000*x) + sin(2*pi*6000*x) + sin(2*pi*2500*x);
plot(x, y);
% Спектрограмма
subplot(1,2,2);
specgram(y);

%% Одиночные треугольные импульсы
x = linspace(-5, 5, 300);
y1 = tripuls(x+3, 2, -1);
y2 = tripuls(x, 2, 0);
y3 = tripuls(x-3, 2, 1);
subplot(1,1,1);
plot(x, y1, x, y2, x, y3);

%% Последовательность треугольных импульсов
x = linspace(-20, 20, 500);
y = sawtooth(x, 0.75);
plot(x, y);

%% График случайного сигнала (гипербола):
x = linspace(-100, 100, 300);
y = 20.0./x; % (./ - поэлементная операция; / - матричная операция)
plot(x, y);
specgram(y);

%% Амплитудная модуляция
%x_nes = 5*sin(50*x);
%x_mod = sin(x);
x = linspace(-10, 10, 1000);
AM = 5*(1 + 0.5*sin(x)).*sin(25*x);
AM = 3*(2 + sin(x)).*sin(15*x);
subplot(1,2,1);
plot(x, AM);
subplot(1,2,2);
% Спектрограмма
specgram(AM);

%% Частотная модуляция
x = linspace(0, 6, 1000);
FM=sin(10*x + 7*sin(x));
subplot(1,2,1);
plot(x, FM);
subplot(1,2,2);
% Спектрограмма
specgram(FM);