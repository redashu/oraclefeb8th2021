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



