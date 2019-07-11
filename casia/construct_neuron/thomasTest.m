
start_trees;
%tree = load_tree('block_27048.CNG.swc');
%tree = load_tree('HB140930-1-WNC10S10reg.CNG.swc');
tree = load_tree('NCB8R.CNG.swc');

%tree = load_tree('sample.mtr');
tree = repair_tree(tree);
%sse = sse_tree(tree);

botree = BO_tree(tree);
%clf;imagesc(sse);
%axis equal;

%plot_tree(1,BO_tree(temptree));
%x3d_tree(tree,[],[1,0,0],[],[],'-o ->');
%pov_tree(temptree,[],eucl_tree(temptree),'-b -s1 -w ->')

clf;
%plot_tree(tree, diag(sse));
plot_tree(tree,botree);
colorbar;
