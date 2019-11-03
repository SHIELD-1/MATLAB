clc
clear

img1 = imread('Audrey_2.jpg');  %读取 Audrey_2.jpg 到矩阵 img1
img1 = rgb2gray(img1);          %将彩色图像转化为灰度图像

%%  采样
figure(1)                                  
subplot(2,2,1);imshow(img1);title('原图像：474x540') 
img2 = img1(1:8:end,1:8:end);    %采样间隔 8
subplot(2,2,2);imshow(img2);title('采样间隔 8：60x68')
img3 = img1(1:16:end,1:16:end);  %采样间隔 16
subplot(2,2,3);imshow(img3);title('采样间隔 16：30x34')
img4 = img1(1:32:end,1:32:end);  %采样间隔 32
subplot(2,2,4);imshow(img4);title('采样间隔 32：15x17')
suptitle('1603643050+张焱兵');

%% 量化
figure(2)
subplot(2,3,1);imshow(img1);title('原图像')
subplot(2,3,2);Pic64 = histeq(img1,64);imshow(Pic64);title('量化级数64') %64级量化
subplot(2,3,3);Pic32 = histeq(img1,32);imshow(Pic32);title('量化级数32') %32级量化
subplot(2,3,4);Pic16 = histeq(img1,16);imshow(Pic16);title('量化级数16') %16级量化
subplot(2,3,5);Pic8 = histeq(img1,8);imshow(Pic8);title('量化级数8')     %8级量化
subplot(2,3,6);Pic2 = histeq(img1,2);imshow(Pic2);title('量化级数2')     %2级量化
suptitle('1603643050+张焱兵');