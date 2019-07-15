for i = 0 : 4
    path = strcat('D:\treestoolbox\swc\',num2str(i));
    for j = 1 : (length(ls(path)) - 3)
        file1 = strcat('D:\treestoolbox\swc\',num2str(i),'\',num2str(j),'.swc');
        tree1 = load_tree(file1);
        file2 = strcat('D:\treestoolbox\swc\',num2str(i),'\',num2str(j+1),'.swc');
        tree2 = load_tree(file2);
        newtree = cat_tree(tree1,tree2);
        newfile =  strcat('D:\treestoolbox\new_swc\',num2str(i),'\',num2str(j),'.swc');
        swc_tree(newtree,newfile);
    end
end