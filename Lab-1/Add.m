%% Генерация одиночного прямоугольного импульса rectpuls
t = -5:0.1:5;
y = rectpuls(t);
plot(t,y);

%%
t = -5:0.1:5;
w = 3;
y = rectpuls(t-2, w);
plot(t, y);

%% Генерация периодической последовательности прямоугольных импульсов square
t = 0:0.1:20;
x = square(t);
plot(t, x);

%%
t = 0:0.1:20;
x = square(t, 15);
plot(t, x);

%%
t = 0:0.1:20;
x = square(t, 85);
plot(t, x);

%% Генерация одиночного треугольного импульса tripuls
t = -10:0.1:10;
y = tripuls(t);
plot(t, y);

%%
t = -10:0.1:10;
y = tripuls(t, 7);
plot(t, y);

%%
t = -10:0.1:10;
y1 = tripuls(t+5, 5, -1);
y2 = tripuls(t, 5);
y3 = tripuls(t-5, 5, 1);
plot(t, y1, t, y2, t, y3);

%% Генерация периодического пилообразного сигнала sawtooth
t = 0:0.01:10;
y = sawtooth(2*pi*t);
plot(t, y);

%%
t = 0:0.01:10;
y = sawtooth(2*pi*t, 0.5);
plot(t, y);

%%
t = 0:0.01:10;
y = sawtooth(2*pi*t, 0);
plot(t, y);

%% Генерация последовательности импульсов произвольной формы pulstran
t = 0:1/1e3:60;
%d = 0:10:60;
%d = [0:10:60;sin(2*pi*0.05*(0:10:60))]';
%d = [0:5:60;sin(2*pi*0.05*(0:5:60))]';
d = [0:2:60;sin(2*pi*0.05*(0:2:60))]';
x = @rectpuls;
y = pulstran(t,d,x);

plot(t,y)
grid on

%%
fs = 1e3;
t = 0:1/1e3:1;
d = 0:1/3:1;   
x = tripuls(t,0.2,1);
y = pulstran(t,d,x, fs);

plot(t,y)
%hold off
%xlabel('Time (s)')
%ylabel('Waveform')

%%
t = 0:1/50e3:10e-3;
d = [0:1/1e3:10e-3; 0.8.^(0:10)]';

y = pulstran(t, d, 'gauspuls', 10e3, 0.5);
plot(t, y);

%% Генерация сигнала с изменяющейся частотой chirp
t = 0:1/1e3:1;
y = chirp(t,0,0.5,100);

plot(t,y)
%%
specgram(y, 256, 1e3, 256, 250);

%% Quadratic
t = 0:1e-3:2;
y = chirp(t, 100, 1, 200, "quadratic");
specgram(y, 128, 1e3, 128, 120);
%%
spectrogram(y, %100, 10, [], 1e3, 'yaxis')
spectrogram(y, 50, 10, 1e3, 'yaxis')
colormap parula
title("Quadratic Chirp");

%% Convex
t = -1:1e-3:1;
f0 = 100;
f1 = 400;

y = chirp(t, f0, 1, f1, 'q', [], 'convex');
spectrogram(y, 100, 10, [], 1e3, 'yaxis');

%% Concave
t = -1:1e-3:1;
f0 = 100;
f1 = 400;

y = chirp(t, f0, 1, f1, 'q', [], 'concave');
spectrogram(y, 100, 10, [], 1e3, 'yaxis');