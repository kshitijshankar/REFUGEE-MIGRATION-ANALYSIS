# 📈 **Refugee Resettlement Network Analysis Using R** 📊

📌 Project Overview

This project uses R programming language and the igraph package to perform graph-based network analysis on a refugee resettlement dataset.

The analysis models relationships in the resettlement.csv dataset as a network and investigates its structure through connected-component analysis, graph simplification, visualization, and multiple community detection algorithms.

The primary objective is to identify meaningful groups or communities within the network and compare how different community-detection approaches partition the same underlying network.

🎯 Project Objectives

Load and prepare refugee resettlement network data.

Construct a directed graph from the dataset.

Identify the largest connected component for focused analysis.

Measure the number of vertices and edges in the network.

Check whether the graph is simple.

Create an undirected representation for community detection.

Simplify the graph where required.

Detect communities using multiple algorithms.

Extract community memberships for further comparison.

Visualize detected communities using network plots.

Provide a foundation for comparing graph-structure and community-detection techniques.

🛠️ Technology Stack

Component

Technology

Programming Language

R

Main Package

igraph

Input Dataset

resettlement.csv

Data Format

CSV

Analysis Type

Graph / Network Analysis

Community Detection

Fast Greedy, Walktrap, Spinglass, Label Propagation, Girvan–Newman

Visualization

R / igraph plotting

📂 Suggested Repository Structure

refugee-resettlement-network-analysis/
│
├── README.md
├── refugee_network_analysis.R
├── resettlement.csv
└── outputs/
    ├── fast_greedy.png
    ├── walktrap.png
    ├── spinglass.png
    ├── label_propagation.png
    └── girvan_newman.png

The exact filenames can be changed to match the files in your repository.

📊 Dataset

The project expects a CSV file named:

resettlement.csv

The code reads the dataset using:

refugee <- read.csv("resettlement.csv", header = TRUE, sep = ",")

The dataset is treated as a network/edge-list-style input for graph construction.

Important

The supplied code references an object called graph.data when creating the graph:

g_refugee = graph.data.frame(graph.data, directed = TRUE, vertices = NULL)

However, the visible code only creates an object called refugee from resettlement.csv.

Therefore, the dataset preparation step that creates graph.data may exist elsewhere in the original project or may need to be added before running the graph-construction section.

🔍 Analysis Workflow

1. Set the Working Directory

The original script begins by checking and setting the working directory:

getwd()

dirpath <- "C:\\Users\\Sai Tharun\\Documents\\SIN PROJECT"
setwd(dirpath)

For GitHub and reproducibility, it is recommended to avoid hard-coded personal Windows paths and instead use a project-relative path or an R project (.Rproj).

2. Load the igraph Package

library(igraph)

The igraph package provides the core functionality used throughout the project for:

Graph creation

Vertex and edge analysis

Connected components

Graph simplification

Community detection

Network visualization

3. Import the Dataset

refugee <- read.csv(
  "resettlement.csv",
  header = TRUE,
  sep = ","
)

The CSV file is loaded into R and becomes the source data for subsequent network analysis.

🕸️ Network Construction

The project constructs a directed graph:

g_refugee = graph.data.frame(
  graph.data,
  directed = TRUE,
  vertices = NULL
)

A directed graph represents relationships where the direction of an edge can carry meaning.

For example:

Node A ───────► Node B

means the relationship is represented from Node A toward Node B.

🔗 Largest Connected Component

The project decomposes the graph into connected components:

g.decompose <- decompose(g_refugee)
g.refugee <- g.decompose[[1]]

The first component is then used as the main graph for further analysis.

This approach helps focus the analysis on the largest connected portion of the network rather than disconnected or isolated portions.

📏 Basic Network Metrics

The project calculates:

Edge Count

ecount(g.refugee)

This measures the number of relationships/edges in the analyzed graph.

Vertex Count

vcount(g.refugee)

This measures the number of nodes/entities in the network.

The original script stores these values as:

ecount.full <- c("Edge Count Full", ecount(g.refugee))
vcount.full <- c("Vertex Count Full", vcount(g.refugee))

