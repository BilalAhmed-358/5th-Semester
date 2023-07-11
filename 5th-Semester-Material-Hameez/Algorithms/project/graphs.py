import matplotlib.pyplot as plt 
import numpy as np
import sys
from math import inf

n = int(input("enter number of nodes: "))
file_name = 'input'
file_name += str(n)
file_name += '.txt'

with open(file_name, 'r') as input10:
    f_contents = input10.readline()
    f_contents = input10.readline()
    f_contents = input10.readline()
    nodes = int(f_contents)
    f_contents = input10.readline()
    
    nodelist = np.empty((nodes,3)) 
    for i in range(nodes):
        f_contents = input10.readline()
        nodelist[i, :] = f_contents.split("\t")
    f_contents = input10.readline()
    
    adj_list = np.zeros([nodes,15,2],float)
    for node in range(nodes):
        for i in range(15):
            adj_list[node][i][0] = -1.1
            adj_list[node][i][1] = -1.1
 
    f_contents = input10.readline()
    x =  f_contents.split("\t")
    j=1
    k=3
    for node in range(nodes):
        for i in range(int(x[0])):
            nodeto = int(x[j])
            weight = float(x[k])
            weight = weight/10000000
            adj_list[node][i][0] = nodeto
            adj_list[node][i][1] = weight
            j=j+4
            k=k+4
        f_contents = input10.readline()
        x =  f_contents.split("\t")
        j=1
        k=3
    f_contents = input10.readline()
    source = int(f_contents)
x_values = np.zeros(2,float)
y_values = np.zeros(2,float)
mark_values = np.zeros(2,int)
for node in range(nodes):
    for i in range(15):
        if adj_list[node][i][0] != -1.1:
            #print(node,'\t',int(adj_list[node][i][0]),'\t',adj_list[node][i][1])
            x_values[0] = nodelist[node][1]
            x_values[1] = nodelist[int(adj_list[node][i][0])][1]
            y_values[0] = nodelist[node][2]
            y_values[1] = nodelist[int(adj_list[node][i][0])][2]
            plt.plot(x_values, y_values, color = 'green' ,linewidth = 2, marker='o', markerfacecolor='yellow', markersize=20) 
            plt.arrow(x_values[0],y_values[0], x_values[1]-x_values[0], y_values[1]-y_values[0],  shape='full', lw=0, length_includes_head=True,head_length=0.03,head_width=.01)
        else:
            break
font_dict = { 'family':'serif',
              'color':'darkred',
              'size':8}
for node in range(nodes):
    plt.text(nodelist[node][1], nodelist[node][2], node,fontdict = font_dict)
plt.xlabel('x - axis')  
plt.ylabel('y - axis')  
plt.title('Original Graph')

algo = int(input("1 => Prims\n2 => Kruskal\n3 => Dijkstra\n4 => Bellman Ford\n5 => Floyd Warshall Algorithm\n6 => Clustering Coefficient in Graph Theory\nEnter value to execute Algorithm on Graph: "))
plt.show()
if algo == 1:
    class PrimsGraph(): 
        def __init__(self, vertices): 
            self.V = vertices 
            self.graph = [[0 for column in range(vertices)]  
                        for row in range(vertices)] 
  
        def PrimsprintMST(self, parent):
            plt.clf() 
            #print ("Edge \tWeight")
            prims_total_cost = 0.0 
            for i in range(1, self.V): 
                # print (parent[i], "-", i, "\t", self.graph[i][ parent[i] ]) 
                x_values[0] = nodelist[parent[i]][1]
                x_values[1] = nodelist[i][1]
                y_values[0] = nodelist[parent[i]][2]
                y_values[1] = nodelist[i][2]
                prims_total_cost = prims_total_cost + float(self.graph[i][parent[i]])
                plt.plot(x_values, y_values ,label = str(self.graph[i][parent[i]]), linewidth = 2, marker='o', markersize=20) 
                plt.arrow(x_values[0],y_values[0], x_values[1]-x_values[0], y_values[1]-y_values[0],  shape='full', lw=0, length_includes_head=True,head_length=0.04,head_width=.02)
            font_dict = { 'family':'serif',
                        'color':'black',
                        'size':8}
            for node in range(nodes):
                plt.text(nodelist[node][1], nodelist[node][2], node,fontdict = font_dict)
            plt.xlabel(str("x-axis\nTotal Cost: "+"{0:.2f}".format(prims_total_cost)))
            plt.ylabel('y - axis')  
            plt.title('Prims MST Graph')
            plt.legend()
            plt.show()
        def PrimsminKey(self, key, mstSet): 
  
            min = sys.maxsize 
  #graph[u][v] is non zero only for adjacent vertices of m  
            #mstSet[v] is false for vertices not yet included in MST  
            #Update the key only if graph[u][v] is smaller than key[v]  
            for v in range(self.V): 
                if key[v] < min and mstSet[v] == False: 
                    min = key[v] 
                    min_index = v 
  
            return min_index 
  
        def primMST(self): 
    
            key = [sys.maxsize] * self.V 
            parent = [None] * self.V
            key[0] = 0 
            mstSet = [False] * self.V 
    
            parent[0] = -1
    
            for cout in range(self.V): 
    

                u = self.PrimsminKey(key, mstSet) 
    

                mstSet[u] = True
    

                for v in range(self.V): 

                    if self.graph[u][v] > 0 and mstSet[v] == False and key[v] > self.graph[u][v]: 
                            key[v] = self.graph[u][v] 
                            parent[v] = u 
    
            self.PrimsprintMST(parent) 
    
    g = PrimsGraph(nodes)
    for node in range(nodes):
        for i in range(15):
            if adj_list[node][i][0] != -1.1:
                #print(node,'\t',int(adj_list[node][i][0]),'\t',adj_list[node][i][1]) 
                g.graph[node][int(adj_list[node][i][0])] =  float(adj_list[node][i][1])
    g.primMST()
