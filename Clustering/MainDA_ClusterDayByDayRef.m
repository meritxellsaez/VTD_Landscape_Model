%% It clusers Data from all days and all experimental conditions in one dataset and plots the corresponding distributions and proportions

%It uses the reference set for that day and experimental series to define the gmm and then cluster all experimental conditions considered 
%% Data Loading

%%path of the folder with the data. It assumes a certain structure of folders
pathInput = '.';

%%Choose one Dataset
DataSet = 'Dataset A'; %%options: 'Dataset A' or 'Dataset B1' or 'Dataset B2' or 'Dataset B3' or 'Dataset D'

%%Options for the plots
Reduction = 0.001; %% %of reduction for small bins
smooth = 3; %%smooth for contour curves
saving = 0; %%1 it saves figures, 0 it doesn't
NumBins = 75; %%Number of bins in the histogram

%%Options for the clustering
threshProb = 0.65; %%Minimum posterior probability of cells to cluster

switch DataSet
    case 'Dataset A'
        NumIdxs = 11;
        NumDaysAll = 7*ones(1,NumIdxs);
        dimsClust = 1:5; %%Change to cluster using only a subset of the dimensions
        indxsPlot = [1 3 9 5 11 7 6]; %%Colors for histogram plots
        OrderProteins=1:5; %Reorder proteins to have coherent ordering in the plots
    case 'Dataset B1'
        NumIdxs = 10;
        NumDaysAll = 7*ones(1,NumIdxs);
        dimsClust = 1:5; %%Change to cluster using only a subset of the dimensions
        indxsPlot = [1 3 9 5 11 7 6 13]; %%Colors for histogram plots
        OrderProteins=[4 1 5 3 2];
    case 'Dataset B2'
        NumIdxs = 10;
        NumDaysAll = 7*ones(1,NumIdxs);
        dimsClust = 1:4; %%Change to cluster using only a subset of the dimensions
        indxsPlot = [1 3 9 5 11 7 6]; %%Colors for histogram plots
        OrderProteins=[4 1 3 2];
    case 'Dataset B3'
        NumIdxs = 1;
        NumDaysAll = 7*ones(1,NumIdxs);
        dimsClust = 1:5; %%Change to cluster using only a subset of the dimensions
        indxsPlot = [1 3 9 5 11 7 6 13]; %%Colors for histogram plots
        OrderProteins=[4 1 5 3 2];
    case 'Dataset D'
        NumIdxs = 9;
        NumDaysAll = [3,3,3,2,2,3,2,2,2];
        dimsClust = 1:5; %%Change to cluster using only a subset of the dimensions
        indxsPlot = [1 3 9 5 11 7 6]; %%Colors for histogram plots
        OrderProteins=1:5;
end


Data = cell(1,NumIdxs); %%create cells to contain Data for all experimental conditions
NameData = cell(1,NumIdxs);
NameDays = cell(1,NumIdxs);

for DataIdx = 1:NumIdxs %%Load Data from all experimental conditions
    [Data{DataIdx}, Proteins, NameData{DataIdx}, NameDays{DataIdx}, DataSetSave] =...
        DA_getData(DataSet, DataIdx, pathInput);
end


NumDaysTotal = numel(Data{1});

Days = 1:NumDaysTotal; %%Change to plot only a subset of the days
NumDays = numel(Days);
NumProt = numel(Proteins);
NumSamples = size(Data{1}{1},1); %%We are assuming the number of samples is constant

%% Global initialisation

gmfitaux=[];
numclustaux=0;

