
start_trees;

%% loading the data
%tree = load_tree('block_27048.CNG.swc');
%tree = load_tree('HB140930-1-WNC10S10reg.CNG.swc');
tree = load_tree('NCB8R.CNG.swc');
%tree = load_tree('sample.mtr');

%% refine the data
tree = repair_tree(tree);

%% process the data
% sse = sse_tree(tree); % sse
bo = BO_tree(tree);  % branch order
[bi, bins, bh] = bin_tree(tree,[],4); % bin sets
b = B_tree(tree);    % branch points
t = T_tree(tree); % get the terminal points
c = C_tree(tree); %get the continuation points
asym = asym_tree(tree, T_tree(tree))'; % balanced or not
pl = PL_tree(tree); % the topological path length
lo = LO_tree(tree); % level order values
ipar = ipar_tree(tree); % path to root, parent indices, matrix
% adding more rules here!!!!!!!!!
sub = sub_tree(tree);
typeN = typeN_tree(tree);%type of node,0=T,1=C,2=B;

%% plot the data
clf;
%plot_tree(tree, diag(sse));
%plot_tree(tree,bo);
%plot_tree(tree,bi);
%plot_tree(tree,b);
%plot_tree(tree,asym);
plot_tree(tree,lo);
colorbar;


