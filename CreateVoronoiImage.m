function [ VoronoiImage ] = CreateVoronoiImage( WIDTH, HEIGHT, N_CELLS )
%CreateVoronoiImage Returns an RGB image of size WIDTH x HEIGHT, containing
%N_CELLS voronoi cells
%   Cells are colored randomly and the N_CELLS points that trigger the
%   cells are marked with a black pixel.
    VoronoiImage = zeros(HEIGHT,WIDTH,3);
    
    % Randomize cell centers
    rPos = round([HEIGHT-1 WIDTH-1].*rand(N_CELLS,2) + 1);
%     rPos = [width height].*rand(cells,2);

    
    
    
    for i = 1:N_CELLS
        VoronoiImage(rPos(i,1),rPos(i,2),:) = rand(1,3);
    end
    count = 0;
    for x = 1:WIDTH
        for y = 1:HEIGHT
            %compute Euclidean distances:
            distances = sqrt(sum(bsxfun(@minus, rPos, [y x]).^2,2));
            %find the smallest distance and use that as an index into B:
            
            closest = rPos(find(distances==min(distances)),:);
            if (size(closest,1) > 1)
                closest = closest(1,:);
                count = count +1;
            end
            VoronoiImage(y,x,:) = VoronoiImage(closest(1),closest(2),:);
        end
    end
    
    for i = 1:N_CELLS
        VoronoiImage(rPos(i,1),rPos(i,2),:) = 0;
    end
end