if strcmp(DataSet, 'Dataset A')
    DataIdxsAll={1,[1,3],[1,3],[1,3,6],[1,3,6],[1,3,6],[1,3,6]}; %Experimental conditions to define GMM each day. Reference set
    NumClustAll=[1,3,4,6,6,6,5]; %Number of clusters each day
    %InitmuAll contains the mu used to initialise the gmm fitting in order
    %to obtain the best mixed distribution chosen from several random initialisations
    InitmuAll={1.e3*[1,1,1,1,1], 1.e4*[0.6239    0.1866    1.4312    2.4941    0.7893; 0.9270    2.5010    3.1685    1.1339    1.5521; 0.7985    0.5745    2.3621    0.8851    1.3625],...
        1.e4*[1.3829    3.0865    2.4710    0.4354    1.0642; 0.8000    0.2571    1.6965    2.7079    1.3414; 0.6928    2.7153    3.4347    0.7795    1.0185; 0.5940    0.5410    2.9854    0.5219    0.9152],...
        1.e4*[0.5675    0.7155    3.7952    0.5681    0.9598;  2.7966    2.1712    2.6225    0.4343    1.0251; 0.8033    2.5784    3.7396    0.8723    1.1950; 0.7548    0.2768    1.4120    4.8587    1.2933; 0.7207    0.4182    2.9935    1.6278    1.8508; 0.8327    0.4954    1.4238    0.4059    1.2653],...
        1.e4*[0.1 0.1 0.1 0.1 0.1; 0.5425    0.4116    2.1754    0.4045    0.9633; 2.5610    1.1754    1.9153    0.3671    1.0011; 0.5773    0.2510    0.9504    1.8299    2.3301; 0.5675    0.2077    0.8476    4.9253    1.0792; 0.4689    0.2506    1.9770    2.0563    1.8045],...
        1.e4*[2.3261    0.7451    1.5068    0.3375    0.9711; 0.7238    0.3254    1.3005    3.5918    2.1064; 0.5782    0.8986    2.9840    0.8401    0.9549; 0.5780    0.2670    0.8282    4.4704    1.3627; 0.5071    0.2635    0.7301    1.7883    2.0980; 0.2 0.2 0.2 0.2 0.2],...
        1.e4*[0.5431    0.2685    0.7876    0.2622    0.8531; 0.4899    0.4752    2.2509    0.9558    0.9039; 0.4817    0.2181    0.5982    3.0215    1.5508; 0.7954    0.3091    1.1974    4.1025    2.2023; 1.8517    0.3901    1.0812    0.2761    0.8592]};
    indxsPlotLandsAll={2,[2,9,8],[15,2,9,9],[9,15,9,6,13,13],[15,9,15,13,6,13],[15,13,9,6,13,15],[15,9,13,6,15]}; %Position in the table of proportions of the corresponding clustered cells corresponding to the assigned cell type
elseif strcmp(DataSet, 'Dataset B3')
    DataIdxsAll={1,1,1,1,1,1,1};
    NumClustAll=[1,2,1,3,2,3,3];
    InitmuAll={1.e3*[1,1,1,1,1], 1.e3*[2.8083    2.5262    0.6219    2.6572    2.0181; 3.6546    3.3986    0.8964    5.2877    2.6307],...
        1.e3*[1,1,1,1,1],...
        1.e3*[4.0449    3.7436    4.0865    2.6220    2.4036; 9.6329    4.0547    1.1720    0.8995    2.4216; 3.1528    3.0028    2.1499    1.1175    2.0408],...
        1.e3*[6.5589    6.4222    0.8337    0.6870    2.1448; 2.8479    2.4324    2.9898    1.3342    1.9463],...
        1.e4*[0.2723    1.1541    0.0421    0.0639    0.2531; 0.7543    0.7206    0.1618    0.0856    0.2194; 0.2856    0.2358    0.4073    0.2217    0.2013],...
        1.e3*[2.7076    8.7882    0.3978    0.6138    2.0714; 6.9597    8.7416    1.3918    1.0663    2.1853; 2.8454    2.3847    3.0271    3.4474    2.5288]};
    indxsPlotLandsAll={2,[9,2],[9],[9,15,9],[15,9],[10,15,9],[10,9,15]};
