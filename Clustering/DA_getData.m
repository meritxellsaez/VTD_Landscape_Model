function [Data, Proteins, NameData, NameDays, DataSetSave, SaveName]=DA_getData(Dataset, DataIdx, pathInput)
%Loads data from the folder in pathInput. Needs the coded name for the
%Dataset and DataIdx refers to the experimental conditions. It returns the
%Data in a cell with the different days, the names of the proteins, the
%name of the Data for titles and the names of the Days present in the data



%%get the correct paths for the datafiles and the details
switch Dataset %contains code for the Data
    case '18_08_14'
        Days = 7;
        file = cell(1, Days);
        NameDays = {'Day 2', 'Day 2.5', 'Day 3', 'Day 3.5', 'Day 4', 'Day 4.5', 'Day 5'};
        %pathInputfull = fullfile(pathInput,'Data_18_08_14/Samples');
        pathInputfull = fullfile(pathInput,'Data_18_08_14_clean');
        NamesData = {'No CHIR', 'CHIR 2-2.5','CHIR 2-3','CHIR 2-3.5', 'CHIR 2-4', 'CHIR 2-5',...
            'CHIR 2-5 FGF 2-3', 'CHIR 2-5 FGF 2-3.5', 'CHIR 2-5 FGF 2-4', 'CHIR 2-5 FGF 2-4.5', 'CHIR 2-5 FGF 2-5'};
        NameData = NamesData{DataIdx};
        Proteins = {'TBX6','BRA','CDX2','SOX2','SOX1'};
        DataSetSave = '180814';
        SaveName = {'NoC_180814', 'C225_180814', 'C23_180814', 'C235_180814', 'C24_180814', 'C25_180814',...
            'C25_F23_180814', 'C25_F235_180814', 'C25_F24_180814', 'C25_F245_180814', 'C25_F25_180814'};
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
        
    case '18_10_25'
        NumDays = [3,3,3,2,2,3,2,2,2];
        Days = NumDays(DataIdx);
        file = cell(1,Days);
        pathInputfull = fullfile(pathInput,'Data_18_10_25');
        file{1} = fullfile(pathInputfull, 'D3 WT C_E1_E01_148.fcs .csv'); %CHIR 2-*
        NamesData = {'CHIR 2-3','CHIR 2-4','CHIR 2-5', 'CHIR 2-3 PD 3-4', 'CHIR 2-3 RA 3-4', 'CHIR 2-4 RA 4-5',...
            'CHIR 2-3.5', 'CHIR 2-3.5 PD 3.5-4.5', 'CHIR 2-3.5 RA 3.5-4.5'};
        NameData = NamesData{DataIdx};
        Proteins = {'TBX6','BRA','CDX2','SOX2','SOX1'};
        DataSetSave = '181025';
        SaveName = {'C23_181025', 'C24_181025', 'C25_181025', 'C23_PD34_181025', 'C23_RA34_181025', 'C24_RA45_181025',...
            'C235_181025', 'C235_PD3545_181025','C235_RA3545_181025'};
        
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
        
    case '18_12_18_Nodal'
        file = cell(1,3);
        pathInputfull = fullfile(pathInput,'Data_18_12_18_Nodal/Samples');
        Days = 3;
        NamesData = {'CH 2-5','CH+Act 1/3 2-5','CH+Act 1/10 2-5', 'CH+SB 2-5', 'CH+Act 1/3 2-3', 'CH+Act 1/10 2-3'};
        NameData = NamesData{DataIdx};
        Proteins = {'TBX6','BRA','CDX2','SOX2','SOX1'};
        NameDays = {'Day 3', 'Day 4', 'Day 5'};
        DataSetSave = '181218_Nodal';
        SaveName = {'C25_181218_Nod', 'C25_Act03_181218_Nod', 'C25_Act01_25_181218_Nod', 'C25_SB_25_181218_Nod', 'C23_Act03_181218_Nod', 'C23_Act01_181218_Nod' };
        switch DataIdx
            case 1 %WT CHIR 2-5
                file{1} = fullfile(pathInputfull, 'WT', 'D3 WT C_A1_A01_002.fcs .csv');
                file{2} = fullfile(pathInputfull, 'WT', 'D4 WT C_B5_B05_018.fcs .csv');
                file{3} = fullfile(pathInputfull, 'WT', 'D5 WT C_D5_D05_042.fcs .csv');
            case 2 %WT CHIR + Act 1/3 2-5
                file{1} = fullfile(pathInputfull, 'WT', 'D3 WT C A_1-3_A3_A03_004.fcs .csv');
                file{2} = fullfile(pathInputfull, 'WT', 'D4 WT C A_1-3_B7_B07_020.fcs .csv');
                file{3} = fullfile(pathInputfull, 'WT', 'D5 WT C A_1-3_D7_D07_044.fcs .csv');
            case 3 %WT CHIR + Act 1/10 2-5
                file{1} = fullfile(pathInputfull, 'WT', 'D3 WT C A_1-10_A4_A04_005.fcs .csv');
                file{2} = fullfile(pathInputfull, 'WT', 'D4 WT C A_1-10_B8_B08_021.fcs .csv');
                file{3} = fullfile(pathInputfull, 'WT', 'D5 WT C A_1-10_D8_D08_045.fcs .csv');
            case 4 %WT CHIR + SB 2-5
                file{1} = fullfile(pathInputfull, 'WT', 'D3 WT C SB_A2_A02_003.fcs .csv');
                file{2} = fullfile(pathInputfull, 'WT', 'D4 WT C SB_B6_B06_019.fcs .csv');
                file{3} = fullfile(pathInputfull, 'WT', 'D5 WT C SB_D6_D06_043.fcs .csv');
            case 5 %WT CHIR + Act 1/3 2-3
                file{1} = fullfile(pathInputfull, 'WT', 'D3 WT C A_1-3_A3_A03_004.fcs .csv');
                file{2} = fullfile(pathInputfull, 'WT', 'D4 WT C2-3 A_1-3_B9_B09_022.fcs .csv');
                file{3} = fullfile(pathInputfull, 'WT', 'D5 WT C2-3 A_1-3_D9_D09_046.fcs .csv');
            case 6 %WT CHIR + Act 1/10 2-3
                file{1} = fullfile(pathInputfull, 'WT', 'D3 WT C A_1-10_A4_A04_005.fcs .csv');
                file{2} = fullfile(pathInputfull, 'WT', 'D4 WT C2-3 A_1-10_B10_023.fcs .csv');
                file{3} = fullfile(pathInputfull, 'WT', 'D5 WT C2-3 A_1-10_D10_D10_047.fcs .csv');
                
        end
    case '18_12_18_OTX2'
        file = cell(1,4);
        pathInputfull = fullfile(pathInput,'Data_18_12_18_OTX2/Samples');
        Days = 4;
        NamesData = {'No CHIR', 'PD No CHIR'};
        NameData = NamesData{DataIdx};
        Proteins = {'SOX2', 'OTX2', 'CDX2'};
        NameDays = {'Day 2', 'Day 2.5', 'Day 3', 'Day 3.5'};
        DataSetSave = '181218_OTX2';
        SaveName = {'NoC_181218_OTX2','NoCPD_181218_OTX2' };
        
        switch DataIdx
            case 1 %No CHIR
                file{1} = fullfile(pathInputfull, 'D2_A1_A01_002.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D2.5_A02_003.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D3_A3_A03_004.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D3.5_A4_A04_005.fcs .csv');
            case 2 %No CHIR PD
                file{1} = fullfile(pathInputfull, 'D2 PD_A7_A07_008.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D2.5 PD_A8_A08_009.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D3 PD_A9_A09_010.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D3.5 PD_A10_A10_011.fcs .csv');
        end
        
    case '18_11_27'
        pathInputfull = fullfile(pathInput,'Data_18_11_27/Samples');
        NumDays = [4,4,6];
        Days = NumDays(DataIdx);
        file = cell(1, Days);
        NamesData = {'CHIR 2-3.5', 'PD No CHIR 0-3.5','CHIR 2-4.5'};
        NameData = NamesData{DataIdx};
        Proteins = {'SOX2','BRA','SOX1','CDX2'};
        DataSetSave = '181127';
        SaveName = {'C235_181127', 'PD035_181127', 'C245_181127'};
        switch DataIdx %contains code for the conditions
            case 1 %CHIR 2-3.5
                file{1} = fullfile(pathInputfull, 'D2_C7_C07_012.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D2.5 C_C8_C08_013.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D3 C_C9_C09_014.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D3.5 C_C10_C10_015.fcs .csv');
                NameDays = {'Day 2', 'Day 2.5', 'Day 3', 'Day 3.5'};
            case 2 %PD No CHIR 0-3.5
                file{1} = fullfile(pathInputfull, 'D2 PD_A7_A07_008.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D2.5 PD_A8_A08_009.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D3 PD_A9_A09_010.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D3.5 PD_A10_A10_011.fcs .csv');
                NameDays = {'Day 2', 'Day 2.5', 'Day 3', 'Day 3.5'};
            case 3 %CHIR 2-4.5
                file{1} = fullfile(pathInputfull, 'D2_A1_A01_002.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D2.5 C_A2_A02_003.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D3 C_A3_A03_004.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D3.5 C_A4_A04_005.fcs .csv');
                file{5} = fullfile(pathInputfull, 'D4 C_A5_A05_006.fcs .csv');
                file{6} = fullfile(pathInputfull, 'D4.5 C_A6_A06_007.fcs .csv');
                NameDays = {'Day 2', 'Day 2.5', 'Day 3', 'Day 3.5', 'Day 4', 'Day 4.5'};
        end
    case '17_11_02'
        pathInputfull = fullfile(pathInput,'Data_17_11_02/Samples');
        NumDays = [3,3,3,3,3];
        Days = NumDays(DataIdx);
        file = cell(1, Days);
        NameDays = {'Day 3', 'Day 3.5', 'Day 4'};
        NamesData = {'No CHIR', 'CHIR 2-3', 'CHIR 2-4', 'CHIR 1/10 2-4', 'CHIR 1/3 2-4'};
        NameData = NamesData{DataIdx};
        Proteins = {'BRA','SOX1','SOX2', 'Oct-04', 'TBX6', 'CDX2'};
        DataSetSave = '171102';
        SaveName = {'NoC_171102', 'C23_171102', 'C24_171102', 'C24_0p1_171102', 'C24_0p3_171102'};
        switch DataIdx %contains code for the conditions
            case 1 %No CHIR
                file{1} = fullfile(pathInputfull, 'D3 WT_A1_A01_073.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D3.5 WT_A11_A11_083.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D4 WT_C12_C12_108.fcs .csv');
            case 2 %CHIR 2-3
                file{1} = fullfile(pathInputfull, 'D3 WT CHIR_A2_A02_074.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D3.5 WT CHIR 2-3_A12_A12_084.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D4 WT CHIR 2-3_D1_D01_109.fcs .csv');
            case 3 %CHIR 2-4
                file{1} = fullfile(pathInputfull, 'D3 WT CHIR_A2_A02_074.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D3.5 WT CHIR 1.1_B1_B01_085.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D4 WT CHIR 1.1_D2_D02_110.fcs .csv');
            case 4 %CHIR 1/10 2-4
                file{1} = fullfile(pathInputfull, 'D3 WT CHIR_A2_A02_074.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D3.5 WT CHIR 1.10_B3_B03_087.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D4 WT CHIR 1.10_D4_D04_112.fcs .csv');
            case 5 %CHIR 1/3 2-4
                file{1} = fullfile(pathInputfull, 'D3 WT CHIR_A2_A02_074.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D3.5 WT CHIR 1.3_B2_B02_086.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D4 WT CHIR 1.3_D3_D03_111.fcs .csv');
                
        end
    case '17_12_27'
        pathInputfull = fullfile(pathInput,'Data_17_12_27/samples/CLEAN');
        NumDays = [5,7,6];
        Days = NumDays(DataIdx);
        file = cell(1, Days);
        NamesData = {'CHIR 2-5', 'CHIR 2-5 FGF 2-4', 'CHIR 2-5 FGF 2-4.5'};
        NameData = NamesData{DataIdx};
        Proteins = {'TBX6','SOX2','CDX2','BRA'};
        DataSetSave = '171227';
        SaveName = {'C25_171227','C25_F24_171227','C25_F24p5_171227' };
        switch DataIdx %contains code for the conditions
            case 1 %CHIR 2-5
                file{1} = fullfile(pathInputfull, 'D2.5 WT CHIR 2-2.5_E10_E10_061.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D3 WT WNT FGF 2-3_A1_A01_004.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D4 WT CHIR 2-4_D11_D11_050.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D5 WT CHIR 2-5_E1_E01_052.fcs .csv');
                file{5} = fullfile(pathInputfull, 'D6 WT CHIR 2-6_E2_E02_053.fcs .csv');
                NameDays = {'Day 2.5', 'Day 3', 'Day 4', 'Day 5', 'Day 6'};
            case 2 %CHIR 2-5 FGF 2-4
                file{1} = fullfile(pathInputfull, 'D2.5 WT CHIR 2-2.5_E10_E10_061.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D3 WT WNT FGF 2-3_A1_A01_004.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D4 WT WNT FGF 2-4_A2_A02_005.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D4.5 WT WNT FGF 2-4_A3_A03_006.fcs .csv');
                file{5} = fullfile(pathInputfull, 'D5 WT WNT FGF 2-4_A4_A04_007.fcs .csv');
                file{6} = fullfile(pathInputfull, 'D5.5 WT WNT FGF 2-4_A5_A05_008.fcs .csv');
                file{7} = fullfile(pathInputfull, 'D6 WT WNT FGF 2-4_A6_A06_009.fcs .csv');
                NameDays = {'Day 2.5', 'Day 3', 'Day 4', 'Day 4.5', 'Day 5', 'Day 5.5','Day 6'};
            case 3 %CHIR 2-5 FGF 2-4.5
                file{1} = fullfile(pathInputfull, 'D2.5 WT CHIR 2-2.5_E10_E10_061.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D3 WT WNT FGF 2-3_A1_A01_004.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D4 WT WNT FGF 2-4_A2_A02_005.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D4.5 WT WNT FGF 2-4.5_A7_A07_010.fcs .csv');
                file{5} = fullfile(pathInputfull, 'D5.5 WT WNT FGF 2-4.5_A8_A08_011.fcs .csv');
                file{6} = fullfile(pathInputfull, 'D6 WT WNT FGF 2-4.5_A9_A09_012.fcs .csv');
                NameDays = {'Day 2.5', 'Day 3', 'Day 4', 'Day 4.5',  'Day 5.5','Day 6'};
        end
    case '12_5_20'
        Days = 7;
        file = cell(1, Days);
        NameDays = {'Day 2', 'Day 2.5', 'Day 3', 'Day 3.5', 'Day 4', 'Day 4.5', 'Day 5'};
        pathInputfull = fullfile(pathInput,'Data_12_5_20');
        NamesData = {'No CHIR', 'CHIR 2-2.5','CHIR 2-3', 'CHIR 2-5', 'CHIR 2-5 FOXC2',...
            'CHIR 2-2.5 CHIR 0.1 2.5-5','CHIR 2-2.5 CHIR 0.3 2.5-5','CHIR 2-2.5 CHIR 0.5 2.5-5',...
            'CHIR 2-3 0.1','CHIR 2-3 0.3','CHIR 2-3 0.5','0.1 CHIR 2-5',...
            'CHIR 1 Pulse', 'CHIR 2 Pulses',...
            'CHIR 2-2.1', 'CHIR 2-2.5 3-3.1','CHIR 2-2.5 3-3.5',  'CHIR 2-3 CHIR 4-5', 'CHIR 3-5', 'CHIR 4-5'};
        NameData = NamesData{DataIdx};
        Proteins = {'TBX6','BRA/FOX2','SOX1','SOX2','CDX2'};
        DataSetSave = '120520';
        SaveName = {};
        file{1} = fullfile(pathInputfull, 'NMP', 'D2_A1_A01_002.fcs .csv');
        switch DataIdx %contains code for the conditions
            case 1 %No CHIR
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5_A2_A02_003.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3_A3_A03_004.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5_A4_A04_005.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4_A5_A05_006.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5_A6_A06_007.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5_A7_A07_008.fcs .csv');
            case 2 %CHIR 2-2.5
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A8_A08_009.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C2-2.5_B6_B06_019.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C2-2.5_B7_B07_020.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C2-2.5_B8_B08_021.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C2-2.5_B9_B09_022.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C2-2.5_B10_B10_023.fcs .csv');
            case 3 %CHIR 2-3
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A8_A08_009.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C_A9_A09_010.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C2-3_B2_B02_015.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C2-3_B3_B03_016.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C2-3_B4_B04_017.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C2-3_B5_B05_018.fcs .csv');
            case 4 %CHIR 2-5
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A8_A08_009.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C_A9_A09_010.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C_A10_A10_011.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C_A11_A11_012.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C_A12_A12_013.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C_B1_B01_014.fcs .csv');
            case 5 %CHIR 2-5 FOX2
                file{2} = fullfile(pathInputfull,'FOXC2', 'D2.5 C FOXC2_H1_H01_087.fcs .csv');
                file{3} = fullfile(pathInputfull,'FOXC2', 'D3 C FOXC2_H2_H02_088.fcs .csv');
                file{4} = fullfile(pathInputfull,'FOXC2', 'D3.5 C FOXC2_H3_H03_089.fcs .csv');
                file{5} = fullfile(pathInputfull,'FOXC2', 'D4 C FOXC2_H4_H04_090.fcs .csv');
                file{6} = fullfile(pathInputfull,'FOXC2', 'D4.5 C FOXC2_H5_H05_091.fcs .csv');
                file{7} = fullfile(pathInputfull,'FOXC2', 'D5 C FOXC2_H6_H06_092.fcs .csv');
            case 6 %CHIR 2-2.5 CHIR 0.1 2.5-5
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A8_A08_009.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C2-2.5 C0.1_C4_C04_029.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C2-2.5 C0.1_C5_C05_030.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C2-2.5 C0.1_C6_C06_031.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C2-2.5 C0.1_C7_C07_032.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C2-2.5 C0.1_C8_C08_033.fcs .csv');
            case 7 %CHIR 2-2.5 CHIR 0.3 2.5-5
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A8_A08_009.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C2-2.5 C0.3_C9_C09_034.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C2-2.5 C0.3_C10_C10_035.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C2-2.5 C0.3_C11_C11_036.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C2-2.5 C0.3_C12_C12_037.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C2-2.5 C0.3_D1_D01_038.fcs .csv');
            case 8 %CHIR 2-2.5 CHIR 0.5 2.5-5
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A8_A08_009.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C2-2.5 C0.5_D2_D02_039.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C2-2.5 C0.5_D3_D03_040.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C2-2.5 C0.5_D4_D04_041.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C2-2.5 C0.5_D5_D05_042.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C2-2.5 C0.5_D6_D06_043.fcs .csv');
            case 9 %CHIR 2-3 0.1
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A8_A08_009.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C_A9_A09_010.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C2-3 C0.1_D7_D07_044.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C2-3 C0.1_D8_D08_045.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C2-3 C0.1_D9_D09_046.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C2-3 C0.1_D10_D10_047.fcs .csv');
            case 10 %CHIR 2-3 0.3
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A8_A08_009.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C_A9_A09_010.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C2-3 C0.3_D11_D11_048.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C2-3 C0.3_D12_D12_049.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C2-3 C0.3_E1_E01_050.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C2-3 C0.3_E2_E02_051.fcs .csv');
            case 11 %CHIR 2-3 0.5
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A8_A08_009.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C_A9_A09_010.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C2-3 C0.5_E3_E03_052.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C2-3 C0.5_E4_E04_053.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C2-3 C0.5_E5_E05_054.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C2-3 C0.5_E6_E06_055.fcs .csv');
            case 12 %0.1 CHIR 2-5
                file{2} = file{1};
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C0.1_B11_B11_024.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C0.1_B12_B12_025.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C0.1_C1_C01_026.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C0.1_C2_C02_027.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C0.1_C3_C03_028.fcs .csv');
            case 13 %CHIR 1 pulse
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A8_A08_009.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 1 pulse_E12_E12_061.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 1 pulse_F1_F01_062.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 1 pulse_F2_F02_063.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 1 pulse_F3_F03_064.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 1 pulse_F4_F04_065.fcs .csv');
            case 14 %CHIR 2 pulses
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A8_A08_009.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 1 pulse_E12_E12_061.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 2 pulse_F5_F05_066.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 2 pulse_F6_F06_067.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 2 pulse_F7_F07_068.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 2 pulse_F8_F08_069.fcs .csv');
            case 15 %CHIR 2-2.1
                file{2} = file{1};
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C2-2.1_E7_E07_056.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C2-2.1_E8_E08_057.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C2-2.1_E9_E09_058.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C2-2.1_E10_E10_059.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C2-2.1_E11_E11_060.fcs .csv');
            case 16 %CHIR 2-2.5 3-3.1
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A8_A08_009.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C2-2.5_B6_B06_019.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C2-2.5 3-3.1_F9_F09_070.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C2-2.5 3-3.1_F10_F10_071.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C2-2.5 C3-3.1_F11_F11_072.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C2-2.5 C3-3.1_F12_F12_073.fcs .csv');
            case 17 %CHIR 2-2.5 3-3.5
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A8_A08_009.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C2-2.5_B6_B06_019.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C2-2.5 C3-3.5_G1_G01_074.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C2-2.5 C3-3.5_G2_G02_075.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C2-2.5 C3-3.5_G3_G03_076.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C2-2.5 C3-3.5_G4_G04_077.fcs .csv');
            case 18 %CHIR 2-3 CHIR 4-5
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A8_A08_009.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C_A9_A09_010.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C2-3_B2_B02_015.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C2-3_B3_B03_016.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C2-3 C4_G11_G11_084.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C2-3 C4_G12_G12_085.fcs .csv');
            case 19 %CHIR 3-5
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5_A2_A02_003.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3_A3_A03_004.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C3_G5_G05_078.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C3_G6_G06_079.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C3_G7_G07_080.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C3_G8_G08_081.fcs .csv');
            case 20 %CHIR 4-5
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5_A2_A02_003.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3_A3_A03_004.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5_A4_A04_005.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4_A5_A05_006.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C4_G9_G09_082.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C4_G10_G10_083.fcs .csv');
        end
    case '12_5_20_OTX2'
        Days = 7;
        file = cell(1, Days);
        NameDays = {'Day 2', 'Day 2.5', 'Day 3', 'Day 3.5', 'Day 4', 'Day 4.5', 'Day 5'};
        pathInputfull = fullfile(pathInput,'Data_12_5_20');
        NamesData = {'No CHIR', 'CHIR 2-2.5', 'CHIR 2-3', 'CHIR 2-5',...
            'CHIR 2-2.5 CHIR 0.1 2.5-5','CHIR 2-2.5 CHIR 0.3 2.5-5','CHIR 2-2.5 CHIR 0.5 2.5-5',...
            'CHIR 2-3 0.1','CHIR 2-3 0.3','CHIR 2-3 0.5',...
            '0.1 CHIR 2-5', 'CHIR 1 Pulse', 'CHIR 2 Pulses',...
            'CHIR 2-2.1', 'CHIR 2-2.5 3-3.1', 'CHIR 2-2.5 3-3.5',  'CHIR 2-3 CHIR 4-5', 'CHIR 3-5', 'CHIR 4-5'};
        NameData = NamesData{DataIdx};
        Proteins = {'OTX2','CDX2', 'SOX1','SOX2'};
        DataSetSave = '060220OTX2';
        SaveName = {'NoCHIR', 'CHIR2to2p5','CHIR2to3', 'CHIR2to5',...
            'CHIR2to2p5 CHIR0p1_2p5to5','CHIR2to2p5_CHIR0p3_2p5to5','CHIR2to2p5_CHIR0p5_2p5to5',...
            'CHIR2to3_CHIR0p1_2to5','CHIR2to3_CHIR0p3_2to5','CHIR2to3_CHIR0p5_2to5',...
            '0p1CHIR2to5', 'CHIR_1Pulse', 'CHIR_2Pulses',...
            'CHIR2to2p1', 'CHIR2to2p5_3to3p1', 'CHIR2to2p5_CHIR3to3p5',  'CHIR2to3_CHIR4to5', 'CHIR3to5', 'CHIR4to5'};
        file{1} = fullfile(pathInputfull, 'OTX2', 'D2_A01_087.fcs .csv');
        switch DataIdx %contains code for the conditions
            case 1 %No CHIR
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5_A2_A02_088.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3_A3_A03_089.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5_A4_A04_090.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4_A5_A05_091.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5_A6_A06_092.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5_A7_A07_093.fcs .csv');
            case 2 %CHIR 2-2.5
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5 C_A8_A08_094.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 C2-2.5_B6_B06_104.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 C2-2.5_B7_B07_105.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 C2-2.5_B8_B08_106.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 C2-2.5_B9_B09_107.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 C2-2.5_B10_B10_108.fcs .csv');
            case 3 %CHIR 2-3
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5 C_A8_A08_094.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 C_A9_A09_095.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 C2-3_B2_B02_100.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 C2-3_B3_B03_101.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 C2-3_B4_B04_102.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 C2-3_B5_B05_103.fcs .csv');
            case 4 %CHIR 2-5
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5 C_A8_A08_094.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 C_A9_A09_095.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 C_A10_A10_096.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 C_A11_A11_097.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 C_A12_A12_098.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 C_B1_B01_099.fcs .csv');
            case 5 %CHIR 2-2.5 CHIR 0.1 2.5-5
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5 C_A8_A08_094.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 C2-2.5 C0.1_C4_C04_114.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 C2-2.5 C0.1_C5_C05_115.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 C2-2.5 C0.1_C6_C06_116.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 C2-2.5 C0.1_C7_C07_117.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 C2-2.5 C0.1_C8_C08_118.fcs .csv');
                
            case 6 %CHIR 2-2.5 CHIR 0.3 2.5-5
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5 C_A8_A08_094.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 C2-2.5 C0.3_C9_C09_119.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 C2-2.5 C0.3_C10_C10_120.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 C2-2.5 C0.3_C11_C11_121.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 C2-2.5 C0.3_C12_C12_122.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 C2-2.5 C0.3_D1_D01_123.fcs .csv');
            case 7 %CHIR 2-2.5 CHIR 0.5 2.5-5
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5 C_A8_A08_094.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 C2-2.5 C0.5_D2_D02_124.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 C2-2.5 C0.5_D3_D03_125.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 C2-2.5 C0.5_D4_D04_126.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 C2-2.5 C0.5_D5_D05_127.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 C2-2.5 C0.5_D6_D06_128.fcs .csv');
            case 8 %CHIR 2-3 0.1
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5 C_A8_A08_094.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 C_A9_A09_095.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 C2-3 C0.1_D7_D07_129.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 C2-3 C0.1_D8_D08_130.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 C2-3 C0.1_D9_D09_131.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 C2-3 C0.1_D10_D10_132.fcs .csv');
            case 9 %CHIR 2-3 0.3
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5 C_A8_A08_094.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 C_A9_A09_095.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 C2-3 C0.3_D11_D11_133.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 C2-3 C0.3_D12_D12_134.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 C2-3 C0.3_E1_E01_135.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 C2-3 C0.3_E2_E02_136.fcs .csv');
            case 10 %CHIR 2-3 0.5
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5 C_A8_A08_094.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 C_A9_A09_095.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 C2-3 C0.5_E3_E03_137.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 C2-3 C0.5_E4_E04_138.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 C2-3 C0.5_E5_E05_139.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 C2-3 C0.5_E6_E06_140.fcs .csv');
            case 11 %0.1 CHIR 2-5
                file{2} = file{1};
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 C0.1_B11_B11_109.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 C0.1_B12_B12_110.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 C0.1_C1_C01_111.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 C0.1_C2_C02_112.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 C0.1_C3_C03_113.fcs .csv');
            case 12 %CHIR 1 pulse
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5 C_A8_A08_094.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 1 pulse_E12_E12_146.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 1 pulse_002_F1_F01_147.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 1 pulse_002_F2_F02_148.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 1 pulse_002_F3_F03_149.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 1 pulse_002_F4_F04_150.fcs .csv');
            case 13 %CHIR 2 pulses
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5 C_A8_A08_094.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 1 pulse_E12_E12_146.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 2 pulse_002_F5_F05_151.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 2 pulse_002_F6_F06_152.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 2 pulse_F7_F07_153.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 2 pulse_F8_F08_154.fcs .csv');
            case 14 %CHIR 2-2.1
                file{2} = file{1};
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 C2-2.1_E7_E07_141.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 C2-2.1_E8_E08_142.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 C2-2.1_E9_E09_143.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 C2-2.1_E10_E10_144.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 C2-2.1_E11_E11_145.fcs .csv');
            case 15 %CHIR 2-2.5 3-3.1
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5 C_A8_A08_094.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 C2-2.5_B6_B06_104.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 C2-2.5 C3-3.1_F9_F09_155.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 C2-2.5 C3-3.1_F10_F10_156.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 C2-2.5 C3-3.1_F11_F11_157.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 C2-2.5 C3-3.1_F12_F12_158.fcs .csv');
            case 16 %CHIR 2-2.5 3-3.5
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5 C_A8_A08_094.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 C2-2.5_B6_B06_104.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 C2-2.5 C3-3.5_G1_G01_159.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 C2-2.5 C3-3.5_G2_G02_160.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 C2-2.5 C3-3.5_G3_G03_161.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 C2-2.5 C3-3.5_G4_G04_162.fcs .csv');
            case 17 %CHIR 2-3 CHIR 4-5
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5 C_A8_A08_094.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3 C_A9_A09_095.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 C2-3_B2_B02_100.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 C2-3_B3_B03_101.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 C2-3 C4-5_G11_G11_169.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 C2-3 C4-5_G12_G12_170.fcs .csv');
            case 18 %CHIR 3-5
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5_A2_A02_088.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3_A3_A03_089.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5 C3_G5_G05_163.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4 C3_G6_G06_164.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 C3_002_G7_G07_165.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 C3_G8_G08_166.fcs .csv');
            case 19 %CHIR 4-5
                file{2} = fullfile(pathInputfull,'OTX2', 'D2.5_A2_A02_088.fcs .csv');
                file{3} = fullfile(pathInputfull,'OTX2', 'D3_A3_A03_089.fcs .csv');
                file{4} = fullfile(pathInputfull,'OTX2', 'D3.5_A4_A04_090.fcs .csv');
                file{5} = fullfile(pathInputfull,'OTX2', 'D4_A5_A05_091.fcs .csv');
                file{6} = fullfile(pathInputfull,'OTX2', 'D4.5 C4_G9_G09_167.fcs .csv');
                file{7} = fullfile(pathInputfull,'OTX2', 'D5 C4_G10_G10_168.fcs .csv');
                
        end
    case '17_3_20'
        Days = 7;
        file = cell(1, Days);
        NameDays = {'Day 2', 'Day 2.5', 'Day 3', 'Day 3.5', 'Day 4', 'Day 4.5', 'Day 5'};
        pathInputfull = fullfile(pathInput,'Data_17_3_20');
        NamesData = {'No CHIR', 'CHIR 2-2.5','CHIR 2-3', 'CHIR 2-5','CHIR 2-5 FOXC2',...
            '0.1 CHIR 2-5','CHIR 2-3 0.1','CHIR 2-3 0.3','CHIR 2-3 0.5',...
            'CHIR 1 Pulse', 'CHIR 2 Pulses'};
        SaveName = {'NoCHIR', 'CHIR2to2p5','CHIR2to3', 'CHIR2to5','CHIR2to5FOXC2',...
            'CHIR2to3then0p1CH','CHIR2to3then0p3CH','CHIR2to3then0p5','0p1CHIR2to5',...
            'CHIR_1_Pulse', 'CHIR_2_Pulses'};
        NameData = NamesData{DataIdx};
        Proteins = {'BRA/FOX2','SOX1','SOX2','TBX6','CDX2'};
        DataSetSave = '170320';
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
            case 5 %CHIR 2-5 FOXC2
                file{2} = fullfile(pathInputfull,'FOXC2', 'D2.5_F1_F01_051.fcs .csv');
                file{3} = fullfile(pathInputfull,'FOXC2', 'D3_F2_F02_052.fcs .csv');
                file{4} = fullfile(pathInputfull,'FOXC2', 'D3.5_F3_F03_053.fcs .csv');
                file{5} = fullfile(pathInputfull,'FOXC2', 'D4_F4_F04_054.fcs .csv');
                file{6} = fullfile(pathInputfull,'FOXC2', 'D4.5_F5_F05_055.fcs .csv');
                file{7} = fullfile(pathInputfull,'FOXC2', 'D5_F6_F06_056.fcs .csv');
            case 6 %CHIR 2-3 0.1
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C_A6_A06_007.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C2-3 C0.1_B2_B02_015.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C2-3 C0.1_B12_B12_025.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C2-3 C0.1_C10_C10_035.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C2-3 C0.1_D8_D08_045.fcs .csv');
            case 7 %CHIR 2-3 0.3
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C_A6_A06_007.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C2-3 C0.3_B3_B03_016.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C2-3 C0.3_C1_C01_026.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C0.3_C11_C11_036.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C2-3 C0.3_D9_D09_046.fcs .csv');
            case 8 %CHIR 2-3 0.5
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C_A6_A06_007.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C2-3 C0.5_B4_B04_017.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C2-3 C0.5_C2_C02_027.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C2-3 C0.5_C12_C12_037.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C2-3 C0.5_D10_D10_047.fcs .csv');
            case 9 %0.1 CHIR 2-5
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C0.1_A4_A04_005.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 C0.1_A7_A07_008.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 C0.1_B1_B01_014.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 C0.1_B11_B11_024.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 C0.1_C9_C09_034.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 C0.1_D7_D07_044.fcs .csv');
            case 10 %CHIR 1 pulse
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 pulse_A9_A09_010.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 1pulse_B6_B06_019.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 1pulse_C4_C04_029.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 1pulse_D2_D02_039.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 1pulse_D12_D12_049.fcs .csv');
            case 11 %CHIR 2 pulses
                file{2} = fullfile(pathInputfull,'NMP', 'D2.5 C_A3_A03_004.fcs .csv');
                file{3} = fullfile(pathInputfull,'NMP', 'D3 pulse_A9_A09_010.fcs .csv');
                file{4} = fullfile(pathInputfull,'NMP', 'D3.5 2 pulse_B7_B07_020.fcs .csv');
                file{5} = fullfile(pathInputfull,'NMP', 'D4 2pulse_C5_C05_030.fcs .csv');
                file{6} = fullfile(pathInputfull,'NMP', 'D4.5 2pulse_D3_D03_040.fcs .csv');
                file{7} = fullfile(pathInputfull,'NMP', 'D5 2pulse_E1_E01_050.fcs .csv');
                
        end
    case '17_3_20_OTX2'
        Days = 7;
        file = cell(1, Days);
        NameDays = {'Day 2', 'Day 2.5', 'Day 3', 'Day 3.5', 'Day 4', 'Day 4.5', 'Day 5'};
        pathInputfull = fullfile(pathInput,'Data_17_3_20');
        NamesData = {'No CHIR', 'CHIR 2-2.5','CHIR 2-3', 'CHIR 2-5',...
            'CHIR 2-3 0.1','CHIR 2-3 0.3','CHIR 2-3 0.5','0.1 CHIR 2-5', ...
            'CHIR 1 Pulse', 'CHIR 2 Pulses'};
        SaveName = {'NoCHIR', 'CHIR2to2p5','CHIR2to3', 'CHIR2to5',...
            'CHIR2to3then0p1CH','CHIR2to3then0p3CH','CHIR2to3then0p5','0p1CHIR2to5',...
            'CHIR_1_Pulse', 'CHIR_2_Pulses'};
        NameData = NamesData{DataIdx};
        Proteins = {'CDX2','SOX1','SOX2','OTX2'};
        DataSetSave = '170320OTX2';
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
    case '15_4_20'
        Days = 7;
        file = cell(1, Days);
        NameDays = {'Day 2', 'Day 2.5', 'Day 3', 'Day 3.5', 'Day 4', 'Day 4.5', 'Day 5'};
        pathInputfull = fullfile(pathInput,'Data_15_4_20');
        NamesData = {'No CHIR', 'CHIR 2-2.5','CHIR 2-3', 'CHIR 2-5',...%'CHIR 2-5 FOX2',...
            'CHIR 2-3 0.1','CHIR 2-3 0.3','CHIR 2-3 0.5','0.1 CHIR 2-5',...
            'CHIR 1 Pulse', 'CHIR 2 Pulses'};
        SaveName = {'NoCHIR', 'CHIR2to2p5','CHIR2to3', 'CHIR2to5',...%'CHIR2to5FOX2',...
            'CHIR2to3then0p1CH','CHIR2to3then0p3CH','CHIR2to3then0p5','0p1CHIR2to5',...
            'CHIR_1_Pulse', 'CHIR_2_Pulses'};
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
    case '15_4_20_FOXC2'
        Days = 7;
        file = cell(1, Days);
        NameDays = {'Day 2', 'Day 2.5', 'Day 3', 'Day 3.5', 'Day 4', 'Day 4.5', 'Day 5'};
        pathInputfull = fullfile(pathInput,'Data_15_4_20');
        NamesData = {'CHIR 2-5 FOXC2'};
        SaveName = {'CHIR2to5FOXC2'};
        NameData = NamesData{DataIdx};
        Proteins = {'FOXC2','SOX1','SOX2','TBX6','CDX2'};
        DataSetSave = '150420FOXC2';
        file{1} = fullfile(pathInputfull, 'NMP', 'D2_A1_A01_002.fcs .csv');
        file{2} = fullfile(pathInputfull,'FOXC2', 'D2.5_F1_F01_051.fcs .csv');
        file{3} = fullfile(pathInputfull,'FOXC2', 'D3_F2_F02_052.fcs .csv');
        file{4} = fullfile(pathInputfull,'FOXC2', 'D3.5_F3_F03_053.fcs .csv');
        file{5} = fullfile(pathInputfull,'FOXC2', 'D4_F4_F04_054.fcs .csv');
        file{6} = fullfile(pathInputfull,'FOXC2', 'D4.5_F5_F05_055.fcs .csv');
        file{7} = fullfile(pathInputfull,'FOXC2', 'D5_F6_F06_056.fcs .csv');
    case '15_4_20_OTX2'
        Days = 7;
        file = cell(1, Days);
        NameDays = {'Day 2', 'Day 2.5', 'Day 3', 'Day 3.5', 'Day 4', 'Day 4.5', 'Day 5'};
        pathInputfull = fullfile(pathInput,'Data_15_4_20');
        NamesData = {'No CHIR', 'CHIR 2-2.5','CHIR 2-3', 'CHIR 2-5',...
            'CHIR 2-3 0.1','CHIR 2-3 0.3','CHIR 2-3 0.5','0.1 CHIR 2-5',...
            'CHIR 1 Pulse', 'CHIR 2 Pulses'};
        SaveName = {'NoCHIR', 'CHIR2to2p5','CHIR2to3', 'CHIR2to5',...
            'CHIR2to3then0p1CH','CHIR2to3then0p3CH','CHIR2to3then0p5','0p1CHIR2to5',...
            'CHIR_1_Pulse', 'CHIR_2_Pulses'};
        NameData = NamesData{DataIdx};
        Proteins = {'CDX2','SOX1','SOX2','OTX2'};
        DataSetSave = '150420OTX2';
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
    case '27_11_18'
        NumDays = [4,4,6];
        Days = NumDays(DataIdx);
        file = cell(1, Days);
        NameDays = {'Day 2', 'Day 2.5', 'Day 3', 'Day 3.5', 'Day 4', 'Day 4.5'};
        pathInputfull = fullfile(pathInput,'Data_27_11_18');
        NamesData = {'CHIR', 'PD CHIR','CHIR'};
        SaveName = {'NoCHIR', '',''};
        NameData = NamesData{DataIdx};
        Proteins = {'SOX2','BRA','OTX2','SOX1','CDX2'};
        DataSetSave = '271118';
        switch DataIdx %contains code for the conditions
            case 1 %No CHIR
                file{1} = fullfile(pathInputfull, 'D2_C7_C07_012.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D2.5 C_C8_C08_013.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D3 C_C9_C09_014.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D3.5 C_C10_C10_015.fcs .csv');
            case 2 %No CHIR
                file{1} = fullfile(pathInputfull, 'D2 PD_A7_A07_008.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D2.5 PD_A8_A08_009.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D3 PD_A9_A09_010.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D3.5 PD_A10_A10_011.fcs .csv');
            case 3 %No CHIR
                file{1} = fullfile(pathInputfull, 'D2_A1_A01_002.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D2.5 C_A2_A02_003.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D3 C_A3_A03_004.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D3.5 C_A4_A04_005.fcs .csv');
                file{5} = fullfile(pathInputfull, 'D4 C_A5_A05_006.fcs .csv');
                file{6} = fullfile(pathInputfull, 'D4.5 C_A6_A06_007.fcs .csv');
        end
    case '15_12_18'
        Days = 4;
        file = cell(1, Days);
        NameDays = {'Day 2', 'Day 2.5', 'Day 3', 'Day 3.5'};
        pathInputfull = fullfile(pathInput,'Data_15_12_18');
        NamesData = {'CHIR', 'PD CHIR'};
        SaveName = {'NoCHIR', 'NoCHIR_PD'};
        NameData = NamesData{DataIdx};
        Proteins = {'SOX2','OTX2','CDX2'};
        DataSetSave = '151218';
        switch DataIdx %contains code for the conditions
            case 1 %No CHIR
                file{1} = fullfile(pathInputfull, 'D2_A1_A01_002.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D2.5_A02_003.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D3_A3_A03_004.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D3.5_A4_A04_005.fcs .csv');
            case 2 %No CHIR PD
                file{1} = fullfile(pathInputfull, 'D2 PD_A7_A07_008.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D2.5 PD_A8_A08_009.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D3 PD_A9_A09_010.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D3.5 PD_A10_A10_011.fcs .csv');
        end
    case '20_08_20_TBX6'
        Days = 4;
        file = cell(1, Days);
        NameDays = {'Day 3', 'Day 4', 'Day 5', 'Day 6'};
        pathInputfull = fullfile(pathInput,'Data_20_08_20', 'TBX6');
        NamesData = {'No CHIR', 'CHIR 2-3','CHIR 2-6',...
            'No Chir PD 3-6', 'CHIR 4-6', 'PD 3-4 CHIR 4-5', 'PD 3-4 CHIR 4-6'};
        NameData = NamesData{DataIdx};
        Proteins = {'TBX6','SOX1', 'SOX2', 'CDX2_CRE', 'CDX2'};
        DataSetSave = '20820TBX6';
        SaveName = {'NC_20820TBX6', 'C23_20820TBX6','C26_20820TBX6',...
            'NCPD36_20820TBX6', 'C46_20820TBX6', 'PD34C45_20820TBX6', 'PD34C46_20820TBX6'};
        %file{1} = fullfile(pathInputfull, 'D2_A1_A01_002.fcs .csv');
        switch DataIdx %contains code for the conditions
            case 1 %No CHIR
                file{1} = fullfile(pathInputfull, 'D3_C1_C01_021.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D4_C3_C03_023.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_C7_C07_027.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_D1_D01_033.fcs .csv');
            case 2 %CHIR 2-3
                file{1} = fullfile(pathInputfull, 'D3_C_C2_C02_022.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D4_C_2-3_C4_C04_024.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_C2-3_C8_C08_028.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_C2-3_D2_D02_034.fcs .csv');
            case 3 %CHIR 2-6
                file{1} = fullfile(pathInputfull, 'D3_C_C2_C02_022.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D4_C_C5_C05_025.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_C_C9_C09_029.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_C_D3_D03_035.fcs .csv');
            case 4 %No Chir PD 3-6
                file{1} = fullfile(pathInputfull, 'D3_C1_C01_021.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D4_PD_C6_C06_026.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_PD_C10_C10_030.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_PD_D4_D04_036.fcs .csv');
            case 5 %CHIR 4-6
                file{1} = fullfile(pathInputfull, 'D3_C1_C01_021.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D4_C3_C03_023.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_C4-5_C12_C12_032.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_C4-6_D7_D07_039.fcs .csv');
            case 6 %PD 3-4 CHIR 4-5
                file{1} = fullfile(pathInputfull, 'D3_C1_C01_021.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D4_PD_C6_C06_026.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_PD_C4-5_C11_C11_031.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_PD_C4-5_D6_D06_038.fcs .csv');
            case 7 %PD 3-4 CHIR 4-6
                file{1} = fullfile(pathInputfull, 'D3_C1_C01_021.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D4_PD_C6_C06_026.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_PD_C4-5_C11_C11_031.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_PD_C4-6_D5_D05_037.fcs .csv');
        end
    case '20_08_20_BRA'
        Days = 4;
        file = cell(1, Days);
        NameDays = {'Day 3', 'Day 4', 'Day 5', 'Day 6'};
        pathInputfull = fullfile(pathInput,'Data_20_08_20', 'BRA');
        NamesData = {'No CHIR', 'CHIR 2-3','CHIR 2-6',...
            'No Chir PD 3-6', 'CHIR 4-6', 'PD 3-4 CHIR 4-5', 'PD 3-4 CHIR 4-6'};
        NameData = NamesData{DataIdx};
        Proteins = {'BRA','SOX1', 'SOX2', 'CDX2_CRE', 'CDX2'};
        DataSetSave = '20820BRA';
        SaveName = {'NC_20820BRA', 'C23_20820BRA','C26_20820BRA',...
            'NCPD36_20820BRA', 'C46_20820BRA', 'PD34C45_20820BRA', 'PD34C46_20820BRA'};
        %file{1} = fullfile(pathInputfull, 'D2_A1_A01_002.fcs .csv');
        switch DataIdx %contains code for the conditions
            case 1 %No CHIR
                file{1} = fullfile(pathInputfull, 'D3_C1_C01_021.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D4_C3_C03_023.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_C7_C07_027.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_D1_D01_033.fcs .csv');
            case 2 %CHIR 2-3
                file{1} = fullfile(pathInputfull, 'D3_C_C2_C02_022.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D4_C_2-3_C4_C04_024.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_C2-3_C8_C08_028.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_C2-3_D2_D02_034.fcs .csv');
            case 3 %CHIR 2-6
                file{1} = fullfile(pathInputfull, 'D3_C_C2_C02_022.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D4_C_C5_C05_025.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_C_C9_C09_029.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_C_D3_D03_035.fcs .csv');
            case 4 %No Chir PD 3-6
                file{1} = fullfile(pathInputfull, 'D3_C1_C01_021.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D4_PD_C6_C06_026.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_PD_C10_C10_030.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_PD_D4_D04_036.fcs .csv');
            case 5 %CHIR 4-6
                file{1} = fullfile(pathInputfull, 'D3_C1_C01_021.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D4_C3_C03_023.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_C4-5_C12_C12_032.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_C4-6_D7_D07_039.fcs .csv');
            case 6 %PD 3-4 CHIR 4-5
                file{1} = fullfile(pathInputfull, 'D3_C1_C01_021.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D4_PD_C6_C06_026.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_PD_C4-5_C11_C11_031.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_PD_C4-5_D6_D06_038.fcs .csv');
            case 7 %PD 3-4 CHIR 4-6
                file{1} = fullfile(pathInputfull, 'D3_C1_C01_021.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D4_PD_C6_C06_026.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_PD_C4-5_C11_C11_031.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_PD_C4-6_D5_D05_037.fcs .csv');
        end
    case '20_08_20_Otx2'
        Days = 4;
        file = cell(1, Days);
        NameDays = {'Day 3', 'Day 4', 'Day 5', 'Day 6'};
        pathInputfull = fullfile(pathInput,'Data_20_08_20', 'Otx2');
        NamesData = {'No CHIR', 'CHIR 2-3','CHIR 2-6',...
            'No Chir PD 3-6', 'CHIR 4-6', 'PD 3-4 CHIR 4-5', 'PD 3-4 CHIR 4-6'};
        NameData = NamesData{DataIdx};
        Proteins = {'Otx2','SOX1', 'SOX2', 'CDX2_CRE', 'CDX2'};
        DataSetSave = '20820Otx2';
        SaveName = {'NC_20820Otx2', 'C23_20820Otx2','C26_20820Otx2',...
            'NCPD36_20820Otx2', 'C46_20820Otx2', 'PD34C45_20820Otx2', 'PD34C46_20820Otx2'};
        %file{1} = fullfile(pathInputfull, 'D3_C_D2_D02_050.fcs .csv');
        switch DataIdx %contains code for the conditions
            case 1 %No CHIR
                file{1} = fullfile(pathInputfull, 'D3_A1_A01_086.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D4_A3_A03_088.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_A7_A07_092.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_B1_B01_098.fcs .csv');
            case 2 %CHIR 2-3
                file{1} = fullfile(pathInputfull, 'D3_C_A2_A02_087.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D4_C2-3_A4_A04_089.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_C2-3_A8_A08_093.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_C2-3_B2_B02_099.fcs .csv');
            case 3 %CHIR 2-6
                file{1} = fullfile(pathInputfull, 'D3_C_A2_A02_087.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D4_C_A5_A05_090.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_C_A9_A09_094.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_C_B3_B03_100.fcs .csv');
            case 4 %No Chir PD 3-6
                file{1} = fullfile(pathInputfull, 'D3_A1_A01_086.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D4_PD_A6_A06_091.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_PD_3-4_A10_A10_095.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_PD_B4_B04_101.fcs .csv');
            case 5 %CHIR 4-6
                file{1} = fullfile(pathInputfull, 'D3_A1_A01_086.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D4_A3_A03_088.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_C4-5_A12_A12_097.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_C4-6_B7_B07_104.fcs .csv');
            case 6 %PD 3-4 CHIR 4-5
                file{1} = fullfile(pathInputfull, 'D3_A1_A01_086.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D4_PD_A6_A06_091.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_PD_C4-5_A11_A11_096.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_PD_C4-5_B6_B06_103.fcs .csv');
            case 7 %PD 3-4 CHIR 4-6
                file{1} = fullfile(pathInputfull, 'D3_A1_A01_086.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D4_PD_A6_A06_091.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_PD_C4-5_A11_A11_096.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_PD_C4-6_B5_B05_102.fcs .csv');
        end
    case '20_08_20_FoxC2'
        Days = 4;
        file = cell(1, Days);
        NameDays = {'Day 3', 'Day 4', 'Day 5', 'Day 6'};
        pathInputfull = fullfile(pathInput,'Data_20_08_20', 'FoxC2');
        NamesData = {'No CHIR', 'CHIR 2-3','CHIR 2-6',...
            'No Chir PD 3-6', 'CHIR 4-6', 'PD 3-4 CHIR 4-5', 'PD 3-4 CHIR 4-6'};
        NameData = NamesData{DataIdx};
        Proteins = {'FoxC2','SOX1', 'SOX2', 'CDX2_CRE', 'CDX2'};
        DataSetSave = '20820FoxC2';
        SaveName = {'NC_20820FoxC2', 'C23_20820FoxC2','C26_20820FoxC2',...
            'NCPD36_20820FoxC2', 'C46_20820FoxC2', 'PD34C45_20820FoxC2', 'PD34C46_20820FoxC2'};
        %file{1} = fullfile(pathInputfull, 'D2_A1_A01_002.fcs .csv');
        switch DataIdx %contains code for the conditions
            case 1 %No CHIR
                file{1} = fullfile(pathInputfull, 'D3_C_D2_D02_050.fcs .csv');%%%
                file{2} = fullfile(pathInputfull, 'D4_D3_D03_051.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_D7_D07_055.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_E1_E01_061.fcs .csv');
            case 2 %CHIR 2-3
                file{1} = fullfile(pathInputfull, 'D3_C_D2_D02_050.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D4_C2-3_D4_D04_052.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_C2-3_D8_D08_056.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_C2-3_E2_E02_062.fcs .csv');
            case 3 %CHIR 2-6
                file{1} = fullfile(pathInputfull, 'D3_C_D2_D02_050.fcs .csv');
                file{2} = fullfile(pathInputfull, 'D4_C_D5_D05_053.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_C_D9_D09_057.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_C_E3_E03_063.fcs .csv');
            case 4 %No Chir PD 3-6
                file{1} = fullfile(pathInputfull, 'D3_C_D2_D02_050.fcs .csv');%%%
                file{2} = fullfile(pathInputfull, 'D4_PD_D6_D06_054.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_PD_D10_D10_058.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_PD_E4_E04_064.fcs .csv');
            case 5 %CHIR 4-6
                file{1} = fullfile(pathInputfull, 'D3_C_D2_D02_050.fcs .csv');%%%
                file{2} = fullfile(pathInputfull, 'D4_D3_D03_051.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_C4-5_D12_D12_060.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_C4-6_E7_E07_067.fcs .csv');
            case 6 %PD 3-4 CHIR 4-5
                file{1} = fullfile(pathInputfull, 'D3_C_D2_D02_050.fcs .csv');%%%
                file{2} = fullfile(pathInputfull, 'D4_PD_D6_D06_054.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_PD_C4-5_D11_D11_059.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_PD_C4-5_E6_E06_066.fcs .csv');
            case 7 %PD 3-4 CHIR 4-6
                file{1} = fullfile(pathInputfull, 'D3_C_D2_D02_050.fcs .csv');%%%
                file{2} = fullfile(pathInputfull, 'D4_PD_D6_D06_054.fcs .csv');
                file{3} = fullfile(pathInputfull, 'D5_PD_C4-5_D11_D11_059.fcs .csv');
                file{4} = fullfile(pathInputfull, 'D6_PD_C4-6_E5_E05_065.fcs .csv');
        end
end


Data = cell(1,Days); %create cell and load the data (ignore first row:titles and first column:indices
for i = 1:Days
    Data{i} = csvread(file{i},1,1);
end
end