# K8s final day 

## deployment in k8s 

<img src="dep.png">

## reality of Deployment 

<img src="real.png">


# Best practise we always use deployment 

## creating deployment 

```
 kubectl create deployment  ashudep1 --image=dockerashu/ows:v002  --dry-run=client -o yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: ashudep1
  name: ashudep1
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ashudep1
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: ashudep1
    spec:
      containers:
      - image: dockerashu/ows:v002
        name: ows
        resources: {}
status: {}
❯ kubectl create deployment  ashudep1 --image=dockerashu/ows:v002  --dry-run=client -o yaml  >ashudep1.yaml

```

## COpy final new changes 

```
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: ashudep1
  name: ashudep1 # name of deployment 
  namespace: ashu-space 
spec:
  replicas: 1 # no of pod 
  selector:
    matchLabels:
      app: ashudep1
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: ashudep1
    spec:
      containers:
      - image: dockerashu/ows:v002
        name: ows
        env: # a speicfig app  
        - name: x
          value: app2 
        resources: {}
status: {}


```


## NEw example of web app 

### app v1 

```
docker build -t  dockerashu/owsfinal:v001  https://github.com/redashu/oracletest.git\#main
Sending build context to Docker daemon  650.8kB
Step 1/7 : FROM oraclelinux:8.3
8.3: Pulling from library/oraclelinux
230d257ffbc9: Extracting [==================================>                ]  56.82MB/81.79MB

```

## deploying app in k8s cluster 

```
❯ kubectl  apply -f myapp.yml -n ashu-space
deployment.apps/helloashu created
❯ kubectl  get  deploy
NAME        READY   UP-TO-DATE   AVAILABLE   AGE
helloashu   1/1     1            1           11s
❯ 
❯ kubectl  get  rs
NAME                   DESIRED   CURRENT   READY   AGE
helloashu-795866dff9   1         1         1       16s
❯ 
❯ kubectl  get  po
NAME                         READY   STATUS    RESTARTS   AGE
helloashu-795866dff9-xqrwk   1/1     Running   0          20s

```

## creating service 

```
kubectl  expose deployment helloashu  --type NodePort  --port 1234 --target-port 80 --name ashusvc123
service/ashusvc123 exposed
❯ kubectl get svc
NAME         TYPE       CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
ashusvc123   NodePort   10.102.158.104   <none>        1234:31394/TCP   8s



```
## scaling pod

```
❯ kubectl scale deployment helloashu --replicas=3
deployment.apps/helloashu scaled
❯ kubectl  get  po
NAME                         READY   STATUS    RESTARTS   AGE
helloashu-795866dff9-pzl6t   1/1     Running   0          4s
helloashu-795866dff9-t56l2   1/1     Running   0          4s
helloashu-795866dff9-xqrwk   1/1     Running   0          4m28s

```

## UPdating application 

### checking revsion number 

```
 kubectl describe  deploy helloashu
Name:                   helloashu
Namespace:              ashu-space
CreationTimestamp:      Fri, 12 Feb 2021 23:30:18 +0530
Labels:                 app=helloashu
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=helloashu

```

## updating image in existing deployment 

```
kubectl  set  image  deployment helloashu owsfinal=dockerashu/owsfinal:v002
```

## rolling back 

```
❯ kubectl rollout undo  deployment helloashu
deployment.apps/helloashu rolled back

```
