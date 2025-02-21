#!/bin/bash

aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/v7m3y0a5

docker build -t e-we-link-addon ./eWeLink_Smart_Home

docker tag e-we-link-addon:latest public.ecr.aws/v7m3y0a5/e-we-link-addon:latest

docker push public.ecr.aws/v7m3y0a5/e-we-link-addon:latest

#docker run -d \
#  --restart=unless-stopped \
#  -p 3000:3000 \
#  -e HA_URL=http://192.168.8.27:8123 \
#  -e SUPERVISOR_TOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI2NTM3Mzc5YTQyY2I0MjI2ODZlNzZmOTA1OGJhZjJkOSIsImlhdCI6MTczNDI5MjA2MSwiZXhwIjoyMDQ5NjUyMDYxfQ.qaJ7GEIk0blzxOtL2LVbAa7UGlyobESVUzn7FUN9m14\
#  -v ./volume:/data \
#  --name ewelink_smart_home \
#  e-we-link-addon