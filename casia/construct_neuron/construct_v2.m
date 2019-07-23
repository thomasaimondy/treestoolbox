clear;
parpool('local',30);
parfor j = 81 : 102000
    try
        ini_file = strcat('/data1/zhangyue/data/two_classified_original_rat_swc/original_rat_swc/0/',num2str(j),'.swc');
        ini_tree = repair_tree(load_tree(ini_file));
        B = B_tree (ini_tree);
        Blist = find(B);
        num = 4;
        for i = 2 : num
            try
                index = randi([10,size(Blist,1)-2],1,1); 
                [sub, subtree] = sub_tree (ini_tree, Blist(index));
                resttree = delete_tree (ini_tree, find(sub));
                index = randi([10,size(Blist,1)-2],1,1); 
                [sub, subtree] = sub_tree (resttree, Blist(index));
                resttree = delete_tree (resttree, find(sub));
                rtree = repair_tree(resttree);
                jtree = jitter_tree(rtree,.1);
                jtree.D(jtree.D > 5) = 5;
                jtree.D(jtree.D < 2) = 2;
                swcfile =  strcat('/data1/zhangyue/data/same_size_swc/',num2str(0),'/',num2str(j),'(',num2str(i),')','.swc');
                swc_tree(jtree,swcfile);
                f = figure(j*4+i);
                HP = plot_tree(jtree);
                %set(f,{'axis:','off'})
                axis off;
                set(f,'visible','off');
                imgfile = strcat('/data1/zhangyue/data/same_size_img/',num2str(0),'/',num2str(j),'(',num2str(i),')');
                %imwrite(f,file3);
                saveas(f,imgfile,'png')
                clearvars -except path j;
                
            end
        end
    end
end       