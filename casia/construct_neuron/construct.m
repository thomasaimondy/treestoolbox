file1 = strcat('D:\treestoolbox\typical\0\154.swc');
tree1 = load_tree(file1);
tree1 = repair_tree(tree1);
num = 500;
for i = 1 : num
    length = size(tree1.X,1);
    k = 1 + round((i-1)/num*(length/2));%随机去掉i*个点
    E = round(length*rand(k,1));%生成的是一个i个元素的行向量，元素为1-100之间的数。去掉i个点，去掉点的编号范围为2~9212
    
    dtree = delete_tree (tree1, E);
    rtree = repair_tree(dtree);
    file2 =  strcat('D:\treestoolbox\new_swc2\',num2str(0),'\',num2str(i),'.swc');
    swc_tree(rtree,file2);
    f = figure(i);
    plot_tree(rtree);
    set(f,'visible','off')
    file3 = strcat('D:\treestoolbox\new_tree2\',num2str(0),'\',num2str(i));
    %imwrite(f,file3);
    saveas(f,file3,'tif')
end