elseif strcmp(DataSet, 'Dataset B2')
    DataIdxsAll={1,[1,3],[1,3],[1,3,4],[1,3,4],[1,3,4],[1,3,4]};
    NumClustAll=[1,2,2,6,6,5,6];
    InitmuAll={1.e3*[1,1,1,1], 1.e4*[1.8310    1.5959    1.3416    0.5960; 1.0100    1.2675    0.6597    0.4379],...
        1.e4*[1.0654    1.2100    1.0700    0.4996; 0.4454    1.1110    0.2504    0.4878],...
        1.e4*[0.3113    1.1418    0.1512    0.5888; 2.0202    1.2253    2.3959    0.8684; 1.5887    1.7723    2.6099    1.3942; 0.3564    2.9946    0.7179    1.5696; 0.2897    3.4538    0.2371    0.5662; 0.4810    1.2905    0.4105    0.9545],...
        1.e4*[0.2695    0.7944    0.9252    2.2573; 0.2705    3.6930    0.3496    0.7375; 1.5590    0.8465    2.2226    0.8899; 0.2415    0.8052    0.1280    0.5134; 0.2111    3.0169    0.1611    0.4961; 0.8961    1.3722    1.2762    1.8519],...
        1.e4*[0.9434    0.9342    1.9917    1.2715; 0.2095    0.6767    0.1258    0.4860; 1.9872    1.3856    2.0897    1.9068; 0.3257    0.7416    0.9901    2.4566; 0.2302    2.9638    0.3201    0.5817],...
        1.e4*[0.1867    0.6070    0.1115    0.4703; 0.6084    0.9031    1.3768    1.7654; 0.2038    2.6359    0.4979    0.6577; 2.2345    1.1825    2.1698    1.6172; 0.3510    0.9645    0.2095    0.9158; 0.9916    1.5587    1.6668    2.8455]};
    indxsPlotLandsAll={2,[2,8],[2,9],[9,6,6,9,9,13],[13,9,6,15,9,6],[6,15,6,13,9],[15,13,9,6,9,13]};
elseif strcmp(DataSet, 'Dataset B1')
    DataIdxsAll={1,[1,3],[1,3],[1,3,4],[1,3,4],[1,3,4],[1,3,4]};
    NumClustAll=[1,3,5,7,6,7,4];
    InitmuAll={1.e3*[1,1,1,1,1], 1.e4*[0.4194    0.4099    0.2242    1.0102    0.3385; 0.3037    0.3004    0.1677    0.5416    0.2485; 0.3902    0.7431    0.2624    0.4160    0.3257],...
        1.e4*[0.3368    1.2119    0.1935    0.1342    0.2744; 0.3074    0.3157    0.1477    0.7352    0.2703; 0.3640    0.6569    0.4638    0.2650    0.3013; 0.2930    0.3700    0.1468    0.1548    0.2529; 0.4293    0.4532    0.2130    1.0708    0.4166],...
        1.e4*[0.3535    0.5705    0.1244    0.0940    0.3803; 0.3285    0.4070    0.1363    1.5402    0.5889; 0.4610    0.8376    0.9250    0.4188    0.7282; 0.3499    0.6895    0.1657    0.4490    1.2198; 0.3635    0.9033    0.6663    0.1561    0.3209; 0.4339    0.5780    0.1911    1.9421    0.9326; 1.0639    0.9526    0.2945    0.0930    0.2973],...
        1.e4*[0.2907    0.3707    0.0770    0.0749    0.3103; 0.3591    0.6648    0.5409    0.5242    0.9742; 0.2775    0.7729    0.0754    0.6768    1.7823; 0.3094    0.6452    0.7376    0.1344    0.2905; 0.7684    0.5726    0.2192    0.0693    0.2374; 0.3111    0.4575    0.0915    1.4931    0.5831],...
        1.e4*[0.3076    0.9128    0.0673    0.8314    2.0661; 0.3029    0.4307    0.8766    0.2716    0.3304; 0.3268    0.5679    0.0852    1.3070    0.8293; 0.2969    0.3831    0.0861    0.0731    0.3336; 0.4794    1.0879    0.9573    0.2299    0.4276; 0.8219    0.5747    0.2795    0.0727    0.2582; 0.4430    0.8008    0.1413    1.5442    1.3713],...
        1.e4*[0.2821    0.4261    0.0661    0.0673    0.3461; 0.3471    0.7452    0.0840    1.0826    1.3456; 0.3033    0.5789    0.4579    0.4040    0.4418; 0.5427    0.4741    0.1836    0.0780    0.2738]};
    indxsPlotLandsAll={2,[2,8,9],[9,2,9,9,2],[9,6,9,13,9,6,15],[15,9,13,9,15,6],[13,9,6,15,9,15,6],[15,13,9,15]};
