function enhanced_img = img_brightning(img, a, b)
    enhanced_img = uint8(img_operation(@px_brightning, img, [a b]));
end

function enhanced_img = img_log_transform(img, c)
    enhanced_img = uint8(img_operation(@px_log_transform, img, c));
end

function enhanced_img = img_pow_transform(img, c, y)
    enhanced_img = img_operation(@px_pow_transform, img, [c, y]);
end

function enhanced_img = img_operation(op, img, args)
    [nrow, ncol, channel] = size(img);

    enhanced_img = zeros(nrow, ncol, channel);

    for i = 1 : nrow
        for j = 1 : ncol 
            for k = 1 : channel 
                enhanced_img(i, j, k) = op(img(i, j, k), args);
            end
        end
    end
end

function enhanced_px = px_brightning(r, args)
    a = args(1);
    b = args(2);
    enhanced_px = a * r + b;

    if enhanced_px > 255
        enhanced_px = 255;
    elseif enhanced_px < 0
        enhanced_px = 0;
    end
end

function enhanced_px = px_log_transform(r, args)
    c = args(1);
    enhanced_px = c * log(double(1 + r));
end

function enhanced_px = px_pow_transform(r, args)
    c = args(1);
    y = args(2);
    enhanced_px = c * (r ^ y);
end