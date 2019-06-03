addpath('./fgpuzzle/');
clear; close all;
iptsetpref('ImshowBorder','loose');

strImpath ='ivrgPhotos/orderedImages/';
strGtpath ='ivrgPhotos/orderedTruths/';
strFilenames='filenames_ivrg.mat';
strBandtable='bandtable_ivrg.mat';

try
    load([strImpath strFilenames]);         %load filenames variable
    load([strImpath strBandtable]);         %load bandtable variable
catch
    fprintf('Configuration path or filename incorrect, exit\n');
    return;
end

bandtable=bandtable_ivrg;
filenames=filenames_ivrg;

imStart=1; imNum=100;
imEnd=imStart+imNum-1;

% bandtable(imStart,[1:4])=[20 20 20 20];

totalNum=size(bandtable,1);

if imStart>totalNum | imEnd>totalNum
    fprintf('Image index overflow!\n ');
    return;
end

fmeasureTable2 = batchSolve2(strImpath,strGtpath, filenames(imStart:imEnd,:),bandtable(imStart:imEnd,:));
