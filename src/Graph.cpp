#include <string>
#include <fstream>
#include <unordered_map>

#include "Graph.h"

Graph::Graph()
: num_vertices(0)
, num_edges(0)
{ }

Graph::Graph(size_t num_vertices, const std::vector<std::pair<size_t,size_t>>& edges)
: num_vertices(num_vertices)
{
    from_edgelist(num_vertices, edges);
}

Graph::~Graph() { }

void Graph::loadFromFile(const std::string &filename, const Data *data) {
    std::ifstream input_file;
    input_file.open(filename);
    if(!input_file.good()) {
        throw std::runtime_error("Could not open feature graph file");
    }

    // map varnames to matrix indices
    const std::vector<std::string>& var_names = data->getVariableNames();
    std::unordered_map<std::string, size_t> var_map;
    for(size_t i = 0; i < var_names.size(); ++i) {
        var_map[var_names[i]] = i;
    }

    std::vector<std::pair<size_t,size_t>> edges;

    std::string line;
    while(getline(input_file, line)) {
        if(line.length() == 0) continue;

        size_t pos = line.find_first_of('\t');
        if(pos == line.npos) continue;

        std::string a = line.substr(0, pos);
        std::string b = line.substr(pos+1, line.npos);

        std::unordered_map<std::string, size_t>::const_iterator a_it = var_map.find(a);
        std::unordered_map<std::string, size_t>::const_iterator b_it = var_map.find(b);

        if(a_it != var_map.end() && b_it != var_map.end()) {
            edges.emplace_back(a_it->second, b_it->second);
        }
    }

    from_edgelist(num_edges, edges);
}

void Graph::from_edgelist(size_t num_vertices, const std::vector<std::pair<size_t, size_t>> &edges) {
    adj.resize(num_vertices);
    num_edges = edges.size();

    for(size_t i = 0; i < edges.size(); ++i) {
        size_t a = edges[i].first;
        size_t b = edges[i].second;

        adj[a].insert(b);
        adj[b].insert(a);
    }
}
