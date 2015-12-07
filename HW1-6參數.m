%本程式目前未針對影像如果
%圖01測資
img_1 = imread('01-1.jpg');
img_2 = imread('01-2.jpg');
img_3 = imread('01-3.jpg');
%圖02測資
 %img_1 = imread('02-1.jpg');
 %img_2 = imread('02-2.jpg');
 %img_3 = imread('02-3.jpg');
k = (img_1);
[frameHeight, frameWidth, frameDepth] = size(k);
k2 = (img_2);
[frameHeight2, frameWidth2, frameDepth2] = size(k2);
%圖01測資座標點
%第一張圖和第二張圖共同點
x1 = 652;
y1 = 39;
x_1 = 185;
y_1 = 49;
x2 =581;
y2 = 533;
x_2 = 96;
y_2 = 556;
x3 = 892;
y3 = 608;
x_3 = 401;
y_3 = 600;
%第二張圖和第三張圖共同點
x01 = 712;
y01 = 58;
x0_1 = 254;
y0_1 = 45;
x02 = 492;
y02 = 345;
x0_2 = 24;
y0_2 = 339;
x03 = 538;
y03 = 585;
x0_3 = 38;
y0_3 = 593;
%圖02測資座標點
 %x1 = 372;
 %y1 = 15;
 %x_1 = 66;
 %y_1 = 7;
 %x2 = 347;
 %y2 = 224;
 %x_2 = 17;
 %y_2 = 235;
 %x3 = 482;
 %y3 = 120;
 %x_3 = 179;
 %y_3 = 120;
 %x01 = 340;
 %y01 = 40;
 %x0_1 = 20;
 %y0_1 = 26;
 %x02 = 424;
 %y02 = 316;
 %x0_2 = 100;
 %y0_2 = 312;
 %x03 = 344;
 %y03 = 201;
 %x0_3 = 2;
 %y0_3 = 206; 

A=[x_1 y_1 1;x_2 y_2 1;x_3 y_3 1];
B=[x1;x2;x3];
C=inv(A)*B;
D=[x_1 y_1 1;x_2 y_2 1;x_3 y_3 1];
E=[y1;y2;y3];
F=inv(D)*E;
AA=[x0_1 y0_1 1;x0_2 y0_2 1;x0_3 y0_3 1];
BB=[x01;x02;x03];
CC=inv(AA)*BB;
DD=[x0_1 y0_1 1;x0_2 y0_2 1;x0_3 y0_3 1];
EE=[y01;y02;y03];
FF=inv(DD)*EE;

uint8 maxx;
uint8 minx;
uint8 maxy;
uint8 miny;
uint8 maxx2;
uint8 minx2;
uint8 maxy2;
uint8 miny2;
%計算最大張圖大小
xx2(1) = 0*CC(1)+0*CC(2)+CC(3);
xx2(2) = 0*CC(1)+frameHeight2*CC(2)+CC(3);
xx2(3) = frameWidth2*CC(1)+0*CC(2)+CC(3);
xx2(4) = frameWidth2*CC(1)+frameHeight2*CC(2)+CC(3);
minx2=min(xx2);
maxx2=max(xx2);
yy2(1) = 0*FF(1)+0*FF(2)+FF(3);
yy2(2) = 0*FF(1)+frameHeight2*FF(2)+FF(3);
yy2(3) = frameWidth2*FF(1)+0*FF(2)+FF(3);
yy2(4) = frameWidth2*FF(1)+frameHeight2*FF(2)+FF(3);
maxy2=max(yy2);
miny2=min(yy2);
if(maxx2>frameWidth2)
    width2 = maxx2;
end
y00=0;
if(miny2<1)
    y00=fix(1-miny2);
    maxy2=maxy2+(1-miny2);
    miny2=1;
end
if(maxy2>frameHeight2)
    height2 = fix(maxy2)+1;
end
if(maxy2<frameHeight2)
    height2 = frameHeight2;
