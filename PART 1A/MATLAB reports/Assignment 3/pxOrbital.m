% function for computing the value of px
function w = pxOrbital(x, y, z) 
    w = x.*exp(-sqrt(x.^2 + y.^2 + z.^2));
end




