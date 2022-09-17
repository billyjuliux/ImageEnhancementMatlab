function return_val = hist_equalization(img)
    % Get image dimension
    [~, ~, nchannel] = size(img);

    % Show original image
    figure; 
    imshow(img);

    if (nchannel == 1 || (nchannel == 3 && is_rgb_same(img)))
        % ------------- Grayscale --------------
        [raw_hist, equalized_hist, equalized_img] = hist_equalization_per_channel(img(:,:,1));
        
        % Show original histogram
        figure;    
        bar(raw_hist);
    
        % Show equalized img
        figure;    
        imshow(equalized_img);
    
        % Show equalized histogram
        figure;    
        bar(equalized_hist);

    else
        % ------------- RGB --------------
        equalized_imgs = cell(3,1);
        for i = 1:nchannel
            [raw_hist, equalized_hist, equalized_img] = hist_equalization_per_channel(img(:,:,i));

            % Show original histogram
            figure;    
            bar(raw_hist);

            % Show equalized histogram
            figure;    
            bar(equalized_hist);

            equalized_imgs{i} = equalized_img;
        end

        % Show equalized image
        combined_img = cat(3, equalized_imgs{1}, equalized_imgs{2}, equalized_imgs{3});
        figure;
        imshow(combined_img)
    end
end