/*-------------------------------------------------------------------------------
 This file is part of Grand Forest.

 Grand Forest is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 Grand Forest is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with Grand Forest. If not, see <http://www.gnu.org/licenses/>.
-------------------------------------------------------------------------------*/

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
