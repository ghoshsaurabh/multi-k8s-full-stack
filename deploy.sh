docker build -t ghoshsaurabh/multi-client:latest -t ghoshsaurabh/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t ghoshsaurabh/multi-server:latest -t ghoshsaurabh/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t ghoshsaurabh/multi-worker:latest -t ghoshsaurabh/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push ghoshsaurabh/mult-client:latest
docker push ghoshsaurabh/mult-server:latest
docker push ghoshsaurabh/mult-worker:latest

docker push ghoshsaurabh/mult-client:$SHA
docker push ghoshsaurabh/mult-server:$SHA
docker push ghoshsaurabh/mult-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/client-deployment client=ghoshsaurabh/multi-client:$SHA
kubectl set image deployments/server-deployment server=ghoshsaurabh/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=ghoshsaurabh/multi-worker:$SHA


