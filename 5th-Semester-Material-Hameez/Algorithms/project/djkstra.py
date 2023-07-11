import networkx as nx
import matplotlib.pyplot as plt


def matrixToEdgeList(nodes, m):
	edgeList = []
	for i in range(nodes):
		for j in range(nodes):
			if m[(i, j)] != 0:
				edgeList.append((i, j, m[(i, j)]))
	return edgeList

def edgeListToMatrix(nodes, m):
	graph = [[0 for column in range(nodes)] for row in range(nodes)]
	for tup in m:
		if (graph[tup[0]][tup[1]] == 0):
			graph[tup[0]][tup[1]] = tup[2]
		else:
			graph[tup[0]][tup[1]] = min(tup[2], graph[tup[0]][tup[1]])
	return graph

def printMatrix(nodes, mat):
	for i in range(nodes):
		for j in range(nodes):
			print(mat[i][j], end="\t")
		print()


def inputFile(filePath):
	file = open(filePath)
	lines = file.read()
	lines = list(filter(None, lines.split('\n')))
	nodes = int(lines[1])
	pos = {}
	for i in range(nodes):
		node = lines[i+2].split('\t')
		pos[int(node[0])] = (float(node[1]), float(node[2]))
	edgeList = []
	j = nodes+2
	while j < len(lines):
		tok = (list(filter(None, lines[j].split('\t'))))
		if len(tok) > 1:
			node1 = int(tok.pop(0))
			for index in range(0, len(tok), 4):
				if node1 == int(tok[index]):
					continue
				edgeList.append((node1, int(tok[index]), float(tok[index+2])/10000000.0))
		j += 1
	AdjMatrix = edgeListToMatrix(nodes, edgeList)
	for i in range(nodes):
		for j in range(nodes):
			if AdjMatrix[i][j] == 0:
				AdjMatrix[i][j] = AdjMatrix[j][i]
	return nodes, edgeList, AdjMatrix, pos;

import sys

from collections import defaultdict 
  
#Class to represent a graph 
class Graph: 
	def __init__(self, vertices, adjMatrix): 
		self.V = vertices 
		self.graph = [[0 for column in range(vertices)] for row in range(vertices)] 
		for i in range(len(self.graph)):
			for j in range(len(self.graph[i])):
				self.graph[i][j] = adjMatrix[i][j]
		self.solutionEdges = []

	# A utility function to find the  
	# vertex with minimum dist value, from 
	# the set of vertices still in queue 
	def minDistance(self,dist,queue): 
		# Initialize min value and min_index as -1 
		minimum = float("Inf") 
		min_index = -1
		  
		# from the dist array,pick one which 
		# has min value and is till in queue 
		for i in range(len(dist)): 
			if dist[i] < minimum and i in queue: 
				minimum = dist[i] 
				min_index = i 
		return min_index 
  
  
	# Function to print shortest path 
	# from source to j 
	# using parent array 
	def printPath(self,parent, j): 
		  
		#Base Case : If j is source 
		if parent[j] == -1 :  
			#print(j), 
			return
		self.printPath(parent , parent[j]) 
		self.solutionEdges.append((parent[j], j, self.graph[parent[j]][j]))
		#print(j), 
		  
  
	# A utility function to print 
	# the constructed distance 
	# array 
	def printSolution(self, src, dist, parent): 
		print("Vertex \t\tDistance from Source\tPath") 
		cost = 0
		for i in range(0, len(dist)):
			print("\n%d --> %d \t\t%.2f \t\t\t\t\t" % (src, i, dist[i])), 
			self.printPath(parent, i) 
			cost += dist[i]
		print(cost)
  
  
	'''Function that implements Dijkstra's single source shortest path 
	algorithm for a graph represented using adjacency matrix 
	representation'''
	def dijkstra(self, src): 
  
		row = len(self.graph) 
		col = len(self.graph[0]) 
  
		# The output array. dist[i] will hold 
		# the shortest distance from src to i 
		# Initialize all distances as INFINITE  
		dist = [float("Inf")] * row 
  
		#Parent array to store  
		# shortest path tree 
		parent = [-1] * row 
  
		# Distance of source vertex  
		# from itself is always 0 
		dist[src] = 0
	  
		# Add all vertices in queue 
		queue = [] 
		for i in range(row): 
			queue.append(i) 
			  
		#Find shortest path for all vertices 
		while queue: 
  
			# Pick the minimum dist vertex  
			# from the set of vertices 
			# still in queue 
			u = self.minDistance(dist,queue)  
  
			# remove min element	  
			queue.remove(u) 
  
			# Update dist value and parent  
			# index of the adjacent vertices of 
			# the picked vertex. Consider only  
			# those vertices which are still in 
			# queue 
			for i in range(col): 
				'''Update dist[i] only if it is in queue, there is 
				an edge from u to i, and total weight of path from 
				src to i through u is smaller than current value of 
				dist[i]'''
				if self.graph[u][i] and i in queue: 
					if dist[u] + self.graph[u][i] < dist[i]: 
						dist[i] = dist[u] + self.graph[u][i] 
						parent[i] = u 
  
  
		# print the constructed distance array 
		self.printSolution(src, dist,parent) 

nodes, edgeList, A, pos = inputFile("benchmark/input10.txt")

labels = dict()
for i in range(nodes):
	labels[i] = str(i)


g = Graph(nodes, A)
g.dijkstra(1)
edgeList = g.solutionEdges

fig = plt.figure()

X=nx.DiGraph()
X.add_nodes_from(pos.keys())
X.add_weighted_edges_from(edgeList)

edge_labels = nx.get_edge_attributes(X,'weight')

nx.draw_networkx_nodes(X, pos)
nx.draw_networkx_labels(X, pos, labels)
nx.draw_networkx_edges(X, pos)
nx.draw_networkx_edge_labels(X, pos, edge_labels=edge_labels)

plt.show()