elseif strcmp(DataSet, 'Dataset D')
    DataIdxsAll={1,[1,3],[1,3]};
    NumClustAll=[2,4,4];
    InitmuAll={ 1.e+3*[1.5844    1.0719    3.6462    0.4538    1.5928; 1.3073    0.2214    2.8132    0.3436    1.4554],...
        1.e+3*[1.4144    0.7929    5.4308    0.4541    1.9722; 1.1200    0.1559    1.3610    1.0863    7.5997; 3.8337    0.5371    3.0780    0.1682    1.5279; 1.1642    0.2080    1.02    0.2040    1.7089],...
        1.e3* [1.2960    0.1589    1.0644    1.5883    8.1280; 3.8533    0.2701    2.1362    0.1775    1.7563; 1.5227    0.4152    4.8959    0.5899    2.7694; 1.3999    0.1802    1.2072    0.1724    1.9519] };
    indxsPlotLandsAll={[9, 9],[9, 13, 15, 15],[13, 15, 9, 15] };
end
gmfitAll=cell(1,max(NumDaysAll));

%% Define gmm from reference set day by day

for DaysToUse=1:max(NumDaysAll)
    
    DataIdxs=DataIdxsAll{DaysToUse};
    NumDaysUsed=numel(DaysToUse);
    
    DataAnalise = zeros(numel(DataIdxs)*NumDaysUsed*NumSamples, NumProt+1); %Put all Reference Data in a matrix
    
    for i = 1:numel(DataIdxs)
       for j=1:NumDaysUsed
            j1=DaysToUse(j);
            init = 1+(i-1)*j*NumSamples+(j-1)*NumSamples;%%%%%%%%
            DataAnalise(init:init+NumSamples-1,1:NumProt) = Data{DataIdxs(i)}{j1};
            DataAnalise(init:init+NumSamples-1,NumProt+1) = i*ones(NumSamples,1);
        end
    end
    %%Uncomment to clean the data from outliers
    %Threshold = 15;
    %[Data1, removed] = rmoutliers(DataAnalise,'quartiles', 'ThresholdFactor',Threshold); %remove outliers to help clustering
    Data1 = DataAnalise(:,[OrderProteins,end]);
    
    %%Generate distribution
    NumClust= NumClustAll(DaysToUse);
    
    %Initial gaussian: diagonal covariance and equal proportions
    Initial.mu = InitmuAll{DaysToUse};
    NumDims = numel(dimsClust);
    Initial.Sigma = zeros(NumDims,NumDims,NumClust);
    for i = 1:NumClust
        Initial.Sigma(:,:,i) = 1.e3*eye(NumDims,NumDims);
    end
    Initial.ComponentProportion = (1./NumClust)*ones(1,NumClust);
    
    
    %%fit mixed gaussian to data
    gmfit = fitgmdist(Data1(:,dimsClust), NumClust,'CovarianceType','full',...
        'SharedCovariance',false, 'Options',statset('MaxIter', 300) ,'Start', Initial); %Remove the start option for a random initialisation
    
    %%Use the fitted mixture to cluster all the data with a minimum posterior probability
    P = posterior(gmfit,Data1(:,dimsClust));
    P = max(P,[],2);
    Data2 = Data1(P>threshProb,:);
    
    clusterX = cluster(gmfit, Data2(:,dimsClust));
    
    %%Plot obtained cluster distributins as 1dim histograms and 2d smoothed contour curves
    DA_PlotCombined1DHist_gmfitOrigin(Data2, dimsClust, 1:NumClust, Reduction, clusterX, Proteins(OrderProteins), NumBins, saving, [], [NameDays{1}{DaysToUse}], '', DataSetSave, indxsPlot, gmfit, gmfitaux, numclustaux);
    DA_PlotCombined2DHist(Data2, smooth, 1:NumProt, [1,2,3], Reduction,  clusterX, Proteins(OrderProteins), NumBins, saving, [], [NameDays{1}{DaysToUse}], [], DataSetSave, indxsPlot);
    
    gmfitAll{DaysToUse}=gmfit; %save obtained gmm to perform clustering later
end

%%  Use the global distribution to cluster each experimental condition for each day and plot the resulting proportion tables

