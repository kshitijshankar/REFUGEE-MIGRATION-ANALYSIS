Appendix - Sample Code
getwd()
dirpath <- "C:\\Users\\Sai Tharun\\Documents\\SIN PROJECT"
setwd(dirpath)
library(igraph)
refugee <- read.csv("resettlement.csv", header = TRUE, sep = ",")
#Create Graph
g_refugee=graph.data.frame(graph.data, directed = TRUE, vertices=
NULL)
#USe the Largest Connected Component
g.decompose <- decompose(g_refugee)
g.refugee <- g.decompose[[1]]
ecount.full <- c("Edge Count Full",ecount(g.refugee))
vcount.full <- c("Vertex Count Full",vcount(g.refugee))
is.simple(g.refugee)
#Community detection
g_refugee_commun=graph.data.frame(graph.data, directed = FALSE,
vertices= NULL)
#USe the Largest Connected Component
g.decompose <- decompose(g_refugee_commun)
g.refugee.commun.undir <- g.decompose[[1]]
ecount(g.refugee.commun.undir)
g.refugeerefugee.commun.undir <- simplify(g.refugee.commun.undir)
ecount(g.refugee.commun.undir)
g.refugee.commun.dir <- g.refugee.simplify
#Community Detection using Fast Greedy
g.refugee.fast <- fastgreedy.community(g.refugee.commun.undir,
weights=E(g.refugee.commun.undir)$weight
V(g.refugee.commun.undir)$label.cex= 0.3
plot(g.refugee.fast,g.refugee.commun.undir, vertex.color="purple",
vertex.frame.color="#ffffff",
vertex.size = 3,edge.width =
E(g.g.refugee.commun.undir)$weight/5,edge.arrow.size = 0.3,
vertex.label.color="black",edge.color =
adjustcolor("purple",alpha.f =0.4 ))
title("Fast greedy Algorithm")
c.m.fast <- membership(g.refugee.fast)
#Community Detection using Walktrap
g.refugee.walktrap <-
walktrap.community(g.refugee.commun.dir,step = 6,
weights=E(g.refugee.commun.dir)$weight)
length(g.refugee.walktrap)
c.m.walktrap <- membership(g.refugee.walktrap)
V(g.refugee.commun.dir)$label.cex= 0.3
plot(g.refugee.walktrap,g.refugee.commun.dir, vertex.color="purple",
vertex.frame.color="#ffffff",
vertex.size = 3,edge.width =
E(g.refugee.commun.undir)$weight/5,edge.arrow.size = 0.3,
vertex.label.color="black",edge.color =
adjustcolor("purple",alpha.f =0.4 ))
title("WalkTrap Algorithm")
#Community Detection using Spinglass
g.refugee.spinglass<-
spinglass.community(g.refugee.commun.dir,spins = 60,
weights=E(g.refugee.commun.dir)$weight)
length(g.refugee.spinglass)
c.m.spinglass <- membership(g.refugee.spinglass)
V(g.refugee.commun.dir)$label.cex= 0.3
plot(g.refugee.spinglass,g.refugee.commun.dir, vertex.color="purple",
vertex.frame.color="#ffffff",
vertex.size = 3,edge.width =
E(g.refugee.commun.undir)$weight/5,edge.arrow.size = 0.3,
vertex.label.color="black",edge.color =
adjustcolor("purple",alpha.f =0.4 ))
title("Spinglass Algorithm")
#Community Detection using Label Propogation
g.refugee.label<-
label.propagation.community(g.refugee.commun.dir,weights=E(g.refu
gee.commun.dir)$weight)
length(g.refugee.label)
c.m.label <- membership(g.refugee.label)
V(g.refugee.commun.dir)$label.cex= 0.3
plot(g.refugee.label,g.refugee.commun.dir, vertex.color="purple",
vertex.frame.color="#ffffff",
vertex.size = 3,edge.width =
E(g.refugee.commun.undir)$weight/5,edge.arrow.size = 0.3,
vertex.label.color="black",edge.color =
adjustcolor("purple",alpha.f =0.4 ))
title("Label Propogation Algorithm")
#Community Detection using Girvan-Newman
g.refugee.gn<-
edge.betweenness.community(g.refugee.commun.dir,weights=E(g.ref
ugee.commun.dir)$weight)
length(g.refugee.gn)
c.m.gn <- membership(g.refugee.gn)
V(g.refugee.commun.dir)$label.cex= 0.3
plot(g.refugee.gn,g.refugee.commun.dir, vertex.color="purple",
vertex.frame.color="#ffffff",
vertex.size = 3,edge.width =
E(g.refugee.commun.undir)$weight/5,edge.arrow.size = 0.3,
vertex.label.color="black",edge.color =
adjustcolor("purple",alpha.f =0.4 ))
title("Community Detection using Girvan-Newman")
