function [Data] = readData()
    X = readtable('Data/X.csv');
    y = readtable('Data/y.csv');
    time = readtable('Data/time.csv');

    Data = timetable(seconds(time.Var1), X.Var1, X.Var2, X.Var3, X.Var4, y.Var1, 'VariableNames', {'X1', 'X2', 'X3', 'X4', 'Y'});
end