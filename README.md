# twas-sample-app
A simple webapp used by SVT for quick verification of app deployment using Runtime Component Operator and/or tWAS Operator

## Requirements
 * Maven - if you want to build from the source code
 
 
### Build Application
If you want to build this application from the source, please first clone this repository. And then, after modifying index.jsp source if desired:
```
mvn clean package 
```

### Build Application image
After building the application use docker command to build the application image.  

If desired, modify the file `Dockerfile` to change the websphere-traditional image that will be used to build the container.  When choosing the image to use, it could be specific to only one architecture (e.g. `FROM docker.io/ibmcom/websphere-traditional:9.0.5.4-ubi8-amd64` or it could be an image that contains multiple architectures (e.g. `FROM docker.io/ibmcom/websphere-traditional:9.0.5.4`)

Run the docker build command to build the twas-sample-app docker image.  For example the following command will build an image with name `twas-sample-app`
```
docker build --no-cache -t twas-sample-app .
```

The architecture of the host on which the `docker build` command is run determines the architecture of the application image.  If you are running the command on an x86_64 host, the image will be amd64 architecture, if run on a zLinux host then the image will be s390x architecture and if run on Power Linux the architecture of the image will be ppc64le.  The image name used in the build command could be modified to indicate the image architecture.  For example if docker build is run on x86_64 host, perhaps the command used would be `docker build --no-cache -t twas-sample-app-amd64 .`

Once the application image has been created, use `docker tag` and `docker push` commands to push the image to the desired repository in preparation for deploying to an OCP cluster using the Runtime Component Operator or the tWAS Operator

### Deploy the application
  - To deploy the application, first ensure that either the Runtime Component Operator or the tWAS Operator are installed on the OCP cluster.
  - Create namespace to deploy application to (e.g. `oc new-project twas-sample-app`)
  - Create pull secrets as needed containing the credentials for the registry where the image for the application will be pulled from.  This might require just an additional entry to the global pull secret for the cluster or if the deployment yaml contains the pullSecret parameter, perhaps a secret defined for the namespace to which the application will be deployed.
  - Modify the deploy-twassamp.yaml file to include the proper values for the deployment (e.g namespace should be the namespace that was created for this deployment, applicationImage should be the registyr location from which the application image should be pulled, etc.)  
  - Deploy the application to OCP - `oc apply -f deploy-twassamp.yaml`



# twas-samp
# twas-samp
