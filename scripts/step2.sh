#1.create a project and export it into a variable(project creation- manual)
export PROJECT_ID="mvp-liveability-230180"   
#2.Sets the project,location &dataset
gcloud config set project ${PROJECT_ID}
export LOCATION="australia-southeast1"
export BQ_DATASET="liveability"
export Git_Root="https://github.com/jannetment360-1/tf-exp"
#3.Create the service account with same proj name and export it to a variable which can be used in later stages    
#gcloud iam service-accounts create ${PROJECT_ID} \
#	 --description="Service account for the Liveability project" \
#	  --display-name="Liveability Service Account"    
export SERVICE_ACCOUNT_ID=${PROJECT_ID}
#9.Create a datset in bq
#bq --location=${LOCATION} mk \
#	 --dataset ${BQ_DATASET} 
#10.Clone the data and schema from git to cloud shell
#git clone ${Git_Root}
#11. Copy the files to cloud storage
gsutil cp ../tf-exp/data/* gs://${PROJECT_ID}/data/batch_data/
gsutil cp ../tf-exp/ddl/* gs://${PROJECT_ID}/ddl/
