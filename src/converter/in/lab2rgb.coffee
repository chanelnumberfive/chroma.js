# requrie lab-constants

lab2rgb = () ->
    args = unpack arguments
    [l,a,b] = args
    ###
    adapted to match d3 implementation
    ###
    if l != undefined and l.length == 3
        [l,a,b] = l
    if l != undefined and l.length == 3
        [l,a,b] = l
    y = (l + 16) / 116
    x = y + a / 500
    z = y - b / 200;
    x = lab_xyz(x) * LAB_CONSTANTS.X
    y = lab_xyz(y) * LAB_CONSTANTS.Y
    z = lab_xyz(z) * LAB_CONSTANTS.Z
    r = xyz_rgb( 3.2404542 * x - 1.5371385 * y - 0.4985314 * z)
    g = xyz_rgb(-0.9692660 * x + 1.8760108 * y + 0.0415560 * z)
    b = xyz_rgb( 0.0556434 * x - 0.2040259 * y + 1.0572252 * z)
    [limit(r,0,255), limit(g,0,255), limit(b,0,255), if args.length > 3 then args[3] else 1]

lab_xyz = (x) ->
    if x > 0.206893034 then x * x * x else (x - 4 / 29) / 7.787037

xyz_rgb = (r) ->
    round(255 * (if r <= 0.00304 then 12.92 * r else 1.055 * pow(r, 1 / 2.4) - 0.055))