ClusteredDataWithThd = zeros(7, NumDays, 7);
auxIdx=1;
ClusteredDataAll = cell(11,7);
ClusteredDataUndTrans = cell(11,7);

for DataIdx = 1:NumIdxs %%Change to plot only some experimental conditions
    
    fig = figure('Position', [463 24 290 770]);
    sgtitle([NameData{DataIdx}], 'FontSize',18); %Only from Matlab2018b
    
    NumDays = NumDaysAll(DataIdx);
    for Day = 1:NumDays
        
        %%Take current subset of data
        DataX = Data{DataIdx}{Day};
        DataX=DataX(:,OrderProteins);
        
        %%Consider only points with minimum posterior probability
        gmfit=gmfitAll{Day};
        NumClust=NumClustAll(Day);
        P = posterior(gmfit,DataX(:,dimsClust));
        P = max(P,[],2);
        Data2D = DataX(P>threshProb,:);
        
        clusterX = cluster(gmfit, DataX(:,dimsClust));
        DataClustered = [DataX, clusterX];
        ClusteredDataAll{DataIdx,Day} = DataClustered; %proportions without threshold probability
        
        clusterXD = cluster(gmfit, Data2D(:,dimsClust));
        DataClusteredUndTrans = [Data2D, clusterXD];
        ClusteredDataUndTrans{DataIdx,Day} = DataClusteredUndTrans;
         
        indxsPlotLands=indxsPlotLandsAll{Day};
        
        %%Specific proporties of cell ientity assignment
        if strcmp(DataSet, 'Dataset B1')
            if DataIdx==1 || DataIdx==8
                aux=find(indxsPlotLands==8);
                indxsPlotLands(aux) = 2*ones(size(aux));
            end
        elseif strcmp(DataSet, 'Dataset B2')
            if DataIdx==1 || DataIdx==8
                aux=find(indxsPlotLands==8);
                indxsPlotLands(aux) = 2*ones(size(aux));
            end
        end
        
        %%Plot Landscape with percentages in each state
        Landscape = zeros(5, 3);
        for i = 1:NumClust
            Landscape(indxsPlotLands(i)) = Landscape(indxsPlotLands(i))+numel(Data2D(clusterXD==i,1))/size(DataX,1); % Proportion of cells in each cluster
        end
        Landscape(5)=sum(P<=threshProb)/size(DataX,1);
        
        %%Specific proporties of cell ientity assignment
        if strcmp(DataSet, 'Dataset A')
            if Day==5
                auxLands = Landscape(6);
            elseif Day>5
                auxN = Landscape(13)+Landscape(6);
                Landscape(6) = min(auxLands, auxN);
                Landscape(13) = max(auxN-auxLands,0);
                
            end
        elseif strcmp(DataSet, 'Dataset B1')
            if  Day==5
                auxLands = Landscape(6);
            elseif  Day>5
                auxN = Landscape(13)+Landscape(6);
                Landscape(6) = min(auxLands, auxN);
                Landscape(13) = max(auxN-auxLands,0);
            end
            if ~ismember(DataIdx,[1,2,8]) && Day>2
                Landscape(8)=Landscape(8)+Landscape(2);
                Landscape(2)=0;
            end
        elseif strcmp(DataSet, 'Dataset B2')
            if Day==5
                auxLands = Landscape(6);
            elseif Day>5
                Landscape(13) = max(Landscape(13)+Landscape(6)-auxLands,0);
                Landscape(6) = auxLands;
            end
            if ~ismember(DataIdx,[1,2,8]) && Day>2
                Landscape(8)=Landscape(8)+Landscape(2);
                Landscape(2)=0;
            end
        end
        LandsToMatrix = [2, 8, 6, 13, 15, 9, 5 ]; %Reorder states from table disposition to a vector
        for i=1:7
            ClusteredDataWithThd(auxIdx, Day, i) = Landscape(LandsToMatrix(i));
        end
        
        subplot(NumDaysAll(DataIdx),1,Day);
        
        DA_colorLandWithVals3(Landscape(LandsToMatrix(:)));
        ylabel(NameDays{DataIdx}{Day});
        
    end
    auxIdx=auxIdx+1;
end
