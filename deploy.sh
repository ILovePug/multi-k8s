#build all the docker images
#add two tags. 1. 'latest' for auto apply latest version for dev. 2. '$SHA' for production so k8s can detect new version and reapply image
docker build -t qianweng/multi-client:latest -t qianweng/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t qianweng/multi-server:latest -t qianweng/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t qianweng/multi-worker:latest -t qianweng/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push qianweng/multi-client:latest
docker push qianweng/multi-client:$SHA
docker push qianweng/multi-server:latest
docker push qianweng/multi-server:$SHA
docker push qianweng/multi-worker:latest
docker push qianweng/multi-worker:$SHA

#apply all the config file and auto ignore all unchanged file
kubectl apply -f k8s
kubectl set image deployments/client-deployment server=qianweng/multi-client:$SHA
kubectl set image deployments/worker-deployment server=qianweng/multi-worker:$SHA
kubectl set image deployments/server-deployment server=qianweng/multi-server:$SHA