function [raw_hist, enhanced_hist, enhanced_img] = log_transformation(img, c)
    raw_hist = get_frequency(img);
    
    % Calculate log transformation
    enhanced_img = c * log(1 + im2double(img)) * 256;
    
    enhanced_img = cast(enhanced_img, 'uint8');

    enhanced_hist = get_frequency(enhanced_img);
end