% ==========================================================
% ============ PART 1a SCIENTIFIC COMPUTING ================
% =================== ASSESSED TASK 3 ======================
% ================== Tudor Mihai Avram =====================
% ======== Homerton College, University of Cambridge =======
% ======= tma33@cam.ac.uk / a96tudor@gmail.com =============
% ===================== 16 Jan 2016 ========================
% ==========================================================

% Creating the colormap for the mesh and contour 

mult = 0.025;

for i=0:40
    colorMap(i+1, 1) = i * mult;
    colorMap(i+1, 2) = (20 - abs(20 - i)) * mult;
    colorMap(i+1, 3) = (40 - i) * mult;
end

% Surface discratization

plotSpace = linspace(-10, 10, 200);
[x, y] = meshgrid(plotSpace,plotSpace);

pxOrb = pxOrbital(x, y, 0); % values of px(x,y,0)

figure1 = figure;

mesh(x,y,pxOrb);
gca1 = gca;
colormap(colorMap);
% Setting the axis limits
xlim([-10 10]);
ylim([-10 10]);
zlim([-0.3 0.3]);
% Setting the graphic & labels 
set(figure1,'Units','centimeters');
set(figure1,'PaperUnits','centimeters');
set(figure1,'PaperPosition',[0 0 15 10]);
set(gca1,'fontsize', 13, 'fontname', 'arial'); 
set(gca1,'XTick',[-10:3:10]);
set(gca1,'YTick',[-10:2:10]);
set(gca1,'ZTick',[-0.3:0.1:0.3]);
xlabel('$x$','fontsize',25,'interpreter','latex');
ylabel('$y$','fontsize',25,'interpreter','latex');
zlabel('$px(x,y,0)$','fontsize',25,'interpreter','latex');

% doing the same thing for dxy(x,y,0)

dxyOrb = dxyOrbital(x,y,0);
figure2 = figure;

mesh(x,y,dxyOrb);
gca2 = gca;
colormap(colorMap);
% Setting the axis limits
xlim([-10 10]);
ylim([-10 10]);
zlim([-0.3 0.3]);
% Setting the graphic & labels 
set(figure2,'Units','centimeters');
set(figure2,'PaperUnits','centimeters');
set(figure2,'PaperPosition',[0 0 15 10]);
set(gca2,'fontsize', 13, 'fontname', 'arial'); 
set(gca2,'XTick',[-10:3:10]);
set(gca2,'YTick',[-10:2:10]);
set(gca2,'ZTick',[-0.3:0.1:0.3]);
xlabel('$x$','fontsize',25,'interpreter','latex');
ylabel('$y$','fontsize',25,'interpreter','latex');
zlabel('$dxy(x,y,0)$','fontsize',25,'interpreter','latex');


% making the contour for px(x,y,0)

figure3 = figure;

contour(x,y,pxOrb,[-0.3 : 0.03 : 0.3]);
gca3 = gca;
colormap(colorMap);
% Setting the axis limits
xlim([-5.5 5.5]);
ylim([-4.5 4.5]);
% Setting the graphic & labels 
set(figure3,'Units','centimeters');
set(figure3,'PaperUnits','centimeters');
set(figure3,'PaperPosition',[0 0 15 10]);
set(gca3,'fontsize', 13, 'fontname', 'arial'); 
set(gca3,'XTick',[-5:1:5]);
set(gca3,'YTick',[-5:1:5]);
xlabel('$x$','fontsize',25,'interpreter','latex');
ylabel('$y$','fontsize',25,'interpreter','latex');


% making the contour for dxy(x,y,0)

figure4 = figure;

contour(x,y,dxyOrb,[-0.3 : 0.03 : 0.3]);
gca4 = gca;
colormap(colorMap);
% Setting the axis limits
xlim([-6 6]);
ylim([-6 6]);
% Setting the graphic & labels 
set(figure4,'Units','centimeters');
set(figure4,'PaperUnits','centimeters');
set(figure4,'PaperPosition',[0 0 15 10]);
set(gca4,'fontsize', 13, 'fontname', 'arial'); 
set(gca4,'XTick',[-6:1:6]);
set(gca4,'YTick',[-6:1:6]);
xlabel('$x$','fontsize',25,'interpreter','latex');
ylabel('$y$','fontsize',25,'interpreter','latex');


% calculating and ploting d(x,x,0) against x
x=[-10:0.005:10];
dxxOrb = dxyOrbital(x,x,0);

figure5 = figure;
plot(x,dxxOrb,'-b');
gca5 = gca;
% axis limits
xlim([-10,10]);
ylim([0,0.35]);
% Graphics & labels
set(figure5,'Units','centimeters');
set(gca5,'fontsize', 13, 'fontname', 'arial'); 
set(gca5,'XTick',[-10:1:10]);
set(gca5,'YTick',[0:0.025:0.3]);
xlabel('$x$','fontsize',25,'interpreter','latex');
ylabel('$y$','fontsize',25,'interpreter','latex');

%calculating the differential
ddxx = diff(dxxOrb);
ddxx = ddxx./(0.005);

x = [-9.995:0.005:10];

% ploting the differential
figure6 = figure;
plot(x,ddxx,'-r');

gca6 = gca;
% axis limits
xlim([-10,10]);
ylim([-0.35,0.35]);
% Graphics & labels
set(figure5,'Units','centimeters');
set(gca6,'fontsize', 13, 'fontname', 'arial'); 
set(gca6,'XTick',[-10:1:10]);
set(gca6,'YTick',[-0.3:0.05:0.3]);
xlabel('$x$','fontsize',25,'interpreter','latex');
ylabel('$y$','fontsize',25,'interpreter','latex');
