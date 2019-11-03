clear,clc,close all

img1=imread('figure51.jpg');
img1 = im2double(img1);  %double����ת��

figure(1)
subplot(1,3,1),imshow(img1);
title('ԭʼͼ��');

lim = stretchlim(img1);   %�Ҷȱ任����Ӧ��ֵ
L =imadjust(img1,lim,[]); % ��ǿͼ��ĶԱȶ�
subplot(1,2,2),imshow(L);
title('��ѷ�Χ����');
suptitle('1603643050 ���ͱ����Ҷȱ任')

%% ͼ���Ե��ȡ
img2=imread('lenagray.jpg');

figure(2)
subplot(2,2,1),imshow(img2);title('ԭͼ');
% ʹ��sobel����
img_edge = SobelOperator(img2);
subplot(2,2,2);imshow(img_edge,[]);title('sobel��ȡ��Ե');

% ʹ��prewitt����
img_edge = PrewittOperator(img2);
subplot(2,2,3);imshow(img_edge,[]);title('prewitt������ȡ��Ե');

% ʹ��roberts����
subplot(2,2,4);
img_edge = RobertsOperator(img2);
imshow(img_edge);title('Roberts ������ȡ��Ե');

suptitle('1603643050 ���ͱ�����ȡͼ���Ե')



