function return_val = hist_equalization(img)
    % Get image dimension
    [~, ~, nchannel] = size(img);

    % Show original image
    figure; 
    imshow(img);

    if (nchannel == 1 || (nchannel == 3 && is_rgb_same(img)))
        % ------------- Grayscale --------------
        equalized_img = hist_equalization_per_channel(img(:,:,1));
        
        % Show original histogram
        raw_hist = get_frequency(img(:,:,1));
        figure;    
        bar(raw_hist);

        figure;    
        imhist(img(:,:,1));
    
        % Show equalized img
        figure;    
        imshow(equalized_img);
    
        % Show equalized histogram
        equalized_hist = get_frequency(equalized_img);
        figure;    
        bar(equalized_hist);

        figure;    
        imhist(histeq(img(:,:,1)));

    else
        % ------------- RGB --------------
        % Show original histogram
        raw_hist = get_frequency(img);
        figure;    
        bar(raw_hist);

        equalized_imgs = cell(3,1);
        for i = 1:nchannel
            equalized_img = hist_equalization_per_channel(img(:,:,i));
            equalized_imgs{i} = equalized_img;
        end

        % Show equalized image
        combined_img = cat(3, equalized_imgs{1}, equalized_imgs{2}, equalized_imgs{3});
        figure;
        imshow(combined_img)

        % Show equalized histogram
        equalized_hist = get_frequency(combined_img);
        figure;    
        bar(equalized_hist);
    end
end