#1.create a project and export it into a variable(project creation- manual)
export PROJECT_ID="mvp-liveability-230179"
      
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
#6.Enable all the APIs
# dataflow 
gcloud services enable dataflow.googleapis.com
#firestore
gcloud services enable firestore.googleapis.com
#appengine for firestore
gcloud services enable appengine.googleapis.com
#cloud sql
gcloud services enable sqladmin.googleapis.com
#datastream
gcloud services enable datastream.googleapis.com
#pubsubapi
gcloud services enable pubsub.googleapis.com
#cloudbuild
gcloud services enable cloudbuild.googleapis.com
gcloud services enable compute.googleapis.com
gcloud services enable iam.googleapis.com
#7.Create fire store DB for schema to be used in dataflow
gcloud app create --region=${LOCATION}
gcloud firestore databases create --region=${LOCATION}
#8.Generates a GCS bucket with the project id.
gsutil mb -l ${LOCATION} gs://${PROJECT_ID}
