% GETTING THE DATA FROM "cambridge.dat" 

data=dlmread ('cambridge.dat','',4,0);

% PROCESSING THE DATA 
year = data(:,1);
month = data(:,2);
time = year + (month - 1)/12;

%GETTING THE MEAN TEMPERATURE
temps = data(:,[3,4]);
Mean = mean(temps,2); 

%SETTING a0, CONSIDERING THE VALUES FROM THE Mean/Time GRAPH
a0 = [6, 1.5, 6, 0.7];

% SETTING THE fmin AND yfit
fmin = fminsearch(@(fmin) slopingsine(fmin,time,Mean),a0);
yfit = fmin(1)+fmin(2)*(time-1961)+fmin(3)*sin(2*pi*time+fmin(4));

MeanLine = fmin(1) + fmin(2)*(time-1961);

hold on
%
%LABELING AND SETTING THE X AND Y AXIS
%
xlabel(' TIME (years) ','FontSize',14);
ylabel(' Mean Temperature (Celsius Degrees)','FontSize',14);
title('Mean Temperature / Time', 'FontSize', 14);
xlim([1960,2011]);
ylim([-6,25]);
set(gca,'FontSize',12);
%
%PLOTTING THE ACTUAL GRAPHS
%
plot(time, Mean,'-r');
plot(time,yfit,'--b');
plot(time,MeanLine,'k');
hold off;
%
%CREATING THE HISTOGRAM
%
ydata = data(:,6);
xdata = [5:10:185];
figure;
hist(ydata,xdata);
xlim ([0,180]);
title('Monthly rainfall vs Number of months','fontsize',14); 
xlabel('Monthly rainfall','fontsize',14);
ylabel('Number of months','fontsize',14);




