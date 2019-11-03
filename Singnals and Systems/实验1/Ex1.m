clc
clear

img = imread('Audrey_2.jpg'); %imread 函数将图像读取unit8类型的矩阵中
imwrite(img,'Out1.jpg')       %将图像数据 img 写入指定的文件 Out.jpg
figure,
subplot(1,2,1),imshow(img),title('原图') %显示图像
img_gray = rgb2gray(img);     %把彩色图像转换为灰度图像
subplot(1,2,2),imshow(img_gray),title('灰度图') 
suptitle('1603643050+张焱兵');
%set(gcf,'position',[400,400,300,300])