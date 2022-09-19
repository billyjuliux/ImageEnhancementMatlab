function [raw_hist, enhanced_hist, enhanced_img] = contrast_stretching(img)
    raw_hist = get_frequency(img);

    if (is_rgb_same(img))
        % ------------- Grayscale --------------
        enhanced_img = contrast_stretching_per_channel(img(:,:,1));
        enhanced_img = cat(3, enhanced_img, enhanced_img, enhanced_img);
    else
        % ------------- RGB --------------
        enhanced_imgs = cell(3,1);

        % Get image dimension
        [~, ~, nchannel] = size(img);

        for i = 1:nchannel
            enhanced = contrast_stretching_per_channel(img(:,:,i));
            enhanced_imgs{i} = enhanced;
        end
        enhanced_img = cat(3, enhanced_imgs{1}, enhanced_imgs{2}, enhanced_imgs{3});
    end

    enhanced_hist = get_frequency(enhanced_img);
end

function enhanced_img = contrast_stretching_per_channel(img) 
    % Get image dimension
    [nrow, ncol] = size(img);
    
    % Get min and max grayscale value
    rmin = min(img(:));
    rmax = max(img(:));

    % Calculate constant K
    K = 255/(rmax - rmin);

    % Initialize output
    enhanced_img = zeros(nrow, ncol);

    % Calculate image stretching
    for i = 1:nrow
        for j = 1:ncol
            if img(i, j) <= rmin
                enhanced_img(i, j) = 0;
            elseif img(i, j) >= rmax
                enhanced_img(i, j) = 255;
            else
                enhanced_img(i, j) = K * (img(i, j) - rmin);
            end
        end
    end

    enhanced_img = cast(enhanced_img, 'uint8');
end