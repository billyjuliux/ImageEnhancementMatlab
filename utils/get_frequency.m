function raw_hist = get_frequency(img)
    % Initialize array holding frequency for each grayscale value [0..255]
    raw_hist = zeros(1,256);
    
    % Get img size
    [nrow,ncol] = size(img);

    % Increment the frequency for each pixel's value
    % As the indexing starts from 1 to 256, not 0 to 255, 
        % need to add 1 to the index
    for i = 1 : nrow
        for j = 1 : ncol
            raw_hist(img(i,j) + 1) = raw_hist(img(i,j) + 1) + 1;
        end
    end
end