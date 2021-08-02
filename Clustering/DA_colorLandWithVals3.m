function DA_colorLandWithVals3(mat)
%Paints landscape with prespecified colors and positions. Intensity of the color related to total proportion. 
%Argument: 3x4 matrix with proportions of each cluster in the appropriate positions
 
    % code found at
    % http://stackoverflow.com/questions/3942892/how-do-i-visualize-a-matrix-with-colors-and-values-displayed
    
    Colors = [1 1 1; 0 0 1; 1 0.5 0; 0 1 0; 1 0 1; 0 1 1; 0 0 0; 1 1 0];
    %auxmat = [0 3 0; 1 0 0; 0 8 4; 0 2 0; 6 7 5];
    auxmat = [1 3 5 0; 2 6 4 7];
    mat = [0; mat];
    mat = mat(auxmat+1);
    imagesc(auxmat,'AlphaData', mat, 'AlphaDataMapping', 'scaled');
    colormap(Colors);
                              
    sizeX = size(mat,2);
    sizeY = size(mat,1);
 
    textStrings = num2str(mat(:),'%0.2f');  %# Create strings from the matrix values
    for i=1:size(textStrings,1)
        if strcmp(textStrings(i,:),'0.00')
            textStrings(i,:)='    '; %leave empty the spaces with no cells
        end
    end
   
    textStrings = strtrim(cellstr(textStrings));  %# Remove any space padding
    [x,y] = meshgrid(1:sizeX, 1:sizeY);   %# Create x and y coordinates for the strings
    hStrings = text(x(:),y(:),textStrings(:),...      %# Plot the strings
                    'HorizontalAlignment','center', 'FontSize', 15);
    
    textColors = false(numel(mat),3); %%Choose text color. All black
    m=max(mat,[],'All');
    if mat(1,1)/m>0.5 %if blue strong white text
        textColors(1,:) = [true, true, true];
    end
    if mat(2,2)/m>0.5 %if black strong white text
        textColors(4,:) = [true, true, true];
    end
               
    set(hStrings,{'Color'},num2cell(textColors,2));  %# Change the text colors
 
%     set(gca,'XTick',1:sizeX,...                         %# Change the axes tick marks
%             'YTick',1:sizeY,...
%             'TickLength',[0 0]);
        set(gca,'xticklabel',[]);
        set(gca,'yticklabel',[]);
        
        set(gcf, 'Position', [322 379 259 413]);
end