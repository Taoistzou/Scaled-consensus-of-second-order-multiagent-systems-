close all;
s1=1;s2=1/2;s3=1/3; s4=1/4;s5=1/5;s6=1/6;
% figure(1)
% plot(t,y(:,2)-s1/s2*y(:,1),t,y(:,3)-s1/s3*y(:,1),t,y(:,4)-s1/s4*y(:,1),t,y(:,5)-s1/s5*y(:,1),t,y(:,6)-s1/s6*y(:,1),'linewidth',1.5)
% legend('$s_2x_2-s_1x_1$','$s_3x_3-s_1x_1$','$s_4x_4-s_1x_1$','$s_5x_5-s_1x_1$','$s_6x_6-s_1x_1$','interpreter','latex','FontSize',18,'Location','Southeast');
% xlabel('s','interpreter','latex','FontSize',18);ylabel('$s_ix_i-s_1x_1$,i=2,3,4,5,6','interpreter','latex','FontSize',18);
% grid on
% 
% figure(2)
% plot(t,y(:,2+6)-s1/s2*y(:,1+6),t,y(:,3+6)-s1/s3*y(:,1+6),t,y(:,4+6)-s1/s4*y(:,1+6),t,y(:,5+6)-s1/s5*y(:,1+6),t,y(:,6+6)-s1/s6*y(:,1+6),'linewidth',1.5)
% legend('$s_2v_2-s_1v_1$','$s_3v_3-s_1v_1$','$s_4v_4-s_1v_1$','$s_5v_5-s_1v_1$','$s_6v_6-s_1x_1$','interpreter','latex','FontSize',18,'Location','Southeast');
% xlabel('s','interpreter','latex','FontSize',18);ylabel('$s_iv_i-s_1v_1$,i=2,3,4,5,6','interpreter','latex','FontSize',18);
% grid on

figure(3)
plot(t,y(:,1:6),'Linewidth',2)

figure(4)
plot(t,y(:,7:12),'Linewidth',2)

figure(5)
plot(t,u,'Linewidth',2)

% figure(1)
% plot(t,y(:,7)-1,t,y(:,8)-2,t,y(:,9)-3,t,y(:,10)-4,t,y(:,11)-5,t,y(:,12)-6,'linewidth',1.5)
% legend('$s_1x_1-(\frac{1}{N}\sum_{i=1}^{n}s_{i}x^s_{i})$','$s_2x_2-(\frac{1}{N}\sum_{i=1}^{n}s_{i}x^s_{i})$',...
%     '$s_3x_3-(\frac{1}{N}\sum_{i=1}^{n}s_{i}x^s_{i})$','$s_4x_4-(\frac{1}{N}\sum_{i=1}^{n}s_{i}x^s_{i})$',...
%     '$s_5x_5-(\frac{1}{N}\sum_{i=1}^{n}s_{i}x^s_{i})$','$s_6x_6-(\frac{1}{N}\sum_{i=1}^{n}s_{i}x^s_{i})$','interpreter','latex','FontSize',14);
% xlabel('Ê±¼ä/s','FontSize',14);ylabel('$s_ix_i-\frac{1}{N}\sum_{i=1}^{n}s_{i}x_{i}$','interpreter','latex','FontSize',14);
% grid on






