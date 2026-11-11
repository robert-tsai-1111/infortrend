
echo "Building docker image for comfyui benchmark with CUDA 12.8 support..."
echo "This may take a while depending on your internet speed and system performance."
echo "Please ensure you have Docker installed and running on your system."
echo "You may be prompted to log in to Docker Hub. Please enter your Docker Hub credentials when prompted."
echo "If you don't have a Docker Hub account, you can create one at https://hub.docker.com/."
echo "Once the build is complete, you can run the benchmark job using the provided Kubernetes YAML file."
echo "Thank you for using the comfyui benchmark build script. Enjoy benchmarking!"

echo "Logging in to Docker Hub..."
echo "dckr_pat_dR0AuB2DdaR6sF1466lTT_5gDdw"
docker login -u robertdocker1111

docker build --platform linux/amd64 -f Dockerfile.cuda128 -t robertdocker1111/infortrend-poc/comfyui-benchmark:cuda12.8 .

docker image list
