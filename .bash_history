apt update && apt upgrade -y && apt dist-upgrade -y
apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg2 net-tools
hostnamectl set-hostname $(curl -s http://169.254.169.254/latest/meta-data/local-hostname)
apt install -y docker.io
cat << EOF > /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

systemctl stop docker
systemctl start docker
systemctl enable docker
cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

sysctl --system
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
apt update
apt install kubelet="1.22.17-00" 
apt install kubeadm="1.22.17-00"
apt install kubectl="1.22.17-00"
cat << EOF > /etc/kubernetes/aws.yaml
---
apiVersion: kubeadm.k8s.io/v1beta3
kind: ClusterConfiguration
kubernetesVersion: v1.22.17
networking:
  serviceSubnet: "10.100.0.0/16"
  podSubnet: "10.244.0.0/16"
apiServer:
  extraArgs:
    cloud-provider: "aws"
controllerManager:
  extraArgs:
    cloud-provider: "aws"
EOF

kubeadm init --config /etc/kubernetes/aws.yaml
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://docs.projectcalico.org/manifests/calico-typha.yaml
kubectl get nodes
kubectl get pods
kubectl get nodes
kubectl get pods -A
kubectl get nodes
kubeclt get nodes
kubectl get nodes
kubectl get pods -A
kubectl get pods -A -owide
kubectl get pods -n kube-system
kubectl get ns
vi myfirstpod.yaml
ls
kubectl create -f myfirstpod.yaml 
kubectl get pods
kubectl get pods -A
kubectl get pods -A -owide
kubectl get pods -owide
kubectl get nodes
curl -v 10.244.51.129:8080
kubectl delete pod tomcat-jenkins
cat myfirstpod.yaml 
history
kubectl get nodes
kubectl get pods -A
docker images
exit
ls
kubectl get pods
kubectl get nodes
cd /etc/kubernetes/
ls
vi aws.yaml 
cd manifests/
ls
vi kube-apiserver.yaml 
kubectl get nodes
ls
cat myfirstpod.yaml 
vi myfirstpod.yaml 
kubectl apply -f myfirstpod.yaml 
vi myfirstpod.yaml 
kubectl apply -f myfirstpod.yaml 
vi service.yaml
vi nodeport.yaml
vi loadbalancer.yaml
vi external.yaml
kubectl apply -f service.yaml 
kubectl get services
kubectl get pods -owide
kubectl get pods -A
kubectl get services
curl -v 10.100.189.102
kubectl delete serivce kubernetes
kubectl delete kubernetes
kubectl delete service tomcat-nginx
kubectl get pods
kubectl delete tomcat-jenkins
kubectl delete pods tomcat-jenkins
kubectl get service
kubectl get endpoints
kubectl apply -f myfirstpod.yaml 
kubectl get pods --show-labels
kubectl get endpoints
kubectl apply -f nodeport.yaml 
kubectl get svc
kubectl apply -f loadbalancer.yaml 
kubectl get service
kubectl delete service tomcat-nodeport
kubectl get service
kubectl delete service tomcat-nginx
kubectl get service
kubectl get nodes
kubectl get pods
ls
cat service.yaml 
vi replicaset.yaml
cat myfirstpod.yaml 
vi replicaset.yaml 
kubectl get pods
kubectl delete pods tomcat-jenkins
kubectl apply -f replicaset.yaml 
vi replicaset.yaml 
kubectl apply -f replicaset.yaml 
kubectl get pods
vi replicaset.yaml 
kubectl apply -f replicaset.yaml 
kubectl get pods
kubectl get replicaset
vi replicaset.yaml 
kubectl apply -f replicaset.yaml 
kubectl get replicaset
kubectl get pods
kubectl get pods tomcat-fpmm8 -oyaml
kubectl get pods tocmat-fpmm8 -oyaml
kubectl get replicaset -oyaml
kubectl get pods
kubectl get endpoints
kubectl delete pods tocmat-fpmm8
kubectl get pods
kubectl get pods tocmat-dnv6w -oyaml
cp replicaset.yaml deployment.yaml
vi deployment.yaml 
kubectl get services
kubectl apply -f loadbalancer.yaml 
kubectl get services
vi deployment.yaml 
kubectl get deployments
kubectl get deployment
kubectl get replicaset
cat myfirstpod.yaml 
kubectl get service
kubectl get service tomcat-nginx -oyaml
exit
kubectl get nodes
kubectl get pods -A
vi namespace.yaml
kubectl apply -f namespace.yaml 
kubectl get pods -A
kubectl get pods -n devdarshan
kubectl apply -f namespace.yaml --namespace=devdarshan
kubectl get pods -n devdarshan
kubectl apply -f myfirstpod.yaml --namespace=devdarshan
kubectl get pods -n devdarshan
kubectl delete pods tomcat-jenkins -n devdarshan
kubectl get pods -n devdarshan
vi myfirstpod.yaml 
kubectl apply -f myfirstpod.yaml 
vi myfirstpod.yaml 
kubectl apply -f myfirstpod.yaml 
kubectl get pods
kubectl get pods -n devdarshan
kubectl delete pods tomcat-jenkins -n devdarshan
kubectl get pods -n devdarshan
kubectl get ns
kubectl describe devdarshan
kubectl describe kube-system
kubectl describe ns devdarshan
vi resourcequota.yaml
kubectl apply -f myfirstpod.yaml
kubectl get ns
kubectl describe ns devdarshan
kubectl apply -f namespace.yaml 
kubectl apply -f resourcequota.yaml 
kubectl describe ns devdarshan
cp resourcequota.yaml podlimit.yaml
vi podlimit.yaml 
vi deployment.yaml 
vi podlimit.yaml 
ls
kubectl get ns
kubectl get pods -A
kubectl get replicaset
kubectl get deployment
kubectl delete replicaset tomcat
kubectl delete pods --all
kubectl get pods -A
kubectl get service
history
kubectl get replicaset
vi replicaset.yaml 
kubectl get deployment
kubectl get pods -A
kubectl get replicaset
kubectl apply -f deployment.yaml 
kubectl get deployment
kubectl get pods -A
kubectl get deployment
kubectl delete deployment tocmat
kubectl get replicaset
kubectl delete replicaset tocmat
vi replicaset.yaml 
vi deployment.yaml 
kubectl get pods
kubectl get pods -A
kubectl get ns
kubectl get pods -n devdarshan
kubectl get pods -n devdarshan -owide
curl -v 10.244.51.142:80
curl -v 10.244.51.142:8080
kubectl get pods -n devdarshan
kubectl delete pods tomcat-jenkins -n devdarshan
kubectl get pods -n devdarshan
kubectl get pods -A
ls
vi loadbalancer.yaml 
vi myfirstpod.yaml 
vi namespace.yaml 
vi deployment.yaml 
cat deployment.yaml 
vi deployment.yaml 
cat deployment.yaml 
ls
vi podlimit.yaml 
vi resourcequota.yaml 
kubectl apply -f resourcequota.yaml 
kubectl get resoucequota memory-cpu-quota
kubectl get pods
kubectl get pods -A
kubectl apply -f myfirstpod.yaml 
kubectl get pods
kubectl get pods -A
ls
kubectl get resource
kubectl get resourcequota
kubectl delete resourcequota
vi resourcequota.yaml 
kubectl get resoucequota memory-cpu-quota
vi resourcequota.yaml 
kubectl apply -f myfirstpod.yaml 
vi myfirstpod.yaml 
kubectl get ns
kubectl describe ns devdarshan
vi myfirstpod.yaml 
kubectl delete ns devdarshan
kubectle create ns devdarshan
kubectl create ns devdarshan
kubectl describe ns devdarshan
kubectl get pods -n devdarshan
kubectl get pods
kubectlet pods -A
kubectl get pods -A
ls
kubectl apply -f myfirstpod.yaml 
kubectl get pods -n devdarshan
kubectl apply -f resourcequota.yaml 
kubectl get pods -n devdarshan
kubectl describe -n devdarshan
kubectl describe ns devdarshan
vi deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -n devdarshan
kubectl get ns -n devdarshan
kubectl get deployment -n devdarshan
cat deployment.yaml 
kubectl get quota -n devdarshan
kubectl get pods -n devdarshan
kubectl get replicaset -n devdarshan
kubectl describe replicaset tomcat-5b47dc8d67-kv4s4 -n devdarshan
kubectl get replicaset
kubectl apply -f replicaset.yaml 
kubectl get pods -n devdarshan
kubectl get replicaset -n devdarshan
kubectl get quota -n devdarshan
kubectl describe ns devdarshan
vi podlimit.yaml 
kubectl apply -f podlimit.yaml 
kubectl get resourequota -n devdarshan
kubectl get resoucequota -n devdarshan
kubectl get resourcequota -n devdarshan
kubectl get pods -n devdarshan
kubectl delete deployment tomcat -n devdarshan
kubectl get pods -n devdarshan
kubectl delete pod tomcat-jenkins
kubectl delete pod tomcat-jenkins -n devdarshan
kubectl get pods -n devdarshan
kubectl apply -f deployment.yaml 
kubectl get pods -n devdarshan
kubectl describe replicaset tomcat-5b47dc8d67 -n devdarshan
kubectl get resourcequota -n devdarshan
vi resourcequota.yaml 
kubectl delete resourcequota memory-cpu-quota -n devdarshan
kubectl delete deployment tomcat -n devdarshan
kubectl apply -f deployment.yaml 
kubectl get pods -n devdarshan
kubectl describe replicaset tomcat-5b47dc8d67 -n devdarshan
ls
vi limitrange.yaml
kubectl apply -f limitrange.yaml 
kubectl get limitrange -n devdarshan
kubectl describe ns devdarshan
kubectl get nodes
kubectl taint node ip-10-0-0-144.ap-northeast-1.compute.internal colour=red:NoSchedule
kubectl get pods
kubectl delete deployment tomcat
kubectl delete deployment tomcat -n devdarshan
kubectl get pods
kubectl delete pods --all
kubectl get pods
kubectl delete replicaset tomcat
kubectl get pods
kubectl apply -f deployment.yaml 
kubectl get pods -n -owide
kubectl get pods -owide
kubectl get pods -owide -n devdarshan
vi deployment.yaml 
kubectl delete -f deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n devdarshan
kubectl describe node ip-10-0-0-144.ap-northeast-1.compute.internal
kubectl describe node ip-10-0-0-200.ap-northeast-1.compute.internal
kubectl get pods -n devdarshan
kubectl describe pods tomcat-6554fff5b5-7nj8d -n devdarshan
kubectl taint node ip-10-0-0-144.ap-northeast-1.compute.internal colour=red:NoSchedule--
kubectl taint node ip-10-0-0-144.ap-northeast-1.compute.internal colour=red:NoSchedule-
kubectl get nodes
vi deployment.yaml 
kubectl delete -f deployment.yaml 
kubectl label node ip-10-0-0-144.ap-northeast-1.compute.internal size=large
vi deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n devdarshan
kubectl delete -f deployment.yaml 
vi deployment.yaml 
kubectl get nodes
kubectl label node ip-10-0-0-200.ap-northeast-1.compute.internal size=small
kubectl delete -f deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n devdarshan
vi deployment.yaml 
kubectl delete -f deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n devdarshan
kubectl delete -f deployment.yaml 
vi deployment.yaml 
ls
kubectl get nodes
kubectl describe ns devdarshan
kubectl delete -f limitrange.yaml 
kubectl delete -f resourcequota.yaml 
kubectl delete -f resourcequota.yaml -n devdarshan
kubectl delete -f podlimit.yaml 
kubectl get pods
kubectl get pods -n devdarshan
kubectl get pods -A
vi deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n devdarshan
kubectl destroy -f deployment.yaml 
kubectl delete -f deployment.yaml 
kubectl get pods -owide -n devdarshan
vi deployment.yaml 
kubectl apply -f deployment.yaml 
vi deployment.yaml 
kubectl delete -f deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n devdarshan
kubectl delete -f deployment.yaml 
ls
vi deployment.yaml 
vi limitrange.yaml 
vi myfirstpod.yaml 
vi nodeport.yaml 
vi replicaset.yaml 
vi service.yaml 
vi external.yaml 
vi loadbalancer.yaml 
vi namespace.yaml 
vi podlimit.yaml 
vi resourcequota.yaml 
logout
ls
cp deployment.yaml podaffinity.yaml
vi podaffinity.yaml 
kubectl delete -f deployment.yaml 
vi podaffinity.yaml 
kubectl apply -f podaffinity.yaml 
kubectl get pods
kubectl get pods -owide -n devdarshan
vi podaffinity.yaml 
kubectl delete -f podaffinity.yaml 
kubectl apply -f podaffinity.yaml 
kubectl get pods -owide -n devdarshan
vi podaffinity.yaml 
kubectl delete -f podaffinity.yaml 
cp podaffinity.yaml daemonset.yaml
vi daemonset.yaml 
kubectl apply -f daemonset.yaml 
kubectl get pods -owide -n devdarshan
vi daemonset.yaml 
kubectl delete -f daemonset.yaml 
vi myfirstpod.yaml 
kubectl apply -f myfirstpod.yaml 
kubectl describe tomcat-jenkins
kubectl get pods
kubectl get pods -n dev
kubectl get pods -n devdarshan
kubectl describe tomcat-jenkins -n devdarshan
kubectl describe pods tomcat-jenkins -n devdarshan
vi myfirstpod.yaml 
kubectl apply -f myfirstpod.yaml 
kubectl delete -f myfirstpod.yaml 
kubectl apply -f myfirstpod.yaml 
kubectl describe pods tomcat-jenkins -n devdarshan
vi myfirstpod.yaml 
kubectl delete -f myfirstpod.yaml 
kubectl apply -f myfirstpod.yaml 
kubectl describe pods tomcat-jenkins -n devdarshan
kubectl delete -f myfirstpod.yaml 
kubectl get pods -n devdarshan
kubectl apply -f myfirstpod.yaml 
kubectl get pods -n devdarshan
kubectl describe pods tomcat-jenkins -n devdarshan
kubectl delete -f myfirstpod.yaml 
vi myfirstpod.yaml 
kubectl delete -f myfirstpod.yaml 
kubectl get nodes --show-labels
logout
ls
clear
kubectl get nodes --show-labels
vi myfirstpod.yaml 
kubectl apply -f myfirstpod.yaml 
kubectl get nodes
kubectl get pods
kubectl get pods -owide
kubectl get pods -owide -n devdarshan
kubectl describe pods tomcat-jenkins
vi myfirstpod.yaml 
kubectl apply -f myfirstpod.yaml 
kubectl delete -f myfirstpod.yaml 
kubectl apply -f myfirstpod.yaml 
kubectl describe pods tomcat-jenkins
kubectl delete -f myfirstpod.yaml 
vi myfirstpod.yaml 
kubectl apply -f myfirstpod.yaml 
kubectl describe pods tomcat-jenkins -n devdarshan
vi myfirstpod.yaml 
kubectl delete -f myfirstpod.yaml 
kubectl get nodes
cat /etc/kubernetes/
cd /etc/kubernetes/
ls
cd
kubectl get nodes --show-labels
vi myfirstpod.yaml 
cp myfirstpod.yaml mysecondpod.yaml
vi my
rm -rf my
vi mysecondpod.yaml 
kubectl apply -f mysecondpod.yaml 
kubectl get pods
kubectl get pods -owide
kubectl delete -f mysecondpod.yaml 
kubectl get pods -owide
vi mysecondpod.yaml 
kubectl apply -f mysecondpod.yaml 
kubectl get pods -owide
kubect delele -f deployment.yaml 
kubectl delele -f deployment.yaml 
kubectl delete -f deployment.yaml 
vi deployment.yaml 
kubectl apply -f deployment.yaml 
kubect get pods -n devdarshan
kubectl get pods -n devdarshan
vi deployment.yaml 
kubectl delete -f deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -n devdarshan
vi deployment.yaml 
kubectl get pods -n devdarshan
kubectl get nodes
vi deployment.yaml 
kubectl delete -f deployment.yaml 
kubectl get nodes
kubectl get pods -n devdarshan
vi deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -n devdarshan
kubectl exec -it jenkins-5484866f5d-rdbw8 -n devdarshan --
kubectl exec -it jenkins-5484866f5d-rdbw8 -n devdarshan -- /bin/sh
vi deployment.yaml 
kubectl delete -f deployment.yaml 
vi configmap.yaml
kubectl apply -f configmap.yaml 
kubectl get pods
kubectl get configmap
vi pod-config.yaml
kubectl apply -f pod-config.yaml 
kubectl exec -it configmap-demo-pod -- /bin/sh
ls
ls
mkdir jenkins
chmod -R 777 jenkins/
vi mysecondpod.yaml 
kubectl get pods
kubectl delete -f mysecondpod.yaml 
kubectl apply -f mysecondpod.yaml 
kubectl get pods -owide
kubectl delete -f mysecondpod.yaml 
vi mysecondpod.yaml 
kubectl apply -f mysecondpod.yaml 
kubectl get pods -owide
kubectl get nodes --show-labels
vi mysecondpod.yaml 
kubectl get pods -owide
kubectl delete -f mysecondpod.yaml 
vi mysecondpod.yaml 
kubectl apply -f mysecondpod.yaml 
kubectl get pods -owide
vi mysecondpod.yaml 
ls
cd jenkins/
ls
cd
rm -rf jenkins/
vi deployment.yaml 
kubectl delete -f mysecondpod.yaml 
kubectl apply -f deployment.yaml 
vi deployment.yaml 
vi mysecondpod.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods
kubectl get pods -n devdarshan
kubectl exec -it jenkins-665648dd94-c7wbk -- /bin/sh
kubectl exec -it jenkins-665648dd94-c7wbk -- /bin/sh -n devdarshan
kubectl exec -it jenkins-665648dd94-c7wbk -n devdarshan -- /bin/sh 
ls
vi configmap.yaml 
kubectl exec -it jenkins-665648dd94-c7wbk -n devdarshan -- /bin/sh 
kubectl get configmap
kubectl get pods
kubectl exec -it configmap-demo-pod -- /bin/sh
ls
kubectl get nodes
kubectl get pods -n devdarshan
kubectl apply -f mysecondpod.yaml 
kubectl get pods -n devdarshan
kubectl get pods
kubectl get cm
kubectl apply -f pod-config.yaml 
kubectl get cm
kubectl get configmap game-demo -oyaml
vi secret.yaml
kubectl apply -f secret.yaml 
kubectl get secrets
kubectl get secrets mysecret -oyaml
echo "MWYyZDFlMmU2N2Rm" 
echo "MWYyZDFlMmU2N2Rm" | base 64 --decode
echo "MWYyZDFlMmU2N2Rm" | base64 --dec
echo "YWRtaW4=" | base64 --decode
echo "darshan" | base64
vi secret.yaml 
kubectl create secret generic db-user-pass     --from-literal=username=admin     --from-literal=password='S!B\*d$zDsb='
kubectl get secret
kubectl get secret db-user-pass -oyaml
vi username.txt
vi admin.conf
kubectl create secret generic myfile --from-file=./username.txt --from-file=./admin.conf
kubectl get secret myfile -oyaml
echo "VGhpcyBpcyBhIGNvbmZpZyBmaWxlCg==" | base64 --decode
echo "RGFyc2hhbgpNYWRodXN1ZGhhbgpTdXNobWl0aGEKQW5qaW5hbW1hCg==" | base64 --decode
vi secret-test-pod.yaml
kubectl apply -f secret-test-pod.yaml 
kubectl exec -it secret-test-pod -- /bin/sh
ls
grep jenkins *
vi mysecondpod.yaml 
vi deployment.yaml 
exit
ls
vi deployment.yaml 
kubectl get deployment
kubectl get deployment -n devdarshan
kubectl apply -f deployment.yaml 
kubectl get pods
kubectl get pods -n devdarshan
vi deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -n devdarshan
cd /var/
ls
cd
kubectl get pods -n devdarshan -owide
kubectl exec -it jenkins-595594d978-vxm9g -n devdarshan -- /bin/sh
vi deployment.yaml 
kubectl delete -f deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -n devdarshan -owide
kubectl delete -f deployment.yaml 
vi deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -n devdarshan -owide
vi deployment.yaml 
ls
cd /root/k8efs
vi mysecondpod.yaml 
kubectl delete -f mysecondpod.yaml 
kubectl get nodes --show-label
kubectl get nodes --show-labels
kubectl apply -f mysecondpod.yaml 
vi mysecondpod.yaml 
kubectl apply -f mysecondpod.yaml 
kubectl delete -f mysecondpod.yaml 
kubectl apply -f mysecondpod.yaml 
kubectl get pods -owide
kubectl delete -f mysecondpod.yaml 
kubectl apply -f mysecondpod.yaml 
kubectl get pods -owide
vi mysecondpod.yaml 
kubectl delete -f mysecondpod.yaml 
kubectl apply -f mysecondpod.yaml 
kubectl get pods -owide
cat mysecondpod.yaml 
kubectl delete -f mysecondpod.yaml 
vi deployment.yaml 
clear
cat deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -n devdarshan
ls
history
vi secret.yaml 
vi secret-test-pod.yaml 
kubectl get pods -n devdarshan
ls
vi deployment.yaml 
kubectl delete -f deployment.yaml 
kubectl get pods -n devdarshan
kubectl apply -f deployment.yaml 
kubectl get pods -n devdarshan
kubectl delete -f deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -n devdarshan
kubectl delete -f deployment.yaml 
kubectl get pods -n devdarshan
kubectl apply -f deployment.yaml 
kubectl get pods -n devdarshan
kubectl delete -f deployment.yaml 
kubectl get pods
kubectl get nodes
ls
vi deployment.yaml 
kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.14"
kubectl get pods 
kubectl get pods -A
vi static-pv.yaml
kubectl apply -f static-pv.yaml 
vi static-pv.yaml
kubectl get pv
kubectl delete -f static-pv.yaml 
vi static-pv.yaml
kubectl apply -f static-pv.yaml 
kubectl get pv
ls
vi configmap.yaml 
vi pod-config.yaml 
kubectl delete pv static-test-pv
kubectl get pv
kubectl get pods
vi static-pv.yaml 
kubectl apply -f static-pv.yaml 
kubectl get pv
kubectl delete -f static-pv.yaml 
vi static-pv.yaml 
kubectl apply -f static-pv.yaml 
kubectl get pv
vi static-pvc.yaml
kubectl delete -f static-pv.yaml 
vi static-pv.yaml 
vi storageclass.yaml
kubectl apply -f storageclass.yaml 
kubectl get storageclass
vi static-pv.yaml 
kubectl delete -f static-pv.yaml 
kubectl apply -f static-pv.yaml 
kubectl get pv
vi storageclass.yaml 
kubectl get storageclass
kubectl apply -f storageclass.yaml 
kubectl delete -f storageclass.yaml 
kubectl apply -f storageclass.yaml 
kubectl apply -f static-pv.yaml 
kubectl delete -f static-pv.yaml 
kubectl get pv
kubectl get pods
kubectl get storageclass
kubectl get nodes
kubectl get pods -n devdarshan
kubectl get nodes
ls
kubectl get pods
kubectl get nodes
kubectl get pods
ls
vi static-pv.yaml 
kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.14"
kubectl get pods
kubectl get pods -A
vi static-pv.yaml 
kubectl apply -f static-pv.yaml 
kubectl get pv
vi static-pvc.yaml
kubectl apply -f static-pvc.yaml 
kubectl get pvc
vi static-pod.yaml
kubectl apply -f static-pod.yaml 
kubectl get pods
kubectl delete -f static-pod.yaml 
kubectl get pods
kubectl delete -f static-pvc.yaml 
kubectl delete -f static-pv.yaml 
kubectl get pv
kubectl get pvc
kubectl get pods
ls
vi storageclass.yaml 
kubectl get storageclass
vi storageclass.yaml 
vi dynamicstorageclass.yaml
kubectl apply -f dynamicstorageclass.yaml 
kubectl get storageclass
vi dynamic-pvc.yaml
vi dynamic-pod.yaml
kubectl apply -f dynamic-pod.yaml 
kubectl get pods
kubectl delete -f dynamic-pod.yaml 
vi dynamic-pvc.yaml 
kubectl apply -f dynamic-pvc.yaml 
kubectl get pvc
kubectl delete -f dynamic-pvc.yaml 
kubectl get storageclass
kubectl delete storageclass ebs-sc
kubectl apply -f dynamicstorageclass.yaml 
kubectl get storageclass
vi static-pv.yaml 
kubectl apply -f static-pv.yaml 
kubectl get pv
kubectl delete -f static-pv.yaml 
clear
kubectl get storageclass
vi dynamic-pvc.yaml
kubectl apply -f dynamic-pvc.yaml 
kubectl get pvc
vi dynamic-pvc.yaml 
kubectl apply -f dynamic-pvc.yaml 
kubectl get pvc
kubectl delete -f dynamic-pvc.yaml 
kubectl get pvc
vi dynamic-pvc.yaml 
kubectl get pv
kubectl apply -f dynamic-pvc.yaml 
kubectl get pvc
kubectl apply -f dynamic-pod.yaml 
kubectl get pods
kubectl get pv
kubectl delete pod --al
kubectl delete pod --all
kubectl get pv
clear
kubectl get storageclass
kubectl get pvc
kubectl get pods
kubectl apply -f dynamic-pod.yaml 
kubectl get pods
kubectl delete pods app
kubectl delete -f dynamic-pvc.yaml 
clear
exit
clear
kubectl get pods
clear
kubectl get pods -owide
kubectl get pods
kubectl get sc
vi statefulset.yaml
kubectl apply -f statefulset.yaml 
kubectl get pods
kubectl get svc
kubectl get pvc
kubectl run -i --tty --image busybox:1.28 dns-test --restart=Never --rm
kubectl delete -f statefulset.yaml 
kubectl get pods
clear
exit
ls
clear
vi liveliness.yaml
kubectl apply -f liveliness.yaml 
kubectl get pods
kubectl descripe pod liveness-exec
kubectl describe pod liveness-exec
kubectl get pods
kubectl describe pod liveness-exec
kubectl delete -f liveliness.yaml 
kubectl get pods
kubectl apply -f liveliness.yaml 
kubectl get pods
kubectl describe pod liveness-exec
kubectl delete -f liveliness.yaml 
kubectl get pods
exit
kubectl get nodes
clear
kubectl get pods
ls
vi myfirstpod.yaml 
kubectl apply -f myfirstpod.yaml 
kubectl get pods -owide
kubectl get pods -n devdarshan -owide
vi deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods
kubectl get pods -n devdarshan
kubectl get pods -n devdarshan -owide
kubectl delete -f deployment.yaml 
kubectl delete -f myfirstpod.yaml 
exit
ls
kubectl get pods
kubectl get nodes
clear
kubectl apply -f liveliness.yaml 
kubectl get pods
kubectl describe pod liveness-exec
kubectl get pods
kubectl describe pod liveness-exec
kubectl get pods
kubectl delete -f liveliness.yaml 
cp liveliness.yaml readiness.yaml
vi readiness.yaml 
kubectl apply -f readiness.yaml 
kubectl get pods
kubectl delete -f readiness.yaml 
vi readiness.yaml 
kubectl apply -f readiness.yaml 
kubectl get pods
kubectl delete -f readiness.yaml 
clear
kubectl apply -f readiness.yaml 
kubectl get pods
kubectl describe pod readiness-exec
kubectl get pods
kubectl delete -f readiness.yaml 
vi readiness.yaml 
clear
vi readiness.yaml 
kubectl apply -f readiness.yaml 
kubectl get pods
kubectl describe pod readiness-exec
kubectl get pods
kubectl delete -f readiness.yaml 
exit
clear
ls
vi service.yaml 
vi myfirstpod.yaml 
kubectl get ep
exit
clear
cat /root/.docker/config.json
cat /root/.docker/config.json | base64
clear
kubectl get pods
kubectl get nodes
apt install aws-cli
snap install aws-cli
clear
apt install aws cli
apt install aws
apt install awscli
aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 889165067927.dkr.ecr.ap-northeast-1.amazonaws.com
cat /root/.docker/config.json.
cat /root/.docker/config.json
docker login -u ddarshi97 -p DevOps@979
docker login -u ddarshi97 -p devOps@979
docker login -u ddarshi97 -p Devops@979
aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 889165067927.dkr.ecr.ap-northeast-1.amazonaws.com
cat /root/.docker/config.json
docker pull  ddarshi97/tomcat:1.2
docker images
docker tag ddarshi97/tomcat:1.2 889165067927.dkr.ecr.ap-northeast-1.amazonaws.com/tomcat:1.2
docker push 889165067927.dkr.ecr.ap-northeast-1.amazonaws.com/tomcat:1.2
docker images
docker push 889165067927.dkr.ecr.ap-northeast-1.amazonaws.com/tomcat:1.2
vi secretacces.yaml
vi secretacces.yaml 
kubectl apply -f secretacces.yaml 
vi privateimagepod.yaml
vi myfirstpod.yaml 
vi nodeport.yaml 
vi privateimagepod.yaml
vi nodeport.yaml 
vi privateimagepod.yaml
kubectl apply -f privateimagepod.yaml 
kubectl get pods
kubectl describe pod private-reg
kubectl get svc
cat privateimagepod.yaml 
vi privateimagepod.yaml 
kubectl get pods
kubectl get pods -owide
kubectl get svc
exit
clear
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.5.1/deploy/static/provider/aws/deploy.yaml
kubectl get pods
kubectl get all -n ingress-nginx
kubectl get svc
kubectl get svc -n ingress-nginx
kubectl get all -n ingress-nginx
kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.5.1/deploy/static/provider/aws/deploy.yaml
clear
kubectl get nodes
kubectl get pods
kubectl delete -f privateimagepod.yaml 
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.5.1/deploy/static/provider/aws/deploy.yaml
kubectl get all -n ingress-nginx
ls
vi privateimagepod.yaml 
cp privateimagepod.yaml tomcatpod.yaml
vi tomcatpod.yaml 
kubectl get secrets
kubectl create -f tomcatpod.yaml 
vi tomcat-ingress.yaml
kubectl delete -f tomcatpod.yaml 
vi tomcatpod.yaml 
kubectl apply -f tomcatpod.yaml 
vi tomcat-ingress.yaml
kubectl apply -f tomcat-ingress.yaml 
kubectl get ingress
vi jenkinspod.yaml
kubectl apply -f jenkinspod.yaml 
kubectl get svc
curl -v 10.100.146.34:8080/jenkins/
vi jenkins-ingress.yaml
clear
ls
vi jenkins-ingress.yaml
kubectl apply -f jenkins-ingress.yaml 
clear
kubectl get pods
kubectl get svc
kubectl get ingress
kubectl delete -f jenkins-ingress.yaml 
kubectl delete -f jenkinspod.yaml 
clear
vi jenkinspod.yaml 
kubectl get pods
clear
kubectl apply jenkinspod.yaml 
clear
kubectl apply -f jenkinspod.yaml 
kubectl get pods
kubectl apply -f jenkins-ingress.yaml 
kubectl get svc
kubectl get ingress
kubectl get ep
ls
vi deployment.yaml 
kubectl delete -f jenkins-ingress.yaml 
kubectl delete -f jenkinspod.yaml 
vi jenkinspod.yaml 
vi deployment.yaml 
vi jenkinspod.yaml 
kubectl apply -f jenkinspod.yaml 
kubectl apply -f jenkins-ingress.yaml 
kubectl get ingress
clear
kubectl get pods
kubectl get svc
curl -v 10.100.81.252:8080/jenkins/
kubectl get ingress
kubectl get ep
kubectl delete -f jenkins-ingress.yaml
kubectl delete -f tomcat-ingress.yaml
kubectl delete -f jenkinspod.yaml 
kubectl delete -f tomcatpod.yaml 
exit
ls
vi tomcatpod.yaml 
clear
exit
clear
ls
vi tomcatpod.yaml 
vi tomcat-ingress.yaml 
exit
