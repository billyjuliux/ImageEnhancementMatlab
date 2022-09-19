function equalized_img = hist_equalization_per_channel(img)
    % Get image dimension
    [nrow, ncol] = size(img);
    total_pixel = nrow * ncol;

    % Get original hist
    raw_hist = get_frequency(img);

    % Compute normalized hist
    normalized_hist = raw_hist/total_pixel;

    % Compute equalization map target
    sum = 0;
    equalization_map_target = zeros(1,256);
    for i = 1:256
        sum = sum + normalized_hist(i);
        equalization_map_target(i) = floor(sum * 255);
    end

    % Get and store equalized image
    equalized_img = zeros(nrow, ncol);
    for i = 1:nrow
        for j = 1:ncol
            equalized_img(i,j) = equalization_map_target(img(i,j) + 1);
        end
    end
    equalized_img = cast(equalized_img, 'uint8');
    
end