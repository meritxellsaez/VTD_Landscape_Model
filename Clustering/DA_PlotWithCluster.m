function LimitsPlot = DA_PlotWithCluster(DataPlot,smooth,Reduction, clusterX, Clust, Labels, NumBins, indxsPlot )
%Plot 2D contour curves given nx2 data with prespecified colors for the
%clusters. Low intensity heat map on the background.
%Arguments: Data nx2, smoothing factor, Reduction factor for empty zones,
%clustered labels, clusters to plot, labels for x and y axis, number of
%bins in each dimension, indexes for the clusters (ordered)

    NumClust = numel(Clust);
    str = cell(1,NumClust);
    for i = 1:NumClust
        str{i} = num2str(Clust(i)); %Strings for the legend
    end
 
    Colors = {'b', 'w','g', 'w', 'k','y', 'm','w', 'c','w', 'r', 'w'}; %Color for each position in landscape
    [Values, Centers] = hist3(DataPlot,'Nbins',[NumBins,NumBins]);
    d1 = (Centers{1}(2)-Centers{1}(1))/2;
    d2 = (Centers{2}(2)-Centers{2}(1))/2;
    
    LimitsPlot = [Centers{1}(1)-d1 , Centers{1}(end)+d1, Centers{2}(1)-d2, Centers{2}(end)+d2];
    
    if Reduction > 0 %Remove empty zones
        maximVal = max(Values,[], 'all');
        threshold = maximVal*Reduction;
        initrows = find(max(Values,[],2)>threshold,1);
        finrows = find(max(Values,[],2)>threshold,1, 'last');
        initcolumns = find(max(Values)>threshold,1);
        fincolumns = find(max(Values)>threshold,1,'last');

        %Remove points 
        LimitsPlot = [Centers{1}(initrows)-d1 , Centers{1}(finrows)+d1, Centers{2}(initcolumns)-d2, Centers{2}(fincolumns)+d2];
        Xmod = DataPlot(DataPlot(:,1)>LimitsPlot(1) & DataPlot(:,1)<LimitsPlot(2) & DataPlot(:,2)>LimitsPlot(3) & DataPlot(:,2)<LimitsPlot(4) ,:);
        [Values, Centers] = hist3(Xmod,'Nbins',[NumBins,NumBins]);
        d1 = (Centers{1}(2)-Centers{1}(1))/2;
        d2 = (Centers{2}(2)-Centers{2}(1))/2;
    end
    
    Values = imgaussfilt(Values,smooth); %Smoothing of the image. Parameter defines how much
    %Heat map on the background
    imagesc([Centers{1}(1), Centers{1}(end)]+[-d1,d1], [Centers{2}(1), Centers{2}(end)]+[-d2,d2], Values', 'AlphaData', 0.6);
    set(gca,'YDir','normal'); 
    hold on;
    colormap(flipud(hot));
    
    %%Contour curves for each cluster
    for i = 1:NumClust
        Xmod = DataPlot(clusterX==Clust(i),:);
        [Values, Centers] = hist3(Xmod,'Nbins',[NumBins,NumBins]);
        
        Values = imgaussfilt(Values,smooth); %Smoothing of the image. Parameter defines how much
        [X,Y] = meshgrid(Centers{1}, Centers{2});
        contour(X,Y,Values',Colors{indxsPlot(Clust(i))},'LineWidth', 1.1);
        
        
    end
    xlabel(Labels{1},'FontSize', 12);
    ylabel(Labels{2},'FontSize', 12);
    legend(str, 'Location', 'eastoutside', 'FontSize', 12);
    axis('square');


end