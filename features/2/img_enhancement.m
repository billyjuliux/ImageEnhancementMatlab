function enhanced_img = img_brightning(img, a, b)
    enhanced_img = a * img + b;
    figure, imshow(enhanced_img);
end

function enhanced_img = img_log_transform(img, c)
    enhanced_img = c * log(1 + im2double(img)) * 256;
    enhanced_img = uint8(enhanced_img);
    figure, imshow(enhanced_img);
end

function enhanced_img = img_pow_transform(img, c, y)
    enhanced_img = c * (im2double(img) .^ y) * 256;
    enhanced_img = uint8(enhanced_img);
    figure, imshow(enhanced_img);
end
    
function enhanced_img = img_contrast_stretching(img)
    figure, imshow(img);

    hist = get_frequency(img);
    figure, bar(hist);

    rmin = min(img(:));
    rmax = max(img(:));

    enhanced_img =  (img - rmin).*(255/(rmax - rmin));
    figure, imshow(enhanced_img);

    enhanced_hist = get_frequency(enhanced_img);
    figure, bar(enhanced_hist);
end