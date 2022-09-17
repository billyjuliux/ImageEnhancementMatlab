function [raw_hist, equalized_hist, equalized_img] = hist_equalization_per_channel(img)
    % Get image dimension
    [nrow, ncol] = size(img);
    total_pixel = nrow * ncol;

    % Store original hist
    raw_hist = get_frequency(img);

    % Compute normalized hist
    normalized_hist = raw_hist/total_pixel;

    % Compute and store equalized hist
    sum = 0;
    equalized_hist = zeros(1,256);
    for i = 1:256
        sum = sum + normalized_hist(i);
        equalized_hist(i) = floor(sum * 255);
    end

    % Get and store equalized image
    equalized_img = zeros(nrow, ncol);
    for i = 1:nrow
        for j = 1:ncol
            equalized_img(i,j) = equalized_hist(img(i,j) + 1);
        end
    end
    equalized_img = cast(equalized_img, 'uint8');
end