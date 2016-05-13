% function that computes the value for the dxy orbital
function w = dxyOrbital(x, y, z) 
    w = x.* y.*exp(-sqrt(x.^2 + y.^2 + z.^2));
end
