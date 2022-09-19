function enhanced_img = log_transformation(img, c)
    % Calculate log transformation
    enhanced_img = c * log(1 + im2double(img)) * 256;
    
    enhanced_img = cast(enhanced_img, 'uint8');
end