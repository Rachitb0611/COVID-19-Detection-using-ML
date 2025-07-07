function features = extractFeatures(img)
    % Use Gray-Level Co-occurrence Matrix (GLCM)
    stats = graycoprops(graycomatrix(img), {'Contrast', 'Correlation', 'Energy', 'Homogeneity'});
    features = [stats.Contrast, stats.Correlation, stats.Energy, stats.Homogeneity];
end
