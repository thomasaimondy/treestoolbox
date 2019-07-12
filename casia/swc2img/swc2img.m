for i = 0 : 4
    file1 = strcat('D:\treestoolbox\swc\',num2str(i));
    for j = 1 : (length(ls(file1)) - 3)
        file2 = strcat('D:\treestoolbox\swc\',num2str(i),'\',num2str(j),'.swc');
        try
            tree1 = load_tree(file2);
            f = figure(j);
            plot_tree(tree1);
            set(f,'visible','off')
            file3 = strcat('D:\treestoolbox\img2d\',num2str(i),'\',num2str(j));
            %imwrite(f,file3);
            saveas(f,file3,'tif')
        end
    end
end