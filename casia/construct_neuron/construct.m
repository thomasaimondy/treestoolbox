clear;
ini_file = 'D:\treestoolbox\typical\0\100.swc';
ini_tree = repair_tree(load_tree(ini_file));
B = B_tree (ini_tree);
Blist = find(B);
num = 1000;
for i = 1 : num
    try
        index = randi([1,size(Blist,1)],1,1); % 生成随机的branch节点
        [sub, subtree] = sub_tree (ini_tree, Blist(index));
        resttree = delete_tree (ini_tree, find(sub));
        index = randi([1,size(Blist,1)-1],1,1); % 剪第2个枝
        [sub, subtree] = sub_tree (resttree, Blist(index));
        resttree = delete_tree (resttree, find(sub));
        rtree = repair_tree(resample_tree (resttree, 1));
        jtree = jitter_tree(rtree,.1);
        swcfile =  strcat('D:\treestoolbox\new_swc2\',num2str(0),'\',num2str(i),'.swc');
        swc_tree(jtree,swcfile);
        f = figure(i);
        plot_tree(jtree);
        set(f,'visible','off')
        imgfile = strcat('D:\treestoolbox\new_tree2\',num2str(0),'\',num2str(i));
        %imwrite(f,file3);
        saveas(f,imgfile,'tif')
    end
end