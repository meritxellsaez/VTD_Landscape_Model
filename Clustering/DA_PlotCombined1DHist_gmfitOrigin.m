function DA_PlotCombined1DHist_gmfitOrigin(Data1, ProteinsToPlot, Clust, Reduction,...
    clusterX,  Proteins, NumBins, saving, SaveName, NameDay, NameData, DataSetSave, indxsPlot, gmfit, gmfitaux, numclustaux)
%Plot 1D histograms for all clusters of each protein and show proportion
%and "color" for prespecified colors. The x axis of the plots and
%normalized for each protein to ease comparison.
%Arguments: Data1, dimensions to plot, clusters to plot, Reduction factor, 
%clustered Data, name of Proteins, bins for the histograms, saving or not (0,1), name to save, 
%day name, name of data for figure, folder to save, indexes for the
%clusters (ordered), fitted gaussian mixture

Colors = [0 0 1; 0 0 0; 0 1 0; 0 1 1; 1 0 1; 1 0 0; 1 1 0; 0.5 0.5 0.5];
auxmat = [1 0 5 0; 8 2 0 6; 3 7 4 0]; %%Positions of the clusters in the landscape to decide colors

NumClust = numel(Clust);
NumProts=numel(Proteins);

Counts = zeros(NumClust,1);
for i = 1:NumClust
    Counts(i) = numel(Data1(clusterX==Clust(i),1))/size(Data1,1); % Proportion of cells in each cluster
end

figure('Position', [10 10 700 700]);
sgtitle([DataSetSave, NameData, ' ' , NameDay], 'FontSize',18); %Only from Matlab2018b
for numProt = 1:NumProts
    %numProt = ProteinsToPlot(numProt);
    hb = cell(1,NumClust); %cell to contain handles of plots and normalize axes at the end
    xLimsGlobal = [];

    minProt = min(Data1(:,numProt),[], 'all'); %Total range of the histograms
    maxProt = max(Data1(:,numProt), [],'all');
    hLims0 = linspace(minProt,maxProt,NumBins);
    for i = 1:NumClust
        
        [hVals, hLims] = histcounts(Data1(clusterX==Clust(i),numProt),hLims0);
        hCenters = hLims(1:end-1) + (hLims(2:end) - hLims(1:end-1))/2;
        
        %remove small bins corresponding to noise
        maximVal = max(hVals);
        threshold = maximVal*Reduction;
        init = find(hVals>threshold, 1);
        if isempty(init)
            init = 1;
        end
        final = find(hVals>threshold, 1,'last')+1;
        if isempty(final)
            final = 2;
        end
        
        if ismember(i, numclustaux)
            i1=find(numclustaux==i);
            xPdf = linspace(hLims(1), hLims(end),300); %To plot marginal normal from fitted distribution
            mypdf1 = normpdf(xPdf, gmfitaux.mu(i1,numProt), sqrt(gmfitaux.Sigma(numProt,numProt,i1)));
            wPdf = sum(hVals)*(hLims(end) - hLims(1))/NumBins;
        else
            if ismember(numProt, ProteinsToPlot)
                j=find(ProteinsToPlot==numProt);
                xPdf = linspace(hLims(1), hLims(end),300); %To plot marginal normal from fitted distribution
                mypdf1 = normpdf(xPdf, gmfit.mu(i,j), sqrt(gmfit.Sigma(j,j,i)));
                wPdf = sum(hVals)*(hLims(end) - hLims(1))/NumBins;
            end
        end
               
        %%plot
        subplot(NumClust, NumProts+1+1, numProt+(i-1)*(NumProts+1+1));
        hb{i} = bar(hCenters, hVals, 1, 'EdgeColor', 'none');
        hold on;
        if ismember(i, numclustaux) || ismember(numProt, ProteinsToPlot)
           plot(xPdf, wPdf*mypdf1,'Color', 'k', 'LineWidth', 1.5, 'LineStyle', '-');
        end
        hb{i}.Parent.XLim = [hLims(init), hLims(final)];
        
        
        if i == 1 %titles in adequate rows/columns
            title(Proteins{numProt}, 'FontSize',12);
        end
        if numProt==1 %Proportion in the last column
            ylabel(['Cluster ', num2str(Clust(i))],'FontSize',18);
            subplot(NumClust, NumProts+1+1, (NumProts+1+1)*i-1);
            DA_colorMatWithValsH(Counts(i), auxmat(indxsPlot(i))); %Print proportion of the clusters
            colormap(Colors);
            
            subplot(NumClust, NumProts+1+1, (NumProts+1+1)*i);
            NumIdxs=round(max(Data1(:,end)));
            Proportions=zeros(NumIdxs,1);
            for id=1:NumIdxs
                Proportions(id,1)=numel(Data1((clusterX==Clust(i))& (squeeze(Data1(:,end))==id),1))/(Counts(i)*size(Data1,1));
            end
            DA_colorMatWithValsH(Proportions, auxmat(indxsPlot([2,6,3]))');
            colormap(Colors);
        end
        
        
        %%Normalization of the axis
        if isempty(xLimsGlobal)
            xLimsGlobal = hb{i}.Parent.XLim;
            %yLimsGlobal=hb{j}.Parent.YLim; %uncomment to normalize vertical axis
        else
            if xLimsGlobal(1)>hb{i}.Parent.XLim(1)
                xLimsGlobal(1) = hb{i}.Parent.XLim(1);
            end
            if xLimsGlobal(2)<hb{i}.Parent.XLim(2)
                xLimsGlobal(2) = hb{i}.Parent.XLim(2);
            end
            %if yLimsGlobal(1)>hb{j}.Parent.YLim(1)%uncomment to normalize vertical axis
             %   yLimsGlobal(1)=hb{j}.Parent.YLim(1);%uncomment to normalize vertical axis
            %end
            %if yLimsGlobal(2)<hb{j}.Parent.YLim(2)%uncomment to normalize vertical axis
            %    yLimsGlobal(2)=hb{j}.Parent.YLim(2);%uncomment to normalize vertical axis
            %end  
        end
    end
    for i = 1:NumClust %final normalization of the axis
        hb{i}.Parent.XLim = xLimsGlobal;
        %hb{j}.Parent.YLim=yLimsGlobal;%uncomment to normalize vertical axis
%         Limits(i,:)=xLimsGlobal;
    end
end

if saving==1
    saveas(gcf, fullfile(pwd,...%, 'figures bistability', DataSetSave,...
        [DataSetSave, strrep(NameData, ' ', ''), strrep(strrep(NameDay,'.','p'), ' ', ''), '_HistAllProtGlobalDist_', num2str(NumClust),'C.png'])); %Save figures
end

end