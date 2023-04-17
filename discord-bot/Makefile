.PHONY: deploy
deploy:
	gcloud builds submit \
		--project chibawest-gamecenter \
		--tag gcr.io/chibawest-gamecenter/discord-bot
	gcloud run deploy chibawest-gamecenter-bot \
		--project chibawest-gamecenter \
		--region us-central1 \
		--image gcr.io/chibawest-gamecenter/discord-bot \
		--set-env-vars "IS_PRODUCTION=1" \
		--set-secrets "/etc/discord-bot-api-token/secret=discord-bot-api-token:latest" \
		--min-instances 1 \
		--max-instances 1 \
		--cpu 1 \
		--memory 512Mi \
		--no-allow-unauthenticated \
		--no-cpu-throttling \
		--service-account chibawest-gamecenter-bot@chibawest-gamecenter.iam.gserviceaccount.com
