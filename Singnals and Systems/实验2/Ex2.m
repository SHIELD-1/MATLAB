clc
clear

img1 = imread('Audrey_2.jpg');  %��ȡ Audrey_2.jpg ������ img1
img1 = rgb2gray(img1);          %����ɫͼ��ת��Ϊ�Ҷ�ͼ��

%%  ����
figure(1)                                  
subplot(2,2,1);imshow(img1);title('ԭͼ��474x540') 
img2 = img1(1:8:end,1:8:end);    %������� 8
subplot(2,2,2);imshow(img2);title('������� 8��60x68')
img3 = img1(1:16:end,1:16:end);  %������� 16
subplot(2,2,3);imshow(img3);title('������� 16��30x34')
img4 = img1(1:32:end,1:32:end);  %������� 32
subplot(2,2,4);imshow(img4);title('������� 32��15x17')
suptitle('1603643050+���ͱ�');

%% ����
figure(2)
subplot(2,3,1);imshow(img1);title('ԭͼ��')
subplot(2,3,2);Pic64 = histeq(img1,64);imshow(Pic64);title('��������64') %64������
subplot(2,3,3);Pic32 = histeq(img1,32);imshow(Pic32);title('��������32') %32������
subplot(2,3,4);Pic16 = histeq(img1,16);imshow(Pic16);title('��������16') %16������
subplot(2,3,5);Pic8 = histeq(img1,8);imshow(Pic8);title('��������8')     %8������
subplot(2,3,6);Pic2 = histeq(img1,2);imshow(Pic2);title('��������2')     %2������
suptitle('1603643050+���ͱ�');