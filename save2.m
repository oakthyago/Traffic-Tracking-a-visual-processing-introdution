 
clc;
clear all;



source = VideoReader('i5_raw.avi');


%writerObj1 = VideoWriter('gt.avi');
writerObj2 = VideoWriter('Both.avi');

%open(writerObj1);
open(writerObj2);

mordor= read(source);
tam=size(mordor);
height = tam(1);
width = tam(2);
totalframes=tam(4);
Alfa=0.1;
TP=0;
TotalNumbofCar=0;
FP=0;FN=0;


         



background= read(source,1);


bg_bw = zeros(height,width);
background=zeros(height,width);         



fg = zeros(height, width);



fileID = fopen('anotation.txt','r');

for i = 1:totalframes

frame = read(source,i);
framegray = double(rgb2gray(frame))/255;

background2= (double((1-Alfa)*background) +double( Alfa*framegray));
bg_bw=background2;



subtraction = abs((framegray)- (bg_bw));

fg= subtraction > 0.125;

fg = bwmorph(fg, 'dilate', 3);
fg = (bwmorph(fg, 'erode', 3));
 
 
se = strel('square', 3);
filteredForeground = imopen(fg, se);


blobAnalysis = vision.BlobAnalysis('BoundingBoxOutputPort', true, ...
    'AreaOutputPort', false, 'CentroidOutputPort', false, ...
    'MinimumBlobArea', 150);
bbox = step(blobAnalysis, filteredForeground);




BoxNum=fscanf(fileID,'%d',1);
for k=1:BoxNum
A(k,:,i)=fscanf(fileID,'%d',4);
end

B=A(1:BoxNum,:,i);

result = insertShape(frame, 'Rectangle', B, 'Color', 'red');
result2 = insertShape(result, 'Rectangle', bbox, 'Color', 'green');

%writeVideo(writerObj1,result);
writeVideo(writerObj2,result2);

overlapRatio = bboxOverlapRatio(bbox,B);

add=(overlapRatio > 0.5);
TP= TP + sum(sum(add));

% add2=(overlapRatio > 0.05)&(overlapRatio < 0.5);
% 
% FP= FP + sum(sum(add2));



TotalNumbofCar=TotalNumbofCar+BoxNum;

%  figure(1)
%  imshow(result)
%  figure(2)
%  imshow(result2)
background=background2;

end

%close(writerObj1);
close(writerObj2);
% FN= TotalNumbofCar -(TP+FP);
