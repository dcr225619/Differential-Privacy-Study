clear
clc
% % 
% avd2=load('avd2_2.mat');
% avd2=avd2.avd2;
% avd2_P=load('avd2_PrivBayes.mat');
% avd2_P=avd2_P.avd2;
% avd3=load('avd3_2.mat');
% avd3=avd3.avd3;
% avd3_P=load('avd3_PrivBayes.mat');
% avd3_P=avd3_P.avd3;

% avd2=load('avd2_4.mat');
% avd2=avd2.avd2;
% avd2_P=load('avd2_PrivBayes_4.mat');
% avd2_P=avd2_P.avd2;
% avd3=load('avd3_4.mat');
% avd3=avd3.avd3;
% avd3_P=load('avd3_PrivBayes_4.mat');
% avd3_P=avd3_P.avd3;
% % 
% avd2_sensitive=load('avd2_sensitive2.mat');
% avd2_sensitive=avd2_sensitive.avd2_sensitive;
% avd2_nonsensitive=load('avd2_nonsensitive2.mat');
% avd2_nonsensitive=avd2_nonsensitive.avd2_nonsensitive;
% avd3_sensitive=load('avd3_sensitive2.mat');
% avd3_sensitive=avd3_sensitive.avd3_sensitive;
% avd3_nonsensitive=load('avd3_nonsensitive2.mat');
% avd3_nonsensitive=avd3_nonsensitive.avd3_nonsensitive;
% 
% avd2_P_sensitive=load('avd2_PrivBayes_sensitive.mat');
% avd2_P_sensitive=avd2_P_sensitive.avd2_P_sensitive;
% avd2_P_nonsensitive=load('avd2_PrivBayes_nonsensitive.mat');
% avd2_P_nonsensitive=avd2_P_nonsensitive.avd2_P_nonsensitive;
% avd3_P_sensitive=load('avd3_PrivBayes_sensitive.mat');
% avd3_P_sensitive=avd3_P_sensitive.avd3_sensitive;
% avd3_P_nonsensitive=load('avd3_PrivBayes_nonsensitive.mat');
% avd3_P_nonsensitive=avd3_P_nonsensitive.avd3_nonsensitive;

% temp=zeros(1,5);
% for i=1:5
%     temp=temp+avd2_P_sensitive{i};
% end
% temp=temp/5;
% avd2_P_sensitive=temp;
% 
% temp=zeros(1,5);
% for i=1:5
%     temp=temp+avd2_P_nonsensitive{i};
% end
% temp=temp/5;
% avd2_P_nonsensitive=temp;
% 
% temp=zeros(1,5);
% for i=1:5
%     temp=temp+avd3_P_sensitive{i};
% end
% temp=temp/5;
% avd3_P_sensitive=temp;
% 
% temp=zeros(1,5);
% for i=1:5
%     temp=temp+avd3_P_nonsensitive{i};
% end
% temp=temp/5;
% avd3_P_nonsensitive=temp;

x=linspace(0.2,1,5);

%%

%test3
% temp=zeros(1,5);
% for i=1:5
%     temp=temp+avd2_P{i};
% end
% temp=temp/5;
% avd2_P=temp;
% 
% temp=zeros(1,5);
% for i=1:5
%     temp=temp+avd3_P{i};
% end
% temp=temp/5;
% avd3_P=temp;

%test4
% SVM=load('SVM6.mat');
% SVM=SVM.SVM;

%test2
% SVM=load('SVM_4.mat');
% SVM=SVM.SVM;
% SVM_P=load('SVM_PrivBayes_4.mat');
% SVM_P=SVM_P.SVM_P;
% 
% temp=zeros(5);
% for i=1:5
%     temp=temp+SVM_P{i};
% end
% temp=temp/5;
% SVM_P=temp;


% %% r=? Priv与HP对比
% %SVM实验画图()
% y1=SVM_P(:,1);% PrivBayes classification accuracy
% y2=SVM{5}(:,1);% 1:2 HPPrivBayes
% y5=0.952000*ones(1,5);% no privacy protection
% figure()
% 
% plot(x,y1,'R-D',x,y2,'B-*',x,y5,'K-','LineWidth',1.5)
% 
% %plot(x,y1,'R-D',x,y2,'B-*','LineWidth',1.5)
% legend('PrivBayes','HPPrivBayes','No privacy protection')
% %legend('PrivBayes','HPPrivBayes')
% axis([0.2,1,0.7,1])
% xlabel('privacy budget ε')
% ylabel('classification accuracy')
% title('SVM experiment on education')

% %SVM实验画图(单Priv)
% y1=SVM_P(:,1);% PrivBayes classification accuracy
% figure()
% plot(x,y1,'R-D','LineWidth',1.5)


% 
%SVM实验画图(education)
% x=linspace(0.2,1,5);
% y1=SVM_P(:,1);% PrivBayes classification accuracy
% y2=SVM{5}(:,1);% 1:2 HPPrivBayes
% y5=0.952000*ones(1,5);% no privacy protection
% figure()
% plot(x,y1,'R-D',x,y2,'B-*',x,y5,'K-','LineWidth',1.5)
% %plot(x,y1,'R-D',x,y2,'B-*','LineWidth',1.5)
% legend('PrivBayes','HPPrivBayes','No privacy protection')
% %legend('PrivBayes','HPPrivBayes')
% axis([0.2,1,0.7,1])
% xlabel('privacy budget ε')
% ylabel('classification accuracy')
% title('SVM experiment on gender')
% % 
% %3-边际实验画图
% y3=avd3_P;% PrivBayes average variation distance
% y4=avd3{5};% 1:2 HPPrivBayes
% figure()
% plot(x,y3,'R-D',x,y4,'B-*','LineWidth',1.5)
% legend('PrivBayes','HPPrivBayes')
% %axis()
% xlabel('privacy budget ε')
% ylabel('average variation distance')
% title('3-marginal distribution experiment')
% % 
% %2-边际实验画图
% y3=avd2_P;% PrivBayes average variation distance
% y4=avd2{5};% 1:2 HPPrivBayes
% figure()
% plot(x,y3,'R-D',x,y4,'B-*','LineWidth',1.5)
% legend('PrivBayes','HPPrivBayes')
% %axis()
% xlabel('privacy budget ε')
% ylabel('average variation distance')
% title('2-marginal distribution experiment')

