```
from sklearn.cluster import KMeans
from sklearn.metrics import silhouette_score
import matplotlib.pyplot as plt
SEED = 1

# ELBOW METHOD
sum_of_square_distances = []
K = range(1,11)
for num_clusters in K:
  kmeans = KMeans(n_clusters = num_clusters, random_state=SEED)
  kmeans.fit(data)
  cluster_labels = kmeans.labels_
  sum_of_squared_distances.append(kmeans.inertia_)
  
plt.plot(K,  sum_of_squared_distances, '-o')
plt.xlabel('Values of K')
plt.ylabel('Sum of Squared DIstances/Inertia')
plt.title('Elbow Method for Optimal K')
plt.show()


# SILHOUETTE
K = range(1,11)
silhouette_avg = []
for num_clusters in K:
  kmeans = KMeans(n_clusters=num_clusters, random_state=SEED)
  kmeans.fit(data)
  cluster_labels = kmeans.labels_
  silhouette_avg.append(silhouette_score(data, cluster_labels))
  
plt.plot(K, silhouette_avg, 'bx-')
plt.xlabel('Values of K')
plt.ylabel('Silhouette Score')
plt.title('Silhouette Analysis for Optimal K')
plt.show()
```
 
