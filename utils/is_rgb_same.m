function return_val = is_rgb_same(img)
    if size(img, 3) == 1
        % Grayscale image
        return_val = true;
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
