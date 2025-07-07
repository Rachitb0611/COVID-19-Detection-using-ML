function out = preprocessImage(img)
    if size(img,3) == 3
        img = rgb2gray(img);
    end
    img = imresize(img, [256 256]);
    img = medfilt2(img); % Noise removal
    out = img;
end
