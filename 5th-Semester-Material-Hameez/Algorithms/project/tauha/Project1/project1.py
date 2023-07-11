import networkx as nx
import numpy as np
import matplotlib.pyplot as plt
from networkx.algorithms import tree
from pprint import pprint

choice = int(input("1.Prims\n2.Kruskal\n3.Boruvkas\n4.Dijkstras\n5.Bellman Ford\n6.Floyd Warshall\n7.Coefficient Clustering\n\nSELECT ONE: "))
if choice == 1 or choice == 2 or choice == 3 or choice == 7:
    G = nx.Graph()
else:
    G = nx.DiGraph()    


nodes=[]
x=[]
y=[]
fr=[]
to=[]
band=[]

def getVals(filename1, filename2):
    data = np.loadtxt(fname= filename1, delimiter = ',')  #nodes and their coordinates!!
    for i in range(len(data)):
        for j in range(3):
            if j == 0:
               nodes.append(data[i][j])
            elif j == 1:
               x.append(data[i][j])
            else:
               y.append(data[i][j])
    
    data = np.loadtxt(fname= filename2, delimiter = ',')  #nodes and their coordinates!!
    for i in range(len(data)):
        for j in range(3):
            if j == 0:
                fr.append(data[i][j])
            elif j == 1:
                to.append(data[i][j])
            else:
                band.append(data[i][j])    


num = int(input("Enter No of Nodes from 10 to 100: "))
if num == 10:
    getVals('input10_nodes.txt', 'input10_edges.txt')
elif num == 20:
    getVals('input20_nodes.txt', 'input20_edges.txt')
elif num == 30:
    getVals('input30_nodes.txt', 'input30_edges.txt')
elif num == 40:
    getVals('input40_nodes.txt', 'input40_edges.txt')
elif num == 50:
    getVals('input50_nodes.txt', 'input50_edges.txt')
elif num == 60:
    getVals('input60_nodes.txt', 'input60_edges.txt')
elif num == 70:
    getVals('input70_nodes.txt', 'input70_edges.txt')
elif num == 80:
    getVals('input80_nodes.txt', 'input80_edges.txt')
elif num == 90:
    getVals('input90_nodes.txt', 'input90_edges.txt')
elif num == 100:
    getVals('input100_nodes.txt', 'input100_edges.txt')
else:
    print("Enter Correct Option!!")   
    

for i in range(len(nodes)):
    n=nodes[i]
    G.add_node(n, pos = (x[i], y[i]))    #nodes and their coordinates ENNDDDD!!

for i in range(len(fr)):
    G.add_edge(fr[i], to[i], weight=band[i])  

weight = nx.get_edge_attributes(G,'weight')
pos = nx.get_node_attributes(G, 'pos')
nx.draw_networkx_edge_labels(G,pos,edge_labels=weight, horizontalalignment='center', bbox=dict(alpha=0), font_color='red', font_weight='heavy')
nx.draw(G,pos,with_labels=1,font_color='yellow')
plt.show()   

if choice == 1:
    #nx.draw_networkx_edge_labels(G,pos,edge_labels=w)

    cost = 0.0
    # """#mst = tree.minimum_spanning_edges(G, algorithm='kruskal', data=True)
    mst = tree.minimum_spanning_edges(G, algorithm='prim',keys=True, data=True) 
    mst=list(mst)
    G.remove_edges_from(list(G.edges()))

    i=0
    while i < len(mst):
        G.add_edge(mst[i][0],mst[i][1],weight=mst[i][2].get("weight"))
        cost=cost+mst[i][2].get("weight")
        i = i + 1
    print(cost)
    w=nx.get_edge_attributes(G,'weight')
    p = nx.get_node_attributes(G, 'pos')
    nx.draw_networkx_edge_labels(G,p,edge_labels=w, horizontalalignment='center', bbox=dict(alpha=0), font_color='red', font_weight='heavy')
    nx.draw(G,p,with_labels=True,font_color='yellow')
    plt.show
elif choice == 2:
    cost = 0.0
    mst = tree.minimum_spanning_edges(G, algorithm='kruskal',keys=True, data=True)   
    mst=list(mst)
    G.remove_edges_from(list(G.edges()))
    i=0
    while i < len(mst):
        G.add_edge(mst[i][0],mst[i][1],weight=mst[i][2].get("weight"))
        cost=cost+mst[i][2].get("weight")
        i = i + 1
    print(cost)
    w=nx.get_edge_attributes(G,'weight')
    p = nx.get_node_attributes(G, 'pos')
    nx.draw_networkx_edge_labels(G,p,edge_labels=w, horizontalalignment='center', bbox=dict(alpha=0), font_color='red', font_weight='heavy')
    nx.draw(G,p,with_labels=True,font_color='yellow')
    plt.show
elif choice == 3:
    cost = 0.0
    mst = tree.minimum_spanning_edges(G, algorithm='boruvka',keys=True, data=True)   
    mst=list(mst)
    G.remove_edges_from(list(G.edges()))

    i=0
    while i < len(mst):
        G.add_edge(mst[i][0],mst[i][1],weight=mst[i][2].get("weight"))
        cost=cost+mst[i][2].get("weight")
        i = i + 1
    print(cost)
    w=nx.get_edge_attributes(G,'weight')
    p = nx.get_node_attributes(G, 'pos')
    nx.draw_networkx_edge_labels(G,p,edge_labels=w, horizontalalignment='center', bbox=dict(alpha=0), font_color='red', font_weight='heavy')
    nx.draw(G,p,with_labels=True,font_color='yellow')
    plt.show
elif choice == 4:
    s = int(4)
    tar = int(8)
    p = nx.shortest_path(G, source = s, target = tar, weight = 'weight', method = 'dijkstra')
    length = nx.shortest_path_length(G, source = s, target = tar, weight = 'weight', method = 'dijkstra')
    print(p)
    print(length)
elif choice == 5:
    s=5
    pred, dist = nx.bellman_ford_predecessor_and_distance(G,s)
    pred = (sorted(dist.items()))
    G.remove_edges_from(list(G.edges()))
    cost = 0
    i = 0
    while i < (len(pred) - 1):
        cost = cost + pred[i][1]
        G.add_edge(i, i + 1, weight = pred[i][1])
        i = i + 1
    w = nx.get_edge_attributes(G,'weight')
    nx.draw(G,pos,with_labels=True)
    nx.draw_networkx_edge_labels(G,pos,edge_labels=w)
    print(cost)
elif choice == 6:
    fw = nx.floyd_warshall(G, weight='weight')

    results = {a:dict(b) for a,b in fw.items()}  
    pprint(results)  
elif choice == 7:
    num=nx.average_clustering(G)
    print(num) 
else:
    print("Incorrect option!!");                                








