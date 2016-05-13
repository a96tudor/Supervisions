%getting the data from the three files

apple = dlmread('apple.csv',',',[1 0 168 1]); 
apple_price = apple(:,2);

ibm = dlmread('ibm.csv',',',[1 0 168 1]);
ibm_price = ibm(:,2);

microsoft = dlmread('microsoft.csv',',',[1 0 168 1]);
microsoft_price = microsoft(:,2);

DATES = apple(:,1);

%working on the data, to find the number of stocks we could have 
%bought with 399$

INVEST = 399;
No_apple = INVEST / apple(168,2);
No_ibm = INVEST / ibm(168,2);
No_microsoft = INVEST / microsoft(168,2);

%labeling the graph

xlabel('Years  ','fontsize',15,'FontWeight','bold','Color','b');
ylabel('Value of the investment  ','fontsize',15,'FontWeight','bold','Color','b');
xlim([2001 2018]);
ylim([0 35000]);
title('Value of the investment/Time  ','fontsize',15,'FontWeight','bold','Color','b');
set(gca,'fontsize',15);

%plotting the graph

hold on

plot(DATES,No_microsoft*microsoft_price,'r-');
plot(DATES,No_ibm*ibm_price,'b-');
plot(DATES,No_apple*apple_price,'g-');
legend('Microsoft  ','IBM  ','Apple  ');

hold off;

% finding today's value of the investment

apple_today = No_apple * apple_price(1);
ibm_today = No_ibm * ibm_price(1);
microsoft_today = No_microsoft * microsoft_price(1);

