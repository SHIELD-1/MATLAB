clear all,close all

%构造原始图像
img=zeros(512,512);       % 512 x 512 黑色
img(136:376,246:266) = 1; % 16 x 240 白色

figure(1)
%% 原始状态
subplot(2,4,1);imshow(img); title('原图像'); 
%========================================================================
%原始图像的傅里叶频谱 
F1=fftshift(abs(fft2(img))); 
% fft2(): 二维傅里叶变换，结果为复数类型
% abs():取复数结果的实部
% fftshift():fft2 输出的结果会把低频部分分散在四角，
%            所以需要fftshift把低频部分移到中间便于观察 
%==========================================================================
subplot(2,4,2); imshow(F1,[5 50]);title('傅里叶频谱'); 
suptitle('1603643050+张焱兵') 

%% 对原始图像旋转30度 
%==========================================================================
% 使用bilinear插值法旋转，用crop方式显示，旋转后的图像跟原图像大小一样，多余的地方舍去
img1=imrotate(img,30,'bilinear','crop');
%==========================================================================
subplot(2,4,3); imshow(img1); title('旋转30度'); 
%旋转30度后图像的傅里叶频谱 
F2=fftshift(abs(fft2(img1))); 
subplot(2,4,4); imshow(F2,[5 50]); title('旋转30度-频谱');


%%  对原始图像旋转60度 
img2=imrotate(img,60,'bilinear','crop'); 
subplot(2,4,5); imshow(img2); title('旋转60度'); 
%旋转60度后图像的傅里叶频谱 
F3=fftshift(abs(fft2(img2))); 
subplot(2,4,6); imshow(F3,[5 50]); title('旋转60度-频谱');

%% 对原始图像旋转90度
img3=imrotate(img,90,'bilinear','crop'); 
subplot(2,4,7); imshow(img3); title('旋转90度'); 
%旋转90度后图像的傅里叶频谱 
F4=fftshift(abs(fft2(img3)));
subplot(2,4,8); imshow(F4,[5 50]); title('旋转90度-频谱');

suptitle('1603643050 张焱兵');
%% 离散余弦变换（DCT）
figure(2)
grayimg=imread('Elizabeth_1.jpg');
grayimg=rgb2gray(grayimg);          
%显示原图像
subplot(1,3,1);imshow(grayimg);title('原图像')
%计算二维dct变换
dctimg=dct2(grayimg);%对原始图像进行离散余弦变换,变换后DCT系数能量主要集中在左上角，
                     % 其余大部分系数接近于零，这说明DCT具有适用于图像压缩的特性。
subplot(1,3,2);imshow(log(abs(dctimg)));title('DCT变换灰度图像'), colormap(gray(4)), colorbar;
%比较变换前后的图像，肉眼很难分辨出有什么区别，可见压缩的效果比较理想

%把变换矩阵中小于10的值置换为0，然后用idc2重构图像
dctimg(abs(dctimg)<0.1)=0; %将变换后的DCT系数进行门限操作，
                            % 将小于一定值得系数归零，这就是图像压缩中的量化过程
K=idct2(dctimg)/255;       %然后进行逆DCT运算，得到压缩后的图像，
subplot(1,3,3),imshow(K);title('恢复后的图像')
suptitle('1603643050 张焱兵');


% 然后进行逆DCT运算，得到压缩后的图像，
% 如图4。由图5比较变换前后的图像，肉眼很难分辨出有什么区别，可见压缩的效果比较理想。
