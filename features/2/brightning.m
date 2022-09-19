function [raw_hist, enhanced_hist, enhanced_img] = brightning(img, a, b)
    raw_hist = get_frequency(img);

    % Calculate image brightning
    enhanced_img = a * img + b;

    enhanced_hist = get_frequency(enhanced_img);
end