% %3-边际实验画图(单Priv)
% y3=avd3_P;% PrivBayes average variation distance
% figure()
% plot(x,y3,'R-D','LineWidth',1.5)
% %axis()
% xlabel('privacy budget ε')
% ylabel('average variation distance')
% title('3-marginal distribution experiment')
% 
% %2-边际实验画图（单Priv）
% y3=avd2_P;% PrivBayes average variation distance
% figure()
% plot(x,y3,'LineWidth',1.5)
% %axis()
% xlabel('privacy budget ε')
% ylabel('average variation distance')
% title('2-marginal distribution experiment')

% 

% %HPPRivBayes不同r取值测试 SVM5——>3
% % SVM实验画图
% x=linspace(0.2,1,5);
% figure()
% for i=1:5
%     plot(x,SVM{i},'LineWidth',1.5)
% % %     hold on
% end
% legend('r=1/6','r=1/5','r=1/4','r=1/3','r=1/2');
% 
% set(gca,'xtick',x) %坐标实际的值
% set(gca,'xticklabel',x) %坐标上显示的标值
% % axis()
% xlabel('privacy budget ε')
% ylabel('classification accuracy')
% title('SVM experiment on HPPrivBayes')
% % 
% %avd不同r取值实验
% %3-边际实验画图
% figure()
% for i=1:5
%     plot(x,avd3{i},'LineWidth',1.5)
%     hold on
% end
% legend('r=1/6','r=1/5','r=1/4','r=1/3','r=1/2');
% %axis()
% xlabel('privacy budget ε')
% ylabel('average variation distance')
% title('3-marginal distribution experiment on HPPrivBayes')
% 
% %2-边际实验画图
% figure()
% for i=1:5
%     plot(x,avd2{i},'LineWidth',1.5)
%     hold on
% end
% legend('r=1/6','r=1/5','r=1/4','r=1/3','r=1/2');
% %axis()
% xlabel('privacy budget ε')
% ylabel('average variation distance')
% title('2-marginal distribution experiment on HPPrivBayes')

% %%HPPrivBayes分敏感不敏感测试
% %3-边际实验画图sensitive
% figure()
% for i=1:5
%     plot(x,avd3_sensitive{i},'LineWidth',1.5)
%     hold on
% end
% 
% plot(x,avd3_P_sensitive,'LineWidth',1.5)
% 
% legend('r=1/6','r=1/5','r=1/4','r=1/3','r=1/2','PrivBayes');
% %axis()
% xlabel('privacy budget ε')
% ylabel('average variation distance')
% title('3-marginal distribution experiment on Group A')
% 
% %2-边际实验画图sensitive
% figure()
% for i=1:5
%     plot(x,avd2_sensitive{i},'LineWidth',1.5)
%     hold on
% end
% 
% %axis()
% plot(x,avd2_P_sensitive,'LineWidth',1.5)
% legend('r=1/6','r=1/5','r=1/4','r=1/3','r=1/2','PrivBayes');
% xlabel('privacy budget ε')
% ylabel('average variation distance')
% title('2-marginal distribution experiment on Group A')
% 
% %3-边际实验画图nonsensitive
% figure()
% for i=1:5
%     plot(x,avd3_nonsensitive{i},'LineWidth',1.5)
%     hold on
% end
% 
% plot(x,avd3_P_nonsensitive,'LineWidth',1.5)
% 
% legend('r=1/6','r=1/5','r=1/4','r=1/3','r=1/2','PrivBayes');
% %axis()
% xlabel('privacy budget ε')
% ylabel('average variation distance')
% title('3-marginal distribution experiment on Group B')
% 
% %2-边际实验画图nonsensitive
% figure()
% for i=1:5
%     plot(x,avd2_nonsensitive{i},'LineWidth',1.5)
%     hold on
% end
% 
% plot(x,avd2_P_nonsensitive,'LineWidth',1.5)
% 
% legend('r=1/6','r=1/5','r=1/4','r=1/3','r=1/2','PrivBayes');
% %axis()
% 
% xlabel('privacy budget ε')
% ylabel('average variation distance')
% title('2-marginal distribution experiment on Group B')

% %构建网络效果对比k=4
% k4_el=load('k4_el.mat');
% k4_el=k4_el.k4_el;
% k4_PrivBayes=load('k4_PrivBayes.mat');
% k4_PrivBayes=k4_PrivBayes.k4_PrivBayes;
% k4_PrivBayes(1)=1.2366;
% k4_el(1)=1.0706;
% k4_el(2)=1.4357;
% x1=[1,2,3,4,5];
% figure()
% plot(x1,k4_el,'B-*',x1,k4_PrivBayes,'R-D','LineWidth',1.5)
% axis([1,5,1,2])
% set(gca,'xtick',x1) %坐标实际的值
% set(gca,'xticklabel',x1) %坐标上显示的标值
% legend('HPPrivBayes','PrivBayes');
% xlabel('the degree of Bayesian network k')
% ylabel('sum of mutual information')
% title('Quality of Bayesian network Constructed')
