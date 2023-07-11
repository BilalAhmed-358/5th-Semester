#19k-0278,19k-0323
import kruskal
import prims
import djisktra
import bellman_ford
import floyd
import cluster
import boruvka
f = input('Enter filename: ')
print('1. Prims')
print('2. Kruskals')
print('3. Djisktra')
print('4. Bellman_Ford')
print('5. Floyd')
print('6. Cluster')
print('7. Boruvka')
x = input('Enter a number for algorithm: ')
x=int(x)
if(x==1):
    prims.Prims()
elif(x==2):
    kruskal.Kruskals()
elif(x==3):
    djisktra.Djisktra()
elif(x == 4):
    bellman_ford.Bellman_Ford()
elif(x==5):
    floyd.Floyd()
elif(x == 6):
    cluster.Cluster()
elif(x==7):
    boruvka.Boruvka()



