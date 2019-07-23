parpool ('local',30);
path = '/data1/zhangyue/data/fixed_rat_swc';
parfor j = 1 : 102000
    try
        ini_file = strcat('/data1/zhangyue/data/fixed_rat_swc/',num2str(j),'.swc');
        tree = load_tree(ini_file);
        dtree = delete_tree(tree,find(C_tree(tree)));
        rtree = repair_tree(dtree);
        swcfile = strcat('/data1/zhangyue/data/repaired_rat_swc/',num2str(j),'.swc');
        swc_tree(rtree,swcfile);
    end
    disp('thread');
end