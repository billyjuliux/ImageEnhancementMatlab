function [raw_hist, equalized_hist, equalized_img] = hist_equalization(img)
    % Get image dimension
    [~, ~, nchannel] = size(img);

    raw_hist = get_frequency(img);

    if (is_rgb_same(img))
        % ------------- Grayscale --------------
        equalized_img = hist_equalization_per_channel(img(:,:,1));
        % convert to 3d size, for display purpose
        equalized_img = cat(3, equalized_img, equalized_img, equalized_img);
        
        equalized_hist = get_frequency(equalized_img);

    else
        % ------------- RGB --------------
        equalized_imgs = cell(3,1);
        for i = 1:nchannel
            equalized_img = hist_equalization_per_channel(img(:,:,i));
            equalized_imgs{i} = equalized_img;
        end
        equalized_img = cat(3, equalized_imgs{1}, equalized_imgs{2}, equalized_imgs{3});
            
        equalized_hist = get_frequency(equalized_img);
    end
end