elif algo == 2:
    #Class to represent a graph 
    class kruskalGraph: 
  
        def __init__(self,vertices): 
            self.V= vertices #No. of vertices 
            self.graph = [] # default dictionary  
                                # to store graph 
          
   
        # function to add an edge to graph 
        def kruskaladdEdge(self,u,v,w): 
            self.graph.append([u,v,w]) 
  
        # A utility function to find set of an element i 
        # (uses path compression technique) 
        def kruskalfind(self, parent, i): 
            if parent[i] == i: 
                return i 
            return self.kruskalfind(parent, parent[i]) 
  
        # A function that does union of two sets of x and y 
        # (uses union by rank) 
        def kruskalunion(self, parent, rank, x, y):
               #keep on adding vertices until cycle formed stop when len is V-1 of mst
            xroot = self.kruskalfind(parent, x) 
            yroot = self.kruskalfind(parent, y) 
  
            # Attach smaller rank tree under root of  
            # high rank tree (Union by Rank) 
            if rank[xroot] < rank[yroot]: 
                parent[xroot] = yroot 
            elif rank[xroot] > rank[yroot]: 
                parent[yroot] = xroot 
  
            # If ranks are same, then make one as root  
            # and increment its rank by one 
            else : 
                parent[yroot] = xroot 
                rank[xroot] += 1
  
        # The main function to construct MST using Kruskal's  
        # algorithm 
        def KruskalMST(self): 
  
            result =[] #This will store the resultant MST 
  
            i = 0 # An index variable, used for sorted edges 
            e = 0 # An index variable, used for result[] 
  
            # Step 1:  Sort all the edges in non-decreasing  
                # order of their 
                # weight.  If we are not allowed to change the  
                # given graph, we can create a copy of graph 
            self.graph =  sorted(self.graph,key=lambda item: item[2]) 
  
            parent = [] ; rank = [] 
  
            # Create V subsets with single elements 
            for node in range(self.V): 
                parent.append(node) 
                rank.append(0) 
      
            # Number of edges to be taken is equal to V-1 
            while e < self.V -1 : 
  
                # Step 2: Pick the smallest edge and increment  
                        # the index for next iteration 
                u,v,w =  self.graph[i] 
                i = i + 1
                x = self.kruskalfind(parent, u) 
                y = self.kruskalfind(parent ,v) 
  
                # If including this edge does't cause cycle,  
                        # include it in result and increment the index 
                        # of result for next edge 
                if x != y: 
                    e = e + 1     
                    result.append([u,v,w]) 
                    self.kruskalunion(parent, rank, x, y)             
                # Else discard the edge 
  
            # print the contents of result[] to display the built MST 
            # print ("Following are the edges in the constructed MST")
            plt.clf()
            kruskal_cost = 0.0
            for u,v,weight  in result: 
                #print str(u) + " -- " + str(v) + " == " + str(weight) 
                # print ("%d -- %d == %d" % (u,v,weight)) 
                x_values[0] = nodelist[u][1]
                x_values[1] = nodelist[v][1]
                y_values[0] = nodelist[u][2]
                y_values[1] = nodelist[v][2]
                kruskal_cost = kruskal_cost + weight
                plt.plot(x_values, y_values ,label = str(weight), linewidth = 2, marker='o', markersize=20) 
                plt.arrow(x_values[0],y_values[0], x_values[1]-x_values[0], y_values[1]-y_values[0],  shape='full', lw=0, length_includes_head=True,head_length=0.04,head_width=.02)
            font_dict = { 'family':'serif',
                        'color':'black',
                        'size':8}
            for node in range(nodes):
                plt.text(nodelist[node][1], nodelist[node][2], node,fontdict = font_dict)
            plt.xlabel(str("x-axis\nTotal Cost: "+"{0:.2f}".format(kruskal_cost)))  
            plt.ylabel('y - axis')  
            plt.title('Kruskal MST Graph')
            plt.legend()
            plt.show()
    # Driver code
    g = kruskalGraph(nodes)
    for node in range(nodes):
        for i in range(15):
            if adj_list[node][i][0] != -1.1:
                #print(node,'\t',int(adj_list[node][i][0]),'\t',adj_list[node][i][1]) 
                g.kruskaladdEdge(node, int(adj_list[node][i][0]), adj_list[node][i][1])             
    g.KruskalMST()  
