# GCP Kubernetes with Terraform

I wrote a blog entry describing what this sample repository is for and how to deploy Kubernetes with it [here](http://blog.adron.me/articles/terraform-kubernetes-gcp/).
"# CICDonKubernetes" 
1. Create a Namespace for Jenkins. So that we will have an isolation for the CI/CD environment.


kubectl create ns jenkinsslaves
2.kubectl create -f jenkins-deployment_auto.yaml --namespace=jenkinsslaves
3. kubectl  describe deployments --namespace=jenkinsslaves
Create A Jenkins Service
We have created a deployment. However is not accessible to the outside world. For accessing the Jenkins container from outside world, we should create a service and map it to the deployment.

Create a jenkins-service_auto.yaml file with the following contents.

kubectl create -f jenkins-service_auto.yaml --namespace=jenkinsslaves

5. Enabling the Jenkins Slaves
With the Kubernetes plugin installed it must be configured by navigating to Manage Jenkins > Configure System and scrolling to the Cloud section. First, we configure the Kubernetes Section as below:

- Click “Add New Cloud” on drop-down button and select “kubernetes” option.

To obtain the Kubernetes URL you should invoke:
kubectl cluster-info | grep master
Kubernetes master is running at 

To obtain the Jenkins URL, first, need to obtain the full pod name of the Jenkins master

$ kubectl get pods --namespace jenkins | grep ^jenkins


kubectl describe pod jenkins-85bb8dcc5-d4lgv --namespace jenkins | grep IP:
With these configuration entries, the Jenkins Kubernetes plugin can interact with the Kubernetes API server. Next, we need to configure the pod template and container for the slave so that the plugin can provision a pod. Scroll down a bit, and click “Kubernetes pod template” option on the “Add Pod Template” drop-down.

Then click “Container Template” option in “Add Container” drop-down menu. And fill as below