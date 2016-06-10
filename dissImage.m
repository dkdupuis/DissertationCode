function dissImage()

figure(1);

set(gca,'XTickMode','Manual')
hold on;
set(gca,'XTick',[])
hold on;
set(gca,'YTickMode','Manual')
hold on;
set(gca,'YTick',[])
hold on;
plot([0 8],[1 1]);
hold on;
plot([0 8],[3 3]);
hold on;
plot([0 8],[5 5]);
hold on;
plot([4 4],[0 5]);
hold on;
plot([0 0],[-5 10],'color','k');
hold on;
plot([-5 10],[0 0],'color','k');
hold on;
plot([8 8],[0 5]);
hold on;
plot([2 2],[1 5]);
hold on;
plot([6 6],[1 5]);
hold on;
plot([1 1],[3 5]);
hold on;
plot([3 3],[3 5]);
hold on;
plot([5 5],[3 5]);
hold on;
plot([7 7],[3 5]);
hold on;
axis([-.1 8.1 -.1 5.1]);

dT=.05;
T=8;
t=0:dT:T;
n=2*pi;
y1=.4*sin((n*t)/4)+.5;
y2=.4*sin((2*n*t)/4)+2;
y3=.4*sin((4*n*t)/4)+4;
plot(t,y1,t,y2,t,y3,'color','k');


figure(2);

set(gca,'XTickMode','Manual')
hold on;
set(gca,'XTick',[])
hold on;
set(gca,'YTickMode','Manual')
hold on;
set(gca,'YTick',[])
hold on;
plot([0 8],[5/3 5/3]);
hold on;
plot([0 8],[10/3 10/3]);
hold on;
plot([0 8],[15/3 15/3]);
hold on;
plot([16/3 16/3],[0 5]);
hold on;
plot([8/3 8/3],[0 5]);
hold on;
plot([0 0],[-5 10],'color','k');
hold on;
plot([-5 10],[0 0],'color','k');
hold on;
plot([8 8],[0 5]);
hold on;
axis([-.1 8.1 -.1 5.1]);

dT=.05;
T=8;
t=0:dT:T;
n=2*pi;
y1=.4*sin((n*t)/4)+2.5/3;
y2=.4*sin((2*n*t)/4)+7.5/3;
y3=.4*sin((4*n*t)/4)+12.5/3;
plot(t,y1,t,y2,t,y3,'color','k');