elif algo == 3:
    class dijkstraGraph(): 
  
        def __init__(self, vertices): 
            self.V = vertices 
            self.graph = [[0 for column in range(vertices)]  
                        for row in range(vertices)] 
    
        def dijkstraprintSolution(self, dist): 
            # print ("Vertex \tDistance from Source")
            dijkstra_cost = 0.0
            for node in range(self.V): 
                # print (node, "\t", "{0:.2f}".format(dist[node])) 
                x_values[0] = nodelist[source][1]
                x_values[1] = nodelist[node][1]
                y_values[0] = nodelist[source][2]
                y_values[1] = nodelist[node][2]
                dijkstra_cost = dijkstra_cost + float(dist[node])
                plt.plot(x_values, y_values ,label = "{0:.2f}".format(dist[node]), linewidth = 1, marker='o', markersize=14) 
                plt.arrow(x_values[0],y_values[0], x_values[1]-x_values[0], y_values[1]-y_values[0],  shape='full', lw=0, length_includes_head=True,head_length=0.04,head_width=.02)
            font_dict = { 'family':'serif',
                        'color':'black',
                        'size':8}
            for node in range(nodes):
                plt.text(nodelist[node][1], nodelist[node][2], node,fontdict = font_dict)
            plt.xlabel(str("x-axis\nTotal Cost: "+"{0:.2f}".format(dijkstra_cost))) 
            plt.ylabel('y - axis')  
            plt.title('Dijkstra Graph')
            plt.legend()
            plt.show()
        # A utility function to find the vertex with  
        # minimum distance value, from the set of vertices  
        # not yet included in shortest path tree 
        def dijkstraminDistance(self, dist, sptSet): 
    
            # Initilaize minimum distance for next node 
            min = sys.maxsize
    
            # Search not nearest vertex not in the  
            # shortest path tree 
            for v in range(self.V): 
                if dist[v] < min and sptSet[v] == False: 
                    min = dist[v] 
                    min_index = v 
    
            return min_index 
    
        # Funtion that implements Dijkstra's single source  
        # shortest path algorithm for a graph represented  
        # using adjacency matrix representation 
        def dijkstra(self, src): 
    
            dist = [sys.maxsize] * self.V 
            dist[src] = 0
            sptSet = [False] * self.V 
    
            for cout in range(self.V): 
    
                # Pick the minimum distance vertex from  
                # the set of vertices not yet processed.  
                # u is always equal to src in first iteration 
                u = self.dijkstraminDistance(dist, sptSet) 
    
                # Put the minimum distance vertex in the  
                # shotest path tree 
                sptSet[u] = True
    
                # Update dist value of the adjacent vertices  
                # of the picked vertex only if the current  
                # distance is greater than new distance and 
                # the vertex in not in the shotest path tree 
                for v in range(self.V): 
                    if self.graph[u][v] > 0 and sptSet[v] == False and dist[v] > dist[u] + self.graph[u][v]: 
                            dist[v] = dist[u] + self.graph[u][v] 
    
            self.dijkstraprintSolution(dist) 
    
    # Driver program
    g = dijkstraGraph(nodes) 
    for node in range(nodes):
        for i in range(15):
            if adj_list[node][i][0] != -1.1: 
                g.graph[node][int(adj_list[node][i][0])] =  float(adj_list[node][i][1])
    g.dijkstra(source)
