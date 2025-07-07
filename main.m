clc;
clear;
close all;

% Load dataset
categories = {'normal', 'cancer'};
imageDir = 'dataset/';
features = [];
labels = [];

for i = 1:length(categories)
    files = dir(fullfile(imageDir, categories{i}, '*.jpg'));
    for j = 1:length(files)
        imgPath = fullfile(files(j).folder, files(j).name);
        img = imread(imgPath);
        img = preprocessImage(img);
        feat = extractFeatures(img);
        features = [features; feat];
        labels = [labels; i]; % 1 = normal, 2 = cancer
    end
end

% Train classifier
classifier = fitcsvm(features, labels);

% Save model
save('lungCancerModel.mat', 'classifier');

disp('Model trained and saved.');
