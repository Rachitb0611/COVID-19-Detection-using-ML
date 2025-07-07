function result = testImage(imagePath)
    load('lungCancerModel.mat', 'classifier');
    img = imread(imagePath);
    img = preprocessImage(img);
    feat = extractFeatures(img);
    label = predict(classifier, feat);

    if label == 1
        result = 'No Lung Cancer';
    else
        result = 'Lung Cancer Detected';
    end

    disp(['Prediction: ', result]);
end
