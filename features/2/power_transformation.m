function enhanced_img = power_transformation(img, c, y)
    % Calculate power transformation
    enhanced_img = c * (im2double(img) .^ y) * 256;
    
    enhanced_img = cast(enhanced_img, 'uint8');
end