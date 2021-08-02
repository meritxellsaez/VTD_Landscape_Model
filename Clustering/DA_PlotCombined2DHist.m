function DA_PlotCombined2DHist(Data1, smooth, ProteinsToPlot, Clust,Reduction, ...
    clusterX, Proteins, NumBins, saving, SaveName, NameDay, NameData, DataSetSave, idxsPlot)
%Plot 2D contour curves for all clusters of each two proteins with prespecified colors. The x axis of the plots and
%Arguments: Data1, dimensions to plot, clusters to plot, 
%clustered Data, name of Proteins, bins for the histograms, saving or not (0,1), name to save, 
%day name, name of data for figure, folder to save, indexes for the
%clusters (ordered)

NumClust = numel(Clust);

figure('Position', [50 30 450 900]);
sgtitle([DataSetSave, NameData, ' ', NameDay], 'FontSize',18); %Only from Matlab2018b
n = numel(ProteinsToPlot);
if mod(n,2) == 0 %Determine number of subplots
    dim1 = n-1;
    dim2 = n/2;
else
    dim1 = n;
    dim2 = (n-1)/2;
end


k = 0; %Keep track of the current subplot
for i = ProteinsToPlot %loop over all proteins
    for j = ProteinsToPlot %loop over all other proteins for the plot
        if i < j %Avoid diagonal
            k = k+1; %update subplot number
            toPlot = [i,j];
            DataPlot = Data1(:,toPlot);

            Labels = {Proteins(toPlot(1)),Proteins(toPlot(2))};
            subplot(dim1, dim2, k);
            DA_PlotWithCluster(DataPlot, smooth,Reduction,  clusterX, Clust, Labels, NumBins, idxsPlot);%plot level curves corresponding with the clusters                       
        end
   end
end

if saving==1
    saveas(gcf, fullfile(pwd,...% 'figures bistability', DataSetSave,...
        [SaveName, NameDay, '_HistAll2Prot_', num2str(NumClust),'C_Data.png'])); %Save figure
end
end