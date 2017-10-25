#include "Graph.h"

Graph::Graph()
: num_vertices(0)
, num_edges(0)
{ }

Graph::Graph(size_t num_vertices, const std::vector<std::pair<size_t,size_t>>& edges)
: num_vertices(num_vertices)
{
	adj.resize(num_vertices);
	num_edges = edges.size();

    for(size_t i = 0; i < edges.size(); ++i) {
        size_t a = edges[i].first;
        size_t b = edges[i].second;

        adj[a].insert(b);
        adj[b].insert(a);
    }
}

Graph::~Graph() { }

void Graph::loadFromFile(const std::string &filename, const Data *data) {

}
