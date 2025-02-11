# Enable Cloud SQL Admin API
gcloud services enable sqladmin.googleapis.com

# YOUR_SECURE_PASSWORD
# Deploy Cloud Run with Cloud SQL Connection
gcloud run deploy eventnostalgia-web-app-for-event-tracking \
  --image=gcr.io/massive-glyph-448906-q3/eventnostalgia-app \
  --platform=managed \
  --region=us-central1 \ 
  --add-cloudsql-instances=massive-glyph-448906-q3:us-central1:event-db \
  --set-env-vars DB_HOST="/cloudsql/massive-glyph-448906-q3:us-central1:event-db" \
  --set-env-vars DB_NAME="project" \
  --set-env-vars DB_USER="Git" \
  --set-env-vars DB_PASS="YOUR_SECURE_PASSWORD" \
  --cpu=1 \
  --memory=512Mi \
  --timeout=300s \
  --port=8080 \
  --allow-unauthenticated


#