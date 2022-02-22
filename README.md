# HPA (Horizontel Pod AutoScaler) Demo with SpringBoot with K8s

### Pre requisite installation

* Java 11
* maven
* kubernetes docker for desktop/minikube

### Tech
* Java 11
* Springboot
* Spring-Data-Jpa
* Spring-Boot-Actuator
* Lombok
* Maven
* kubernetes
* Docker


### Build

 mvn clean install

```
Build docker image 

docker build -t spring-microservice-autoscale-deployment:v3 . 
```

### Run

1. Deploy the k8s resources by following command 
<b>kubectl create -f k8s/ </b>

    ![img.png](images/initial_deployment.png)

2. check the k8s pod,service, deployment and hpa deployed in previous step 
<b>kubectl get po,svc,deployment,hpa </b>
![img.png](images/display_resources.png)

3. Check the pod status <b>kubectl get po</b> 
![img.png](images/pod_creation.png)

4. check the HPA status and observe the Targets column for resource consumption <b>kubectl get hpa</b>
![img.png](images/hpa.png)

5. Wait for pod scale down to 1 (i.e, Min Replica Config)


6. Perform the Load Test . Run the below command in the separate command line window

```
while true; do curl http://localhost:8080/retrieve; done
```

7. Run below command to check HPA status in separate window, observe Target column to see increase in the CPU consumptions
   <b>kubectl get hpa -w</b>

   ![img.png](images/hpa2.png)
   
8. Check the Kuberentes events to understand scaling up and down events in background <b> kubectl get events </b>

   ![img.png](images/kube_events.png)

9. terminate the load testing

10. Wait for sometime and verify change in HPA and Kubernetes events to scaling down the pod to minimum replica count , since CPU consumption is low

11. clean up resources <b>kubectl delete -f k8s/

## K8s Commands used

* kubectl create -f k8s/
* kubectl get po,svc,deployment,hpa
* kubectl get po
* kubectl get hpa -w
* kubectl get events
* kubectl describe deploy spring-microservice-autoscale-deployment
