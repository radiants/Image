close all;
clear all;
clc;

Imagename="120h-6.jpg";

Img=imread(Imagename);
[n m a]=size(Img);%判断图像的大小

GrayImage= rgb2gray(Img);%调用MATLAB函数实现灰度化 ( 0.2989R+ 0.5870G + 0.1140B)

Img_Gray=zeros(n,m);

for x=1:n%通过双循环对图像进行灰度化处理
    for y=1:m
%      Img_Gray1(x,y)=max(Img(x,y,1),max(Img(x,y,2),Img(x,y,3)));  %第一种方法极大值实现灰度
%      Img_Gray2(x,y)=(Img(x,y,1)+Img(x,y,2)+Img(x,y,3))/3;%第二种方法平均值实现灰度
%      Img_Gray3(x,y)=0.2*Img(x,y,1)+0.75*Img(x,y,2)+0.05*Img(x,y,3);%第三种方法权值实现灰度
    end
end
subplot(1,2,1);
imshow(Img);title('原图像');
subplot(1,2,2);
imshow(GrayImage);title('系统函数灰度');
% subplot(1,5,3);
% imshow(uint8(Img_Gray1));title('极大值灰度处理');
% subplot(1,5,4);
% imshow(uint8(Img_Gray2));title('平均值灰度处理');
% subplot(1,5,5);
% imshow(uint8(Img_Gray3));title('权值灰度处理');
xlswrite(strcat('GrayImage-',Imagename,'.xlsx'),GrayImage,Imagename);
%%
count0 = 0;
count1 = 0;

[x y]=size(GrayImage);


for x = 1:1:x
    for y = 1:1:y
        if GrayImage(x,y)>60
            GrayImage(x,y) = 1;
            count1 = count1 +1;
        elseif GrayImage(x,y)<=60
            GrayImage(x,y) = 0;
            count0 = count0 +1;
        end
    end
end

xlswrite(strcat('GrayImage-',Imagename,'.xlsx'),GrayImage,'01');