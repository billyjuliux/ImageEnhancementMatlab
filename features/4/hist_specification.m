function [raw_hist_in, raw_hist_ref, specific_hist, specific_img] = hist_specification(img_in, img_ref)
    % Get image dimension, assume input and reference's dimension is same
    [~, ~, nchannel] = size(img_in);
    

    raw_hist_in = get_frequency(img_in);
    raw_hist_ref = get_frequency(img_ref);

    if (is_rgb_same(img_in))
        % ------------- Grayscale --------------
        specific_img = hist_spec_per_channel(img_in(:,:,1), img_ref(:,:,1));
        % convert to 3d size, for display purpose
        specific_img = cat(3, specific_img, specific_img, specific_img);

        specific_hist = get_frequency(specific_img);
    else
        % ------------- RGB --------------
        specific_imgs = cell(3,1);
        for i = 1:nchannel
            specific_img = hist_spec_per_channel(img_in(:,:,i), img_ref(:,:,i));
            specific_imgs{i} = specific_img;
        end
        specific_img = cat(3, specific_imgs{1}, specific_imgs{2}, specific_imgs{3});

        specific_hist = get_frequency(specific_img);
    end
end

function specific_img = hist_spec_per_channel(img_in, img_ref)
    % Get image dimension
    [nrow, ncol] = size(img_in);

    % Get equalized imgs
    equalized_img_in = hist_equalization_per_channel(img_in);
    equalized_img_ref = hist_equalization_per_channel(img_ref);

    % Get equalized hist
    equalized_hist_in = get_frequency(equalized_img_in);
    equalized_hist_ref = get_frequency(equalized_img_ref);
    
    % Compute specific hist
    specific_hist = zeros(1,256);
    for i = 1:256
        minval = abs(equalized_hist_in(i) - equalized_hist_ref(1));
        minj = 1;

        for j = 1:256
            curr = abs(equalized_hist_in(i) - equalized_hist_ref(j));
            if (curr < minval)
                minval = curr;
                minj = j;
            end
        end
        specific_hist(i) = minj;
    end

    % Get specific img
    specific_img = zeros(nrow, ncol);
    for i = 1:nrow
        for j = 1:ncol
            specific_img(i, j) = specific_hist(img_in(i, j) + 1);
        end

    end
    specific_img = cast(specific_img, 'uint8');
end