end
width2 = fix(width2)+2;
initheight2 = fix(miny2);
initwidth2 = fix(minx2);
out_img2 = zeros(height2, width2, 3);
xx(1) = 0*C(1)+0*C(2)+C(3);
xx(2) = 0*C(1)+height2*C(2)+C(3);
xx(3) = width2*C(1)+0*C(2)+C(3);
xx(4) = width2*C(1)+height2*C(2)+C(3);
minx=min(xx);
maxx=max(xx);
yy(1) = 0*F(1)+0*F(2)+F(3);
yy(2) = 0*F(1)+height2*F(2)+F(3);
yy(3) = width2*F(1)+0*F(2)+F(3);
yy(4) = width2*F(1)+height2*F(2)+F(3);
maxy=max(yy);
miny=min(yy);
if(maxx>width2)
    width = maxx;
end
y0=0;
if(miny<1)%因應圖片貼在右上方時的處理
    y0=fix(1-miny);
    maxy=maxy+(1-miny);
    miny=1;
end
if(maxy>height2)
    height = fix(maxy)+1;
end
if(maxy<height2)
    height = height2;
end
width = fix(width)+2;
initheight = fix(miny);
initwidth = fix(minx);
out_img = zeros(height, width, 3);
y1=y1+y0;
y2=y2+y0;
y3=y3+y0;
y01=y01+y00;
y02=y02+y00;
y03=y03+y00;
A=[x1 y1 1;x2 y2 1;x3 y3 1];
B=[x_1;x_2;x_3];
C=inv(A)*B;
AA=[x01 y01 1;x02 y02 1;x03 y03 1];
BB=[x0_1;x0_2;x0_3];
CC=inv(AA)*BB;
y_1=y_1+y0;
y_2=y_2+y0;
y_3=y_3+y0;
y0_1=y0_1+y00;
y0_2=y0_2+y00;
y0_3=y0_3+y00;
D=[x1 y1 1;x2 y2 1;x3 y3 1];
E=[y_1;y_2;y_3];
F=inv(D)*E;
DD=[x01 y01 1;x02 y02 1;x03 y03 1];
EE=[y0_1;y0_2;y0_3];
FF=inv(DD)*EE;
%貼第2張圖到out_img2
for m=1:frameWidth2
    for l=1:frameHeight2
        out_img2(l+y00,m,:)=img_2(l,m,:);
    end
end
%貼第1張圖到out_img
for m=1:frameWidth
    for l=1:frameHeight
        out_img(l+y0,m,:)=img_1(l,m,:);
    end
end
uint8 S2x;
uint8 S2y;
double ii;
double jj;
%貼第3張圖到out_img2
for m=initwidth2:width2
    for l=initheight2:height2
        S20 = m*CC(1)+l*CC(2)+CC(3);
        S2 = m*FF(1)+l*FF(2)+FF(3)-y00;
        if(S2>1 && S20>1 && S20<frameWidth2 && S2<frameHeight2)
            S2y = fix(S2);%y
            S2x = fix(S20);%x       
            jj=S2-S2y;%y
            ii=S20-S2x;%x
            %安安你好 我是內插
            out_img2(l,m,:)=img_3(S2y,S2x,:)*(1-ii)*(1-jj)+img_3(S2y,S2x+1,:)*(ii)*(1-jj)+img_3(S2y+1,S2x,:)*(1-ii)*(jj)+img_3(S2y+1,S2x+1,:)*(ii)*(jj);
            %安安你好 內插結束
        end
    end
end
uint8 S1x;
uint8 S1y;
double i1;
double j1;
%貼out_img2圖到out_img
for m=initwidth:width
    for l=initheight:height
        S10 = m*C(1)+l*C(2)+C(3);
        S1 = m*F(1)+l*F(2)+F(3)-y0;
        if(S1>1 && S10>1 && S10<width2 && S1<height2)% 
            S1y = fix(S1);%y
            S1x = fix(S10);%x
            j1=S1-S1y;%y
            i1=S10-S1x;%x
            out_img(l,m,:)=out_img2(S1y,S1x,:)*(1-i1)*(1-j1)+out_img2(S1y,S1x+1,:)*(i1)*(1-j1)+out_img2(S1y+1,S1x,:)*(1-i1)*(j1)+out_img2(S1y+1,S1x+1,:)*(i1)*(j1);
        end
    end
end
%顯示圖片
imshow(out_img/255);
