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


