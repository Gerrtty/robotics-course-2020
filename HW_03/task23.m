r = [0, 1];
arr = ones(8, 3);
rr = r(2) - r(1);

Rot = [1, 0, 0, 0; 0, -1, 0, 0; 0, 0, -1, 0; 0, 0, 0, 1];

plot_cube();
plot_cube_with_homogenious(Rot);

function out = plot_cube()
    r = [0, 1];
    arr = ones(8, 3);
    rr = r(2) - r(1);
    
    c = 1;
    for i = r
        for j = r
            for k = r
                arr(c, 1) = i;
                arr(c, 2) = j;
                arr(c, 3) = k;
                c = c + 1;
            end
        end
    end

    combs = ones(28, 2, 3);

    c = 1;
    for i = 1:8
        for j = i+1:8
            for k = 1:3
                combs(c, 1, k) = arr(i, k);
                combs(c, 2, k) = arr(j, k);
            end
            c = c + 1;
        end
    end

    figure
    xlabel('x'); ylabel('y'); zlabel('z') 
    scatter3(0, 0, 0, 'filled');
    hold on;
    for i = 1:28
        x = [combs(i, 1, 1), combs(i, 2, 1)];
        y = [combs(i, 1, 2), combs(i, 2, 2)];
        z = [combs(i, 1, 3), combs(i, 2, 3)];
        r1 = abs(x(1) - x(2));
        r2 = abs(y(1) - y(2));
        r3 = abs(z(1) - z(2));
        if (r1 + r2 + r3) == rr
            plot3(x, y, z, 'color', 'b');
            hold on;
        end
    end
    hold off;
    out = "cube plotted successfully";
end

function out = plot_cube_with_homogenious(Rot)
    debug = true;
    r = [0, 1];
    arr = ones(8, 3);
    rr = r(2) - r(1);
    
    c = 1;
    for i = r
        for j = r
            for k = r
                arr(c, 1) = i;
                arr(c, 2) = j;
                arr(c, 3) = k;
                c = c + 1;
            end
        end
    end

    combs = ones(28, 2, 3);

    c = 1;
    for i = 1:8
        for j = i+1:8
            for k = 1:3
                combs(c, 1, k) = arr(i, k);
                combs(c, 2, k) = arr(j, k);
            end
            c = c + 1;
        end
    end

    figure
    xlabel('x'); ylabel('y'); zlabel('z')  
    scatter3(0, 0, 0, 'filled');
    hold on;
    for i = 1:28
        x = [combs(i, 1, 1), combs(i, 2, 1)];
        y = [combs(i, 1, 2), combs(i, 2, 2)];
        z = [combs(i, 1, 3), combs(i, 2, 3)];
        r1 = abs(x(1) - x(2));
        r2 = abs(y(1) - y(2));
        r3 = abs(z(1) - z(2));
        p1 = [x(1), y(1), z(1), 1];
        p2 = [x(2), y(2), z(2), 1];
        if (r1 + r2 + r3) == rr
            if debug
                plot3(x, y, z, 'color', 'b');
                hold on;
            end
            p1 = Rot * p1';
            p2 = Rot * p2';
            plot3([p1(1), p2(1)], [p1(2), p2(2)], [p1(3), p2(3)], 'color', 'r');
            hold on;
        end
    end
    hold off;
    out = "cube plotted successfully";
end