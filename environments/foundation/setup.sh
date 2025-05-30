#https://cloud.google.com/docs/terraform/resource-management/managing-infrastructure-as-code
#Execute in cloud shell: https://console.cloud.google.com/?cloudshell=true
gcloud config get-value project
#Your active configuration is: [cloudshell-24927]
#cs-host-5806e9d2ba9f40968cdc3f

ORGANIZATION_ID="38372291649"
PROJECT_ID=$(gcloud config get-value project)
BUCKET_TFSTATE=cs-tfstate-us-central1-e21376bb9dc94283b9b4b3d0b8dee742

gcloud services enable cloudbuild.googleapis.com compute.googleapis.com

git config --global user.email "mulloymorrow@gmail.com"
git config --global user.name "Mulloy Morrow"
#Fork https://github.com/GoogleCloudPlatform/solutions-terraform-cloudbuild-gitops.git to connectioncompanion/solutions-terraform-cloudbuild-gitops.git
cd ~
git clone https://github.com/connectioncompanion/solutions-terraform-cloudbuild-gitops.git
cd ~/solutions-terraform-cloudbuild-gitops


gcloud storage buckets create gs://${BUCKET_TFSTATE}
gcloud storage buckets update gs://${BUCKET_TFSTATE} --versioning

CLOUDBUILD_SA="$(gcloud projects describe $PROJECT_ID \
    --format 'value(projectNumber)')@cloudbuild.gserviceaccount.com"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member serviceAccount:$CLOUDBUILD_SA --role roles/editor

USER_CB_SA="gcp-cloud-setup@cs-host-5806e9d2ba9f40968cdc3f.iam.gserviceaccount.com"
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member serviceAccount:$USER_CB_SA --role roles/editor


export ROLES=(
  "roles/billing.projectManager"
  "roles/billing.user"
  "roles/compute.xpnAdmin"
  "roles/config.agent"
  "roles/logging.configWriter"
  "roles/orgpolicy.policyAdmin"
  "roles/resourcemanager.folderIamAdmin"
  "roles/resourcemanager.folderCreator"
  "roles/resourcemanager.folderEditor"
  "roles/resourcemanager.projectIamAdmin"
  "roles/resourcemanager.projectCreator"
  "roles/resourcemanager.projectDeleter"
  "roles/serviceusage.serviceUsageConsumer"
  "roles/secretmanager.secretAccessor"
  "roles/iam.serviceAccountUser"
  "roles/storage.objectUser"
  "roles/storage.objectAdmin"
  "roles/iam.workloadIdentityUser"
)

for ROLE in ${ROLES[@]}
do
  echo ${ROLE}
  gcloud organizations add-iam-policy-binding ${ORGANIZATION_ID} \
  --member="serviceAccount:${USER_CB_SA}" \
  --role=${ROLE}
done


for ROLE in ${ROLES[@]}
do
  echo ${ROLE}
  gcloud projects add-iam-policy-binding ${PROJECT_ID} \
  --member="serviceAccount:${USER_CB_SA}" \
  --role=${ROLE}
done