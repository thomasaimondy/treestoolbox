id = [];
data = [];
try
    for i = 4006 : 4026
        swcfile = strcat('C:\Users\casia201\PycharmProjects\same_size\original_rat_swc\original_rat_swc\',num2str(i),'.swc');
        tree = load_tree(swcfile);
        stats = stats_tree(tree);
        id = [id;i];
        fileds = fieldnames(stats.gstats);
        feature = [];
        for j=1:length(fileds)
            k = fileds(j);
            key = k{1}; 
            value = stats.gstats.(key);
            feature = [feature value];
        end
        data = [data;feature];
    end
end
    [Idx,C,sumD,D] = kmeans(data,5,'dist','sqEuclidean','rep',4);
    display('Idx:')
    display(Idx);
    result = [id Idx];
    display('result:')
    display(result);