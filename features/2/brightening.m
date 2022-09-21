function [raw_hist, enhanced_hist, enhanced_img] = brightening(img, a, b)
    raw_hist = get_frequency(img);

    % Calculate image brightening
    enhanced_img = a * img + b;

    enhanced_hist = get_frequency(enhanced_img);
end