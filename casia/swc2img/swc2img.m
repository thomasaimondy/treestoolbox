parpool('local',30);
path = strcat('/data1/zhangyue/data/original_rat_swc');
parfor j = 1 : (length(ls(path)) - 3)
    swcfile = strcat('/data1/zhangyue/data/original_rat_swc/',num2str(j),'.swc');
    try
        tree = load_tree(swcfile);
        rtree = resample_tree(repair_tree(tree),10);
        rtree.D(rtree.D > 5) = 5;
        rtree.D(rtree.D < 2) = 2;
        f = figure(j);
        plot_tree(rtree);
        %axis([-500 500 -500 500])
        axis off;
        set(f,'visible','off')
        imgfile = strcat('/data1/zhangyue/data/fixed_coordinate_rat_img/',num2str(j));
        saveas(f,imgfile,'png')
        clearvars -except path j;
        clf;clc;
    end
end
