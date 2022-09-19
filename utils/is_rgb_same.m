function return_val = is_rgb_same(img)
    % Get image dimension
    [~, ~, nchannel] = size(img);

    if nchannel == 1
        % Grayscale image
        return_val = true;
        return
    end
    
    red = img(:,:,1);
    green = img(:,:,2);
    blue = img(:,:,3);

    if isequal(red, green) && isequal(red, blue) && isequal(green, blue)
        return_val = true;
    else
        return_val = false;
    end
end
