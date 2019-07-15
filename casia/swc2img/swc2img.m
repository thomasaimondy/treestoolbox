for i = 0 : 4
    path = strcat('D:\treestoolbox\swc\',num2str(i));
    for j = 1 : (length(ls(path)) - 3)
        swcfile = strcat('D:\treestoolbox\swc\',num2str(i),'\',num2str(j),'.swc');
        try
            tree = load_tree(swcfile);
            f = figure(j);
            plot_tree(tree);
            set(f,'visible','off')
            imgfile = strcat('D:\treestoolbox\img2d\',num2str(i),'\',num2str(j));
            %imwrite(f,file3);
            saveas(f,imgfile,'tif')
        end
    end
end