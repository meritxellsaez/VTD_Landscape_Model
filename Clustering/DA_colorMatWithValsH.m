function DA_colorMatWithValsH(mat, color)
%Prints the value in in first argument with the background given in color
%as a number from 1 to 8
 
    % code found at
    % http://stackoverflow.com/questions/3942892/how-do-i-visualize-a-matrix-with-colors-and-values-displayed
   
    image(color);            %# Create a colored plot of the matrix values
                               
    sizeX = size(mat,2);
    sizeY = size(mat,1);
 
    textStrings = num2str(mat(:),'%0.2f');  %# Create strings from the matrix values
    for i=1:size(textStrings,1)
        if strcmp(textStrings(i,:),'0.00')
            textStrings(i,:)='    ';
        end
    end
   
    textStrings = strtrim(cellstr(textStrings));  %# Remove any space padding
    [x,y] = meshgrid(1:sizeX, 1:sizeY);   %# Create x and y coordinates for the strings
    hStrings = text(x(:),y(:),textStrings(:),...      %# Plot the strings
                    'HorizontalAlignment','center', 'FontSize', 15);
   
                                                
     if color<=2 %White text over blue and black
         textColors = true(numel(mat),3);
     else %Black text in the others
         textColors = false(numel(mat),3);
     end
                                                 
    set(hStrings,{'Color'},num2cell(textColors,2));  %# Change the text colors
 
    set(gca,'xticklabel',[]);
    set(gca,'yticklabel',[]);
end