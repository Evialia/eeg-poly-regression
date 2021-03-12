% Randomly split the exported data rows into training and testing set with 80:20 ratio 
% accordingly.

function [trainingSet, testingSet] = splitDataSet(Data)
    % [trainIndx, ~, testIndx] = dividerand(201,0.8,0,0.2);
    % The below values were generated from the above function and
    % are statically stored to prevent value changes on each run of the project  
    testIndx = [1;10;20;22;24;35;44;47;48;50;52;66;72;73;74;85;94;97;101;111;113;118;119;123;131;136;141;144;149;150;153;154;155;162;166;180;185;189;191;200];
    trainIndx = [2;3;4;5;6;7;8;9;11;12;13;14;15;16;17;18;19;21;23;25;26;27;28;29;30;31;32;33;34;36;37;38;39;40;41;42;43;45;46;49;51;53;54;55;56;57;58;59;60;61;62;63;64;65;67;68;69;70;71;75;76;77;78;79;80;81;82;83;84;86;87;88;89;90;91;92;93;95;96;98;99;100;102;103;104;105;106;107;108;109;110;112;114;115;116;117;120;121;122;124;125;126;127;128;129;130;132;133;134;135;137;138;139;140;142;143;145;146;147;148;151;152;156;157;158;159;160;161;163;164;165;167;168;169;170;171;172;173;174;175;176;177;178;179;181;182;183;184;186;187;188;190;192;193;194;195;196;197;198;199;201];    Data = timetable2table(Data);
    
    trainingSet = Data(trainIndx', 2:end);
    testingSet = Data(testIndx', 2:end);
    end