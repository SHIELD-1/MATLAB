clc
clear

img = imread('Audrey_2.jpg'); %imread ������ͼ���ȡunit8���͵ľ�����
imwrite(img,'Out1.jpg')       %��ͼ������ img д��ָ�����ļ� Out.jpg
figure,
subplot(1,2,1),imshow(img),title('ԭͼ') %��ʾͼ��
img_gray = rgb2gray(img);     %�Ѳ�ɫͼ��ת��Ϊ�Ҷ�ͼ��
subplot(1,2,2),imshow(img_gray),title('�Ҷ�ͼ') 
suptitle('1603643050+���ͱ�');
%set(gcf,'position',[400,400,300,300])