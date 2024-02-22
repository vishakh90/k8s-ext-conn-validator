# K8s Connectivity Validator
> spring boot application for validating connectivity from your Kubernetes cluster to target systems and databases.

## Build
> Note! Build will fail in test phase unless you configure DB connection parameters correctly
```sh
 mvn clean install
```

### Run (as Standalone Java application in Local)
```sh
java -jar target/k8s-ext-conn-validator-0.0.1-SNAPSHOT.jar
```

## Docker Image

### Build
```shell
docker build -t docker.io/vokdevops-utils/k8s-ext-conn-validator:latest .
```

### Push
```shell
docker push docker.io/vokdevops-utils/k8s-ext-conn-validator:latest
```

## Deploy
> Note: database password (DB_PASS), user(DB_USER) and url(DB_URL) are passed as env variables 
> in deploy/k8svalidator-deployment.yaml.

### Set the kubernetes cluster and namespace first
```shell
kubectl config use-context <context-name> 
kubectl config set-context --current --namespace=<namespace> 
```
### Deploy app
```shell
kubectl apply -f deploy/k8svalidator-deployment.yaml -n prod
```
### Delete app
```shell
kubectl delete -f deploy/k8svalidator-deployment.yaml -n prod
```

### App Logs
```shell
kubectl logs --follow deployment.apps/k8s-ext-conn-validator -n prod
```

## App Use cases
### Validate Connectivity to DB
Run a (temporary) curl bastion within the cluster to call the service.
```shell
kubectl run -i --tty --rm debug --image curlimages/curl:latest --restart=Never -- sh
```

Validate DB health by curl to healthcheck endpoint
```shell
curl k8s-ext-conn-validator-svc:80/actuator/health/db
```