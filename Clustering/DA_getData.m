function [Data, Proteins, NameData, NameDays, DataSetSave]=DA_getData(Dataset, DataIdx, pathInput)
%Loads data from the folder in pathInput. Needs the coded name for the
%Dataset and DataIdx refers to the experimental conditions. It returns the
%Data in a cell with the different days, the names of the proteins, the
%name of the Data for titles and the names of the Days present in the data



%%get the correct paths for the datafiles and the details
switch Dataset %contains code for the Data
    case 'Dataset A'
        Days = 7;
        file = cell(1, Days);
        NameDays = {'Day 2', 'Day 2.5', 'Day 3', 'Day 3.5', 'Day 4', 'Day 4.5', 'Day 5'};
        pathInputfull = fullfile(pathInput,'Data_18_08_14_clean');
        NamesData = {'No CHIR', 'CHIR 2-2.5','CHIR 2-3','CHIR 2-3.5', 'CHIR 2-4', 'CHIR 2-5',...
            'CHIR 2-5 FGF 2-3', 'CHIR 2-5 FGF 2-3.5', 'CHIR 2-5 FGF 2-4', 'CHIR 2-5 FGF 2-4.5', 'CHIR 2-5 FGF 2-5'};
        NameData = NamesData{DataIdx};
        Proteins = {'TBX6','BRA','CDX2','SOX2','SOX1'};
        DataSetSave = 'DatasetA';
        file{1} = fullfile(pathInputfull, 'D2_A1_A01_002.fcs .csv');
        switch DataIdx %contains code for the conditions
            case 1 %No CHIR
                file{2} = fullfile(pathInputfull, 'D2.5_A2_A02_003.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D3_A4_A04_005.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D3.5_A7_A07_008.fcs .csv');
                file{5} = fullfile(pathInputfull, 'D4_A11_A11_012.fcs .csv');
                file{6} = fullfile(pathInputfull, 'D4.5_B4_B04_017.fcs .csv');
                file{7} = fullfile(pathInputfull, 'D5_B10_B10_023.fcs .csv');
            case 2 %CHIR 2-2.5
                file{2} = fullfile(pathInputfull, 'D2.5_C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D3_C2-2.5_A5_A05_006.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D3.5_C2-2.5_A8_A08_009.fcs .csv');
                file{5} = fullfile(pathInputfull, 'D4_C2-2.5_A12_A12_013.fcs .csv');
                file{6} = fullfile(pathInputfull, 'D4.5_C2-2.5_B5_B05_018.fcs .csv');
                file{7} = fullfile(pathInputfull, 'D5_C2-2.5_B11_B11_024.fcs .csv');
            case 3 %CHIR 2-3
                file{2} = fullfile(pathInputfull, 'D2.5_C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D3_C2-3_A6_A06_007.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D3.5_C2-3_A9_A09_010.fcs .csv');
                file{5} = fullfile(pathInputfull, 'D4_C2-3_B1_B01_014.fcs .csv');
                file{6} = fullfile(pathInputfull, 'D4.5_C2-3_B6_B06_019.fcs .csv');
                file{7} = fullfile(pathInputfull, 'D5_C2-3_B12_B12_025.fcs .csv');
            case 4 %CHIR 2-3.5
                file{2} = fullfile(pathInputfull, 'D2.5_C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D3_C2-3_A6_A06_007.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D3.5_C2-3.5_A10_A10_011.fcs .csv');
                file{5} = fullfile(pathInputfull, 'D4_C2-3.5_B2_B02_015.fcs .csv');
                file{6} = fullfile(pathInputfull, 'D4.5_C2-3.5_B7_B07_020.fcs .csv');
                file{7} = fullfile(pathInputfull, 'D5_C2-3.5_C1_C01_026.fcs .csv');
            case 5 %CHIR 2-4
                file{2} = fullfile(pathInputfull, 'D2.5_C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D3_C2-3_A6_A06_007.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D3.5_C2-3.5_A10_A10_011.fcs .csv');
                file{5} = fullfile(pathInputfull, 'D4_C2-4_B3_B03_016.fcs .csv');
                file{6} = fullfile(pathInputfull, 'D4.5_C2-4_B8_B08_021.fcs .csv');
                file{7} = fullfile(pathInputfull, 'D5_C2-4_C2_C02_027.fcs .csv');
            case 6 %CHIR 2-5
                file{2} = fullfile(pathInputfull, 'D2.5_C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D3_C2-3_A6_A06_007.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D3.5_C2-3.5_A10_A10_011.fcs .csv');
                file{5} = fullfile(pathInputfull, 'D4_C2-4_B3_B03_016.fcs .csv');
                file{6} = fullfile(pathInputfull, 'D4.5_C2-4.5_B9_B09_022.fcs .csv');
                file{7} = fullfile(pathInputfull, 'D5_C2-5_C3_C03_028.fcs .csv');
            case 7 %CHIR 2-5 FGF 2-3
                file{2} = fullfile(pathInputfull, 'D2.5_C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D3_C2-3_A6_A06_007.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D3.5_CF2-3_C4_C04_029.fcs .csv');
                file{5} = fullfile(pathInputfull, 'D4_CF2-3_C6_C06_031.fcs .csv');
                file{6} = fullfile(pathInputfull, 'D4.5_CF2-3_C9_C09_034.fcs .csv');
                file{7} = fullfile(pathInputfull, 'D5_CF2-3_D1_D01_038.fcs .csv');
            case 8 %CHIR 2-5 FGF 2-3.5
                file{2} = fullfile(pathInputfull, 'D2.5_C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D3_C2-3_A6_A06_007.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D3.5_CF3.5_C5_C05_030.fcs .csv');
                file{5} = fullfile(pathInputfull, 'D4_CF2-3.5_C7_C07_032.fcs .csv');
                file{6} = fullfile(pathInputfull, 'D4.5_CF2-3.5_C10_C10_035.fcs .csv');
                file{7} = fullfile(pathInputfull, 'D5_CF2-3.5_D2_D02_039.fcs .csv');
            case 9 %CHIR 2-5 FGF 2-4
                file{2} = fullfile(pathInputfull, 'D2.5_C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D3_C2-3_A6_A06_007.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D3.5_CF3.5_C5_C05_030.fcs .csv');
                file{5} = fullfile(pathInputfull, 'D4_CF2-4_C8_C08_033.fcs .csv');
                file{6} = fullfile(pathInputfull, 'D4.5_CF2-4_C11_C11_036.fcs .csv');
                file{7} = fullfile(pathInputfull, 'D5_CF2-4_D3_D03_040.fcs .csv');
            case 10 %CHIR 2-5 FGF 2-4.5
                file{2} = fullfile(pathInputfull, 'D2.5_C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D3_C2-3_A6_A06_007.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D3.5_CF3.5_C5_C05_030.fcs .csv');
                file{5} = fullfile(pathInputfull, 'D4_CF2-4_C8_C08_033.fcs .csv');
                file{6} = fullfile(pathInputfull, 'D4.5_CF2-4.5_C12_C12_037.fcs .csv');
                file{7} = fullfile(pathInputfull, 'D5_CF2-4.5_D4_D04_041.fcs .csv');
            case 11 %CHIR 2-5 FGF 2-5
                file{2} = fullfile(pathInputfull, 'D2.5_C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D3_C2-3_A6_A06_007.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D3.5_CF3.5_C5_C05_030.fcs .csv');
                file{5} = fullfile(pathInputfull, 'D4_CF2-4_C8_C08_033.fcs .csv');
                file{6} = fullfile(pathInputfull, 'D4.5_CF2-4.5_C12_C12_037.fcs .csv');
                file{7} = fullfile(pathInputfull, 'D5_CF2-5_D5_D05_042.fcs .csv');
        end
        
    case 'Dataset D'
        NumDays = [3,3,3,2,2,3,2,2,2];
        Days = NumDays(DataIdx);
        file = cell(1,Days);
        pathInputfull = fullfile(pathInput,'Data_18_10_25');
        file{1} = fullfile(pathInputfull, 'D3 WT C_E1_E01_148.fcs .csv'); 
        NamesData = {'CHIR 2-3','CHIR 2-4','CHIR 2-5', 'CHIR 2-3 PD 3-4', 'CHIR 2-3 RA 3-4', 'CHIR 2-4 RA 4-5',...
            'CHIR 2-3.5', 'CHIR 2-3.5 PD 3.5-4.5', 'CHIR 2-3.5 RA 3.5-4.5'};
        NameData = NamesData{DataIdx};
        Proteins = {'TBX6','BRA','CDX2','SOX2','SOX1'};
        DataSetSave = 'DatasetD';
        
        switch DataIdx
            case 1 %CHIR 2-3
                file{2} = fullfile(pathInputfull, 'D4 WT C2-3_E4_E04_151.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5 WT C2-3_F3_F03_162.fcs .csv');
                NameDays = {'Day 3', 'Day 4', 'Day 5'};
            case 2 %CHIR 2-4
                file{2} = fullfile(pathInputfull, 'D4 WT C_E3_E03_150.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5 WT C2-4_F4_F04_163.fcs .csv');
                NameDays = {'Day 3', 'Day 4', 'Day 5'};
            case 3 %CHIR 2-5
                file{2} = fullfile(pathInputfull, 'D4 WT C_E3_E03_150.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5 WT C_F2_F02_161.fcs .csv');
                NameDays = {'Day 3', 'Day 4', 'Day 5'};
            case 4 %CHIR 2-3 PD 3-4
                file{2} = fullfile(pathInputfull, 'D4 WT C2-3 PD_3-4_E5_E05_152.fcs .csv');
                NameDays = {'Day 3', 'Day 4'};
            case 5 %CHIR 2-3 RA 3-4
                file{2} = fullfile(pathInputfull, 'D4 WT C2-3 RA_3-4_E6_E06_153.fcs .csv');
                NameDays = {'Day 3', 'Day 4'};
            case 6 %CHIR 2-4 RA 4-5
                file{2} = fullfile(pathInputfull, 'D4 WT C_E3_E03_150.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5 WT C2-4 RA_4-5_F5_F05_164.fcs .csv');
                NameDays = {'Day 3', 'Day 4', 'Day 5'};
            case 7 %CHIR 2-3.5
                file{2} = fullfile(pathInputfull, 'D4.5 WT C2-3.5_E11_E11_158.fcs .csv');
                NameDays = {'Day 3', 'Day 4.5'};
            case 8 %CHIR 2-3.5 PD 3.5-4.5
                file{2} = fullfile(pathInputfull, 'D4.5 WT C2-3.5 PD_3.5-4.5_E12_E12_159.fcs .csv');
                NameDays = {'Day 3', 'Day 4.5'};
            case 9 %CHIR 2-3.5 RA 3.5-4.5
                file{2} = fullfile(pathInputfull, 'D4.5 WT C2-3.5 RA_3.5-4.5_F1_F01_160.fcs .csv');
                NameDays = {'Day 3', 'Day 4.5'};
        end
        
    case 'DatasetB1'
        Days = 7;
        file = cell(1, Days);
        NameDays = {'Day 2', 'Day 2.5', 'Day 3', 'Day 3.5', 'Day 4', 'Day 4.5', 'Day 5'};
        pathInputfull = fullfile(pathInput,'Data_15_4_20');
        NamesData = {'No CHIR', 'CHIR 2-2.5','CHIR 2-3', 'CHIR 2-5',...%'CHIR 2-5 FOX2',...
            'CHIR 2-3 0.1','CHIR 2-3 0.3','CHIR 2-3 0.5','0.1 CHIR 2-5',...
            'CHIR 1 Pulse', 'CHIR 2 Pulses'};
        NameData = NamesData{DataIdx};
        Proteins = {'BRA','SOX1','SOX2','TBX6','CDX2'};
        DataSetSave = '150420';
        file{1} = fullfile(pathInputfull, 'NMP', 'D2_A1_A01_002.fcs .csv');
        switch DataIdx %contains code for the conditions
            case 1 %No CHIR
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5_A2_A02_003.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3_A5_A05_006.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5_A10_A10_011.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4_B8_B08_021.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5_C6_C06_031.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5_D4_D04_041.fcs .csv');
            case 2 %CHIR 2-2.5
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C2-2.5_A8_A08_009.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C2-2.5_B5_B05_018.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C2-2.5_C3_C03_028.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C2-2.5_D1_D01_038.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C2-2.5_D11_D11_048.fcs .csv');
            case 3 %CHIR 2-3
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C_A6_A06_007.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C2-3_A12_A12_013.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C2-3_B10_B10_023.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C2-3_C8_C08_033.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C2-3_D6_D06_043.fcs .csv');
            case 4 %CHIR 2-5
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C_A6_A06_007.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C_A11_A11_012.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C_B9_B09_022.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C_C7_C07_032.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C_D5_D05_042.fcs .csv');
            case 5 %CHIR 2-3 0.1
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C_A6_A06_007.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C2-3 C0.1_B2_B02_015.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C2-3 C0.1_B12_B12_025.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C2-3 C0.1_C10_C10_035.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C2-3 C0.1_D8_D08_045.fcs .csv');
            case 6 %CHIR 2-3 0.3
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C_A6_A06_007.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C2-3 C0.3_B3_B03_016.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C2-3 C0.3_C1_C01_026.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C0.3_C11_C11_036.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C2-3 C0.3_D9_D09_046.fcs .csv');
            case 7 %CHIR 2-3 0.5
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C_A6_A06_007.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C2-3 C0.5_B4_B04_017.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C2-3 C0.5_C2_C02_027.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C2-3 C0.5_C12_C12_037.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C2-3 C0.5_D10_D10_047.fcs .csv');
            case 8 %0.1 CHIR 2-5
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C0.1_A4_A04_005.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C0.1_A7_A07_008.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C0.1_B1_B01_014.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C0.1_B11_B11_024.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C0.1_C9_C09_034.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C0.1_D7_D07_044.fcs .csv');
            case 9 %CHIR 1 pulse
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 pulse_A9_A09_010.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 1pulse_B6_B06_019.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 1pulse_C4_C04_029.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 1pulse_D2_D02_039.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 1pulse_D12_D12_049.fcs .csv');
            case 10 %CHIR 2 pulses
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 pulse_A9_A09_010.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 2 pulse_B7_B07_020.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 2pulse_C5_C05_030.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 2pulse_D3_D03_040.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 2pulse_E1_E01_050.fcs .csv');
        end
    case 'Dataset B3'
        Days = 7;
        file = cell(1, Days);
        NameDays = {'Day 2', 'Day 2.5', 'Day 3', 'Day 3.5', 'Day 4', 'Day 4.5', 'Day 5'};
        pathInputfull = fullfile(pathInput,'Data_15_4_20');
        NamesData = {'CHIR 2-5 FOXC2'};
        NameData = NamesData{DataIdx};
        Proteins = {'FOXC2','SOX1','SOX2','TBX6','CDX2'};
        DataSetSave = 'DatasetB3';
        file{1} = fullfile(pathInputfull, 'NMP', 'D2_A1_A01_002.fcs .csv');
        file{2} = fullfile(pathInputfull,'FOXC2', 'D2.5_F1_F01_051.fcs .csv');
        file{3} = fullfile(pathInputfull,'FOXC2', 'D3_F2_F02_052.fcs .csv');
        file{4} = fullfile(pathInputfull,'FOXC2', 'D3.5_F3_F03_053.fcs .csv');
        file{5} = fullfile(pathInputfull,'FOXC2', 'D4_F4_F04_054.fcs .csv');
        file{6} = fullfile(pathInputfull,'FOXC2', 'D4.5_F5_F05_055.fcs .csv');
        file{7} = fullfile(pathInputfull,'FOXC2', 'D5_F6_F06_056.fcs .csv');
    case 'Dataset B2'
        Days = 7;
        file = cell(1, Days);
        NameDays = {'Day 2', 'Day 2.5', 'Day 3', 'Day 3.5', 'Day 4', 'Day 4.5', 'Day 5'};
        pathInputfull = fullfile(pathInput,'Data_15_4_20');
        NamesData = {'No CHIR', 'CHIR 2-2.5','CHIR 2-3', 'CHIR 2-5',...
            'CHIR 2-3 0.1','CHIR 2-3 0.3','CHIR 2-3 0.5','0.1 CHIR 2-5',...
            'CHIR 1 Pulse', 'CHIR 2 Pulses'};
        NameData = NamesData{DataIdx};
        Proteins = {'CDX2','SOX1','SOX2','OTX2'};
        DataSetSave = 'DatasetB2';
        file{1} = fullfile(pathInputfull, 'OTX2', 'D2_A1_A01_002.fcs .csv');
        switch DataIdx %contains code for the conditions
            case 1 %No CHIR
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5_A2_A02_003.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3_A5_A05_006.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5_A10_A10_011.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4_B8_B08_021.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5_C6_C06_031.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5_D4_D04_041.fcs .csv');
            case 2 %CHIR 2-2.5
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5 C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 C2-2.5_A8_A08_009.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 C2-2.5_B5_B05_018.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 C2-2.5_C3_C03_028.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 C2-2.5_D1_D01_038.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 C2-2.5_D11_D11_048.fcs .csv');
            case 3 %CHIR 2-3
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5 C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 C_A6_A06_007.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 C2-3_A12_A12_013.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 C2-3_B10_B10_023.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 C2-3_C8_C08_033.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 C2-3_D6_D06_043.fcs .csv');
            case 4 %CHIR 2-5
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5 C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 C_A6_A06_007.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 C_A11_A11_012.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 C_B9_B09_022.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 C_C7_C07_032.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 C_D5_D05_042.fcs .csv');
            case 5 %CHIR 2-3 0.1
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5 C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 C_A6_A06_007.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 C2-3 C0.1_B2_B02_015.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 C2-3 C0.1_B12_B12_025.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 C2-3 C0.1_C10_C10_035.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 C2-3 C0.1_D8_D08_045.fcs .csv');
            case 6 %CHIR 2-3 0.3
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5 C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 C_A6_A06_007.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 C2-3 C0.3_B3_B03_016.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 C2-3 C0.3_C1_C01_026.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 C2-3 C0.3_C11_C11_036.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 C2-3 C0.3_D9_D09_046.fcs .csv');
            case 7 %CHIR 2-3 0.5
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5 C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 C_A6_A06_007.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 C2-3 C0.5_B4_B04_017.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 C2-3 C0.5_C2_C02_027.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 C2-3 C0.5_C12_C12_037.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 C2-3 C0.5_D10_D10_047.fcs .csv');
            case 8 %0.1 CHIR 2-5
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5 C0.1_A4_A04_005.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 C0.1_A7_A07_008.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 C0.1_B1_B01_014.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 C0.1_B11_B11_024.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 C0.1_C9_C09_034.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 C0.1_D7_D07_044.fcs .csv');
            case 9 %CHIR 1 pulse
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5 C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 pulse_A9_A09_010.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 1pulse_B6_B06_019.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 1pulse_C4_C04_029.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 1pulse_D2_D02_039.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 1pulse_D12_D12_049.fcs .csv');
            case 10 %CHIR 2 pulses
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5 C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 pulse_A9_A09_010.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 2pulse_B7_B07_020.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 2pulse_C5_C05_030.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 2pulse_D3_D03_040.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 2pulse_E1_E01_050.fcs .csv');
                
        end
end


Data = cell(1,Days); %create cell and load the data (ignore first row:titles and first column:indices
for i = 1:Days
    Data{i} = csvread(file{i},1,1);
end
end