Simple Graph Check

is.simple(g.refugee)

This checks whether the graph satisfies igraph's definition of a simple graph, i.e. whether it contains features such as loops or multiple edges that would prevent it from being simple.

🔄 Directed vs Undirected Network

For community detection, the project creates an undirected version of the network:

g_refugee_commun = graph.data.frame(
  graph.data,
  directed = FALSE,
  vertices = NULL
)

This is important because several community-detection algorithms are traditionally applied to undirected networks.

The graph is again decomposed:

g.decompose <- decompose(g_refugee_commun)
g.refugee.commun.undir <- g.decompose[[1]]

The network is also simplified:

g.refugeerefugee.commun.undir <- simplify(
  g.refugee.commun.undir
)

🧩 Community Detection

One of the main strengths of this project is that it does not rely on a single community-detection method.

Instead, it evaluates five different algorithms.

This allows the structure of the network to be explored from multiple algorithmic perspectives.

1. Fast Greedy Community Detection

The project applies the Fast Greedy algorithm:

g.refugee.fast <- fastgreedy.community(
  g.refugee.commun.undir,
  weights = E(g.refugee.commun.undir)$weight
)

Purpose

Fast Greedy is a hierarchical community-detection approach that attempts to maximize modularity by progressively merging communities.

Project Output

Community membership is extracted using:

c.m.fast <- membership(g.refugee.fast)

The communities are then visualized using plot().

2. Walktrap Community Detection

The project applies Walktrap:

g.refugee.walktrap <- walktrap.community(
  g.refugee.commun.dir,
  steps = 6,
  weights = E(g.refugee.commun.dir)$weight
)

Purpose

Walktrap is based on the idea that short random walks tend to remain within densely connected communities.

The project extracts the community assignments:

c.m.walktrap <- membership(g.refugee.walktrap)

The number of detected communities is inspected using:

length(g.refugee.walktrap)

3. Spinglass Community Detection

The project also uses the Spinglass algorithm:

g.refugee.spinglass <- spinglass.community(
  g.refugee.commun.dir,
  spins = 60,
  weights = E(g.refugee.commun.dir)$weight
)

Purpose

Spinglass applies concepts inspired by statistical physics to identify community structure.

The parameter:

spins = 60

specifies the number of possible community states considered by the algorithm.

Community membership is extracted with:

c.m.spinglass <- membership(g.refugee.spinglass)

4. Label Propagation

The project uses Label Propagation:

g.refugee.label <- label.propagation.community(
  g.refugee.commun.dir,
  weights = E(g.refugee.commun.dir)$weight
)

Purpose

Label Propagation identifies communities by allowing labels to propagate through the network.

It is useful for exploring community structure with a relatively lightweight algorithm.

The detected memberships are stored using:

c.m.label <- membership(g.refugee.label)

5. Girvan–Newman Community Detection

The final method is edge betweenness community detection:

g.refugee.gn <- edge.betweenness.community(
  g.refugee.commun.dir,
  weights = E(g.refugee.commun.dir)$weight
)

This is commonly associated with the Girvan–Newman community-detection approach.

Concept

The method identifies edges with high betweenness and progressively removes important connecting edges to reveal community structure.

Community memberships are obtained using:

c.m.gn <- membership(g.refugee.gn)

📈 Visualization

The project generates network visualizations for the different community-detection approaches.

A typical visualization includes:

Purple vertices

White vertex borders

Small node sizes

Weighted edge widths

Semi-transparent purple edges

Community-based network layouts

Black vertex labels

For example:

plot(
  g.refugee.fast,
  g.refugee.commun.undir,
  vertex.color = "purple",
  vertex.frame.color = "#ffffff",
  vertex.size = 3
)

The visualizations make it easier to identify dense groups, bridges between communities, and the overall structure of the network.

🧠 Key Analytical Insights

Based on the supplied code, the project is designed to generate the following types of insights:

Network Structure

The project measures:

Number of vertices

Number of edges

Connected components

Graph simplicity

