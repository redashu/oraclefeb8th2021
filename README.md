# K8s multi node cluster using kubeadm 

## Step 1 -- hostname setup 

## step 2 IN all the Node 

```
yum  install docker  -y  ;  systemctl enable --now docker

```

## step 3  disable swap & selinux during installation time  (ALL Nodes)

## step 4. enable kernel driver for kube-proxy 

```
[root@k8s-master ~]# modprobe br_netfilter
[root@k8s-master ~]# echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables
```

## stpe 5 install kubeadm in all the nodes 

```
cat  <<EOF  >/etc/yum.repos.d/kube.repo
[kube]
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
gpgcheck=0
EOF

yum install kubeadm -y
systemctl enable --now kubelet

```

#  THis one you have to do in the machine you want to configure as Master Node 

```
[root@k8s-master ~]# kubeadm  init  --pod-network-cidr=192.168.0.0/16  --apiserver-advertise-address=0.0.0.0 --apiserver-cert-extra-sans=34.198.161.17  
[init] Using Kubernetes version: v1.20.2
[preflight] Running pre-flight checks
	[WARNING IsDockerSystemdCheck]: detected "cgroupfs" as the Docker cgroup driver. The recommended driver is "systemd". Please follow the guide at https://kubernetes.io/docs/setup/cri/
	[WARNING FileExisting-tc]: tc not found in system path
	[WARNING Hostname]: hostname "k8s-master" could not be reached
	[WARNING Hostname]: hostname "k8s-master": lookup k8s-master on 172.31.0.2:53: no such host
[preflight] Pulling images required for setting up a Kubernetes cluster
[preflight] This might take a minute or two, depending on the speed of your internet connection
[preflight] You can also perform this action in beforehand using 'kubeadm config images pull'



```
  
  
## client connect 

```
root@k8s-master ~]# cd  /etc/kubernetes/
[root@k8s-master kubernetes]# ls
admin.conf 

```


## setting env 

```
export KUBECONFIG=/Users/fire/Desktop/admin.conf

```

# POd deployment 

```
❯ kubectl get  po
NAME         READY   STATUS    RESTARTS   AGE
ashupod-2    1/1     Running   0          63s
muthupod-1   1/1     Running   0          17s
vgpod-1      1/1     Running   0          53s
❯ kubectl get  po  -o wide
NAME         READY   STATUS    RESTARTS   AGE   IP              NODE          NOMINATED NODE   READINESS GATES
ashupod-2    1/1     Running   0          69s   192.168.214.1   k8s-minion3   <none>           <none>
jlrd3pod-1   1/1     Running   0          6s    192.168.214.3   k8s-minion3   <none>           <none>
muthupod-1   1/1     Running   0          23s   192.168.54.66   k8s-minion1   <none>           <none>
vgpod-1      1/1     Running   0          59s   192.168.214.2   k8s-minion3   <none>           <none>
❯ kubectl get  po  -o wide


```
## access app using kubeconfig file 

```
❯ kubectl  port-forward   ashupod-2  1244:80
Forwarding from 127.0.0.1:1244 -> 80
Forwarding from [::1]:1244 -> 80
Handling connection for 1244
Handling connection for 1244

```
## kubeadm summary 

<img src="kubeadm.png">

## k8s networking 

<img src="net.png">

## pod ip problems 

<img src="ip.png">

## service use label of pod

<img src="service.png">

## service with LB 

<img src="lbsvc.png">

## service type 

<img src="stype.png">

# checking label 

```
❯ kubectl apply -f  ashupod1.yaml
pod/ashupod-2 configured
❯ kubec get po ashupod-2  --show-labels
zsh: command not found: kubec
❯ kubectl  get po ashupod-2  --show-labels
NAME        READY   STATUS    RESTARTS   AGE   LABELS
ashupod-2   1/1     Running   0          78m   x=helloashuapp1
❯ kubectl  get po --show-labels
NAME                             READY   STATUS              RESTARTS   AGE   LABELS
ashupod-2                        1/1     Running             0          78m   x=helloashuapp1
charles-nginx-857566c655-d9c4x   1/1     Running             0          61m   app=charles-nginx,pod-template-hash=857566c655
greg-1                           1/1     Running             0          73m   <none>
grgrpod-1                        1/1     Running             0          73m   <none>
japppod                          1/1     Running             0          76m   run=japppod
japppod1                         1/1     Running             0          47m   run=japppod1
jlrd3pod-1                       1/1     Running             0          77m   <none>

```

## NodePOrt 

<img src="nodeport.png">

## creation of service 

```
❯ kubectl  create  service nodeport  ashusvc1  --tcp 1234:80  --dry-run=client  -o yaml
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  labels:
    app: ashusvc1
  name: ashusvc1
spec:
  ports:
  - name: 1234-80
    port: 1234
    protocol: TCP
    targetPort: 80
  selector:
    app: ashusvc1
  type: NodePort
status:
  loadBalancer: {}
❯ kubectl  create  service nodeport  ashusvc1  --tcp 1234:80  --dry-run=client  -o yaml   >ashusvc1.yaml

```

## gettting service 

```

❯ kubectl  get  service
NAME          TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
ashusvc1      NodePort    10.110.6.1       <none>        1234:31202/TCP   3m28s
gcolesvc1     NodePort    10.99.39.249     <none>        1234:30650/TCP   3m39s
grgrsrv1      NodePort    10.107.104.221   <none>        1234:32425/TCP   3m5s
jappsvc       NodePort    10.108.247.161   <none>        1234:30911/TCP   3m4s
jlrd4svc1     NodePort    10.100.242.144   <none>        3345:31880/TCP   3m8s
kubernetes    ClusterIP   10.96.0.1  

```




