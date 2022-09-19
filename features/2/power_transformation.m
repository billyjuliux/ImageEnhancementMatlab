function [raw_hist, enhanced_hist, enhanced_img] = power_transformation(img, c, y)
    raw_hist = get_frequency(img);

    % Calculate power transformation
    enhanced_img = c * (im2double(img) .^ y) * 256;
    
    enhanced_img = cast(enhanced_img, 'uint8');

    enhanced_hist = get_frequency(enhanced_img);
end