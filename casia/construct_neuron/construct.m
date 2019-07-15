clear;
file1 = 'D:\treestoolbox\typical\0\100.swc';
tree1 = repair_tree(load_tree(file1));
B = B_tree (tree1);
Blist = find(B);
num = 1000;
for i = 1 : num
    try
        index = randi([1,size(Blist,1)],1,1); % 生成随机的branch节点
        [sub, subtree] = sub_tree (tree1, Blist(index));
        resttree = delete_tree (tree1, find(sub));
        index = randi([1,size(Blist,1)-1],1,1); % 剪第2个枝
        [sub, subtree] = sub_tree (tree1, Blist(index));
        resttree = delete_tree (resttree, find(sub));
        rtree = repair_tree(resample_tree (resttree, 1));
        jtree = jitter_tree(rtree,.1);
        file2 =  strcat('D:\treestoolbox\new_swc2\',num2str(0),'\',num2str(i),'.swc');
        swc_tree(jtree,file2);
        f = figure(i);
        plot_tree(jtree);
        set(f,'visible','off')
        file3 = strcat('D:\treestoolbox\new_tree2\',num2str(0),'\',num2str(i));
        %imwrite(f,file3);
        saveas(f,file3,'tif')
    end
end