elif algo == 4:
    # Class to represent a graph 
    class bellfordGraph: 
    
        def __init__(self, vertices): 
            self.V = vertices # No. of vertices 
            self.graph = [] # default dictionary to store graph 
    
        # function to add an edge to graph 
        def bellfordaddEdge(self, u, v, w): 
            self.graph.append([u, v, w]) 
            
        # utility function used to print the solution 
        def bellfordprintArr(self, dist): 
            # print("Vertex   Distance from Source") 
            bellford_cost = 0.0
            for i in range(self.V): 
                # print("% d \t\t % d" % (i, dist[i])) 
                x_values[0] = nodelist[source][1]
                x_values[1] = nodelist[i][1]
                y_values[0] = nodelist[source][2]
                y_values[1] = nodelist[i][2]
                bellford_cost = bellford_cost + float(dist[i])
                plt.plot(x_values, y_values ,label = "{0:.2f}".format(dist[i]), linewidth = 2, marker='o', markersize=20) 
                plt.arrow(x_values[0],y_values[0], x_values[1]-x_values[0], y_values[1]-y_values[0],  shape='full', lw=0, length_includes_head=True,head_length=0.04,head_width=.02)
            font_dict = { 'family':'serif',
                        'color':'black',
                        'size':8}
            for node in range(nodes):
                plt.text(nodelist[node][1], nodelist[node][2], node,fontdict = font_dict)
            plt.xlabel(str("x-axis\nTotal Cost: "+"{0:.2f}".format(bellford_cost)))  
            plt.ylabel('y - axis')  
            plt.title('Bellman Ford Graph')
            plt.legend()
            plt.show()
        # The main function that finds shortest distances from src to 
        # all other vertices using Bellman-Ford algorithm.  The function 
        # also detects negative weight cycle 
        def BellmanFord(self, src): 
    
            # Step 1: Initialize distances from src to all other vertices 
            # as INFINITE 
            dist = [float("Inf")] * self.V 
            dist[src] = 0 
    
    
            # Step 2: Relax all edges |V| - 1 times. A simple shortest  
            # path from src to any other vertex can have at-most |V| - 1  
            # edges 
            for i in range(self.V - 1): 
                # Update dist value and parent index of the adjacent vertices of 
                # the picked vertex. Consider only those vertices which are still in 
                # queue 
                for u, v, w in self.graph: 
                    if dist[u] != float("Inf") and dist[u] + w < dist[v]: 
                            dist[v] = dist[u] + w 
    
            # Step 3: check for negative-weight cycles.  The above step  
            # guarantees shortest distances if graph doesn't contain  
            # negative weight cycle.  If we get a shorter path, then there 
            # is a cycle. 
    
            for u, v, w in self.graph: 
                    if dist[u] != float("Inf") and dist[u] + w < dist[v]: 
                            print ("Graph contains negative weight cycle")
                            return
                            
            # print all distance 
            self.bellfordprintArr(dist) 

                  
    g = bellfordGraph(nodes)
    for node in range(nodes):
        for i in range(15):
            if adj_list[node][i][0] != -1.1:
                #print(node,'\t',int(adj_list[node][i][0]),'\t',adj_list[node][i][1]) 
                g.bellfordaddEdge(node, int(adj_list[node][i][0]), adj_list[node][i][1])
    g.BellmanFord(source)
elif algo == 5:
    def floyd_warshall(n, edge):
        rn = range(n)
        dist = [[inf] * n for i in rn]
        nxt  = [[0]   * n for i in rn]
        for i in rn:
            dist[i][i] = 0
        for u, v, w in edge:
            dist[int(u-1)][int(v-1)] = w
            nxt[int(u-1)][int(v-1)] = v-1
        for k, i, j in product(rn, repeat=3):
            sum_ik_kj = dist[i][k] + dist[k][j]
            if dist[i][j] > sum_ik_kj:
                dist[i][j] = sum_ik_kj
                nxt[i][j]  = nxt[i][k]
        print("pair     dist    path")
        for i, j in product(rn, repeat=2):
            if i != j:
                path = [i]
                while path[-1] != j:
                    path.append(nxt[int(path[-1])][j])
                print("%d → %d  %4d       %s" 
                    % (i + 1, j + 1, dist[i][j], 
                        ' → '.join(str(p + 1) for p in path)))
    
    if __name__ == '__main__':
        edges = 0
        for node in range(nodes):
            for i in range(15):
                if adj_list[node][i][0] != -1.1:
                    edges = edges+1
        matrix = np.zeros([edges,3],float)
        edge = 0
        
        for node in range(nodes):
            for i in range(15):
                if adj_list[node][i][0] != -1.1: 
                    matrix[edge][0] = float(node)
                    matrix[edge][1] = float(adj_list[node][i][0]) 
                    matrix[edge][2] = float(adj_list[node][i][1])
                    edge = edge+1
        floyd_warshall(nodes, matrix)
elif algo == 6: 
    pass  
else:
    print("Option Not Valid")