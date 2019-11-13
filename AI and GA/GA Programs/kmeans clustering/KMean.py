import numpy as np
class KMean:
    def __init__(self):
        self.Location=None
        self.Data=None
        self.TotalData=None
        self.Attributes=None
        self.Lower=None
        self.Upper=None
        self.Centroid=None
        self.Cluster=None
        self.Similarity=0.0
        self.Dissimilarity=0.0
        self.TotalCluster=0
    def readData(self,Location,TotalCluster):
        self.TotalCluster=TotalCluster
        with open(Location,'r') as f:
            lines=f.read().split("\n")
        self.TotalData=int((lines[0].split(","))[0])
        self.Attributes=int((lines[0].split(","))[1])
        self.Data=np.zeros((self.TotalData,self.Attributes),dtype=float)
        for i in range(self.TotalData):
            row=lines[i+1].split(",")
            for j in range(self.Attributes):
                self.Data[i][j]=float(row[j])
        self.Lower=np.amin(self.Data,axis=0)
        self.Upper=np.amax(self.Data,axis=0)
        
    def manhattanDistance(self,v1,v2):
        return np.sum(abs(v1-v2)) 
    
    def createCentroid(self):
        self.Centroid=np.zeros((self.TotalCluster,self.Attributes),dtype=float)
        for i in range(self.TotalCluster):
            self.Centroid[i]=(np.random.rand()*(self.Upper-self.Lower))+self.Lower
            
    def updateCentroid(self):
        for i in range(len(self.Cluster)):
            array=self.getIndexFromCluster(self.Cluster[i])
            for j in range(self.Attributes):
                tempSum=0.0
                for element in array:
                    tempSum+=self.Data[element][j]
                self.Centroid[i][j]=tempSum/np.sum(self.Cluster[i])
    
    def getIndexFromCluster(self,array):
        return np.array([index for index in range(len(array)) if array[index]==1])
    
    def createCluster(self):
    #Cluster=TotalCluster*[[None]]
        self.Similarity=0.0
        self.Dissimilarity=0.0
        self.Cluster=np.zeros((self.TotalCluster,self.TotalData),dtype=int)
        for i in range(self.TotalData):
            min_distance=self.manhattanDistance(self.Data[i],self.Centroid[0])
            max_distance=min_distance
            index=0
            for j in range(self.TotalCluster):
                distance=self.manhattanDistance(self.Data[i],self.Centroid[j])
                if distance<min_distance:
                    min_distance=distance
                    index=j
                if distance>max_distance:
                    max_distance=distance

            self.Similarity+=min_distance
            self.Dissimilarity+=max_distance
            self.Cluster[index][i]=1
    
    def displayCluster(self):
        i=0
        for array in self.Cluster:
            i+=1
            print("\nCluster {} \tElements: {}".format(i,np.sum(array)))
            print([index for index in range(len(array)) if array[index]==1])  
    
            
    def displayData(self):
        print("\n================Data============\n")
        print(self.Data)
        
    def displayCentroid(self):
        print("\n================Centroids============\n")
        print(self.Centroid)
    
    def manhattanDistance(self,v1,v2):
        return np.sum(abs(v1-v2))
    
    def train(self,iterations,error_margin):
        self.createCentroid()
        self.createCluster()
        self.displayData()
        self.displayCentroid()
        self.displayCluster()
        temp_similarity=self.Similarity
        print("\nSimilarity: {}\tDissimilarity: {}".format(self.Similarity,self.Dissimilarity))
        for i in range(iterations):
            self.updateCentroid()
            self.createCluster()
            print("\nSimilarity: {}\tDissimilarity: {}".format(self.Similarity,self.Dissimilarity))
            if(temp_similarity-self.Similarity)<error_margin :
                break
            temp_similarity=self.Similarity
        self.displayCentroid()
        self.displayCluster()
                
  
        

if __name__=="__main__":

    location=input("Enter the location of dataset: ")
    
    numberOfClusters=input("Enter the number of clusters: ")

    iterations=input("Enter the number of iterations: ")
    
    error_margin=input("Enter the error margin: ")

    k=KMean()
    k.readData(location,int(numberOfClusters))
    k.train(int(iterations),float(error_margin))
