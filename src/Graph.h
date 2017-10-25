#ifndef GRAPH_H_
#define GRAPH_H_ 

#include "globals.h"
#include <cstddef>
#include <vector>
#include <set>
#include <utility>
#include "Data.h"

class Graph {
	public:
		Graph();

		Graph(size_t num_vertices, const std::vector<std::pair<size_t,size_t>>& edges);

		virtual ~Graph();

        void loadFromFile(const std::string &filename, const Data *data);

		const std::set<size_t> &adjacent(size_t v) const {
			return adj[v];
		}

		size_t vertexCount() const { return num_vertices; }
		size_t edgeCount() const { return num_edges; }

	private:
		void from_edgelist(size_t num_vertices, const std::vector<std::pair<size_t,size_t>>& edges);

		std::vector<std::set<size_t>> adj;
		size_t num_vertices;
		size_t num_edges;
};

#endif
