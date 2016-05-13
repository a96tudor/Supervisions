function chisq=slopingsine(Xs,time,Mean)
%Computes chi-squared function
chi=Mean-(Xs(1)+Xs(2)*(time-1961)+Xs(3)*sin(2*pi*time+Xs(4)));
chisq= sum (chi.^2);