Network connectivity

Community Structure

Five algorithms are used to investigate whether the network contains meaningful groups:

Algorithm

Main Concept

Fast Greedy

Modularity-based hierarchical merging

Walktrap

Random walks tend to remain inside communities

Spinglass

Statistical-physics-inspired community detection

Label Propagation

Community labels spread through the network

Girvan–Newman

Removes high-betweenness edges to reveal communities

Comparative Analysis

Using multiple algorithms makes it possible to compare whether similar community structures are identified across methods.

For example, if several algorithms repeatedly assign the same nodes to the same communities, that can provide stronger evidence that the grouping represents a meaningful structural pattern in the network.

⚠️ Code Quality / Reproducibility Notes

The supplied code appears to contain several incomplete, inconsistent, or outdated references that should be reviewed before presenting the project as a fully reproducible analysis.

1. graph.data is not defined in the supplied code

The script loads:

refugee <- read.csv(...)

but subsequently uses:

graph.data

You should confirm where graph.data is created.

2. Some variable names appear inconsistent

For example:

g.refugeerefugee.commun.undir

appears to contain a duplicated refugee.

Later the script references:

g.refugee.simplify

which is not created in the supplied code.

3. Some graph plotting references appear inconsistent

The supplied code contains:

E(g.g.refugee.commun.undir)$weight

while the previously defined object is:

g.refugee.commun.undir

This should be checked before execution.

4. Some function syntax appears incomplete

For example, the Fast Greedy section appears to be missing a closing parenthesis:

weights=E(g.refugee.commun.undir)$weight

The plotting and algorithm sections should therefore be validated in R before publication.

5. Older igraph syntax

Some functions in the supplied code, such as:

graph.data.frame()
fastgreedy.community()
walktrap.community()
spinglass.community()

are associated with older igraph APIs.

If the project is being executed using a current version of igraph, some function names or arguments may require updating.

🚀 How to Run the Project

Step 1 — Install R

Install R from the official R Project website.

Step 2 — Install igraph

Run:

install.packages("igraph")

Then load it:

library(igraph)

Step 3 — Place the Dataset

Keep:

resettlement.csv

inside the project directory.

Step 4 — Open the R Script

Recommended filename:

refugee_network_analysis.R

Step 5 — Update the Data Preparation Section

Ensure that the object referenced by:

graph.data

is actually created from the imported dataset.

Step 6 — Run the Analysis

Execute the script section by section and review:

Vertex count

Edge count

Connected components

Community counts

Community memberships

Network visualizations

📌 Project Highlights

R-based network analysis

igraph-powered graph modeling

Directed and undirected graph representations

Largest connected component analysis

Graph simplification

Multiple community-detection algorithms

Network visualization

Community membership extraction

Comparative community analysis

💡 Potential Extensions

This project can be extended significantly by adding:

Degree centrality

Betweenness centrality

Closeness centrality

Eigenvector centrality

PageRank

Network density

Average path length

Clustering coefficient

Community modularity comparison

Community-size comparison

Algorithm agreement analysis

Interactive network visualization

Export of community assignments to CSV

Reproducible R Markdown / Quarto reporting

A particularly useful extension would be to create a comparison table showing the number of communities and modularity score produced by each algorithm.

🏆 Conclusion

This project demonstrates how R and igraph can be used to analyze complex networks and uncover hidden community structures.

Rather than relying on a single clustering technique, the analysis applies five different community-detection approaches—Fast Greedy, Walktrap, Spinglass, Label Propagation, and Girvan–Newman—providing a broader perspective on the underlying network structure.

The project is therefore well suited as a portfolio example for R Programming, Data Analytics, Network Science, Graph Analytics, and Community Detection.

👨‍💻 Skills Demonstrated

·R Programming 
· igraph 
· Network Analysis 
· Graph Theory 
· Community Detection 
· Data Import 
· Data Visualisation 
· Algorithm Comparison
· Graph Analytics

📜 Project Status

Status: Academic / Analytical Project

Language: R

Primary Package: igraph

Dataset: resettlement.csv
