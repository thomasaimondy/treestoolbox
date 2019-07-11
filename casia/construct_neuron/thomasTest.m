
start_trees;

%% loading the data
%tree = load_tree('block_27048.CNG.swc');
%tree = load_tree('HB140930-1-WNC10S10reg.CNG.swc');
tree = load_tree('NCB8R.CNG.swc');
%tree = load_tree('sample.mtr');

%% refine the data
tree = repair_tree(tree);

%% process the data
%sse = sse_tree(tree);
bo = BO_tree(tree);  % branch order
[bi, bins, bh] = bin_tree(tree,[],4); % bin sets
b = B_tree(tree)';    % branch points
asym = asym_tree(tree, T_tree(tree))'; % balanced or not
t = T_tree(tree); % get the terminal points
pl = PL_tree(tree); % the topological path length
lo = LO_tree(tree); % level order values
% adding more rules here !!!!!!!!



%% plot the data
clf;
%plot_tree(tree, diag(sse));
%plot_tree(tree,bo);
%plot_tree(tree,bi);
%plot_tree(tree,b);
%plot_tree(tree,asym);
plot_tree(tree,lo);
colorbar;


