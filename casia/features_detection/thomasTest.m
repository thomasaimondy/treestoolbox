
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

%% features:1.graphtheory

bo = BO_tree(tree);  % branch order
[bi, bins, bh] = bin_tree(tree,[],4); % bin sets 维度与其他不同
b = B_tree(tree);    % branch points
t = T_tree(tree); % terminal points
c = C_tree(tree); %continuation points
asym = asym_tree(tree, T_tree(tree))'; % balanced or not.node values of Nx1 vector v get summed up in each sub-tree to S1 and S2.asym, an Nx1 vector, contains the ratio of S1 / (S1 + S2) for S1 < S2 at branch points (but NaN otherwise).
pl = PL_tree(tree); % the topological path length
lo = LO_tree(tree); % level order values
ipar = ipar_tree(tree); % path to root, parent indices, matrix
sub = sub_tree(tree);%child nodes forming sub-tree
typeN = typeN_tree(tree);%type of node,0=T,1=C,2=B;
child = child_tree(tree);%add up child node values
dissect = dissect_tree(tree);%group nodes to branches
dist = dist_tree(tree);%nodes at distance from root
%sort = sort_tree(tree);%relabel nodes to BCT order
rindex = rindex_tree(tree);%region specific indexation
%redirect = redirect_tree(tree);%set root to new node
ratio = ratio_tree(tree);%parent to daughter ratio
idpar = idpar_tree(tree);%index to direct parent node
Pvec = Pvec_tree(tree);%cumulative summation along paths.By default, "Pvec_tree" sums up the length values of the segments in the tree.
gene = gene_tree({{tree}});%topological gene

%% 2.metrics
angleB = angleB_tree(tree);%angle values of branch point,angleB is NaN at nodes which are not branch points
cvol = cvol_tree(tree);%continuous volumes for all segments
cyl = cyl_tree(tree);%the starting and ending points of the individual segments of tree intree.Outputs X1, X2, Y1, Y2, Z1 and Z2 are Nx1 vectors, M is the concatenated Nx6 matrix.
eucl = eucl_tree(tree);%the Euclidean distance [in mm] between all points on the tree and the root.
len = len_tree(tree);%length values of tree segments
surf = surf_tree(tree);%the surfaces [in mm2] of all segments
vol = vol_tree(tree);%segment volume values

stats = stats_tree(tree);%collect trees statistics
stats.gstats; %1x5 struct array with fields:
stats.gstats.len; % len, total cable length
stats.gstats.max_plen; % max_plen, maximum path length
                    % bpoints, number of branch points
                    % mpeucl, mean path/Euclidean distance
                    % maxbo, maximum branch order
                    % mangleB, mean branch angle
                    % mblen, mean branch length
                    % mplen, mean path length
                    % mbo, mean branch order
                    % wh, field height/width
                    % wz, field depth/width
                    % chullx, center of mass x
                    % chully, center of mass y
                    % chullz, center of mass z
stats.dstats;  %1x5 struct array with fields:
                % BO, branch order distribution
                % Plen, path length distribution
                % peucl, path/Euclidean distance dist.
                % angleB, branch angle distribution
                % blen, branch lengths distribution
                
%% simularity
tree1 = load_tree('78177.swc');
tree2 = load_tree('78178.swc');
stats1 = stats_tree(tree1);
stats2 = stats_tree(tree2);

fileds1 = fieldnames(stats1.gstats);

feature1 = [];
feature2 = [];

for i=1:length(fileds1)
    k = fileds1(i);
    key = k{1}; 
    value1 = stats1.gstats.(key);
    value2 = stats2.gstats.(key);
%   disp(key);
%   disp(value1);
%   disp(value2);
    feature1 = [feature1 value1];
    feature2 = [feature2 value2];
%   disp('---');
end

d = norm(feature1-feature2);
sim = 1/(1+d);
disp('simularity:');
disp(sim);
%% plot the data
clf;
%plot_tree(tree, diag(sse));
%plot_tree(tree,bo);
%plot_tree(tree,bi);
%plot_tree(tree,b);
%plot_tree(tree,asym);
plot_tree(tree,lo);
colorbar;


