# Bastion (Discord moderation bot) [![build bastion](https://github.com/Rxflex/some-shs/actions/workflows/bastion.yml/badge.svg)](https://github.com/Rxflex/some-shs/actions/workflows/bastion.yml) <br>Currently supports: amd64, arm64, arm/v7
<div align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://bastion.traction.one/images/branding-logotype-light.png">
    <source media="(prefers-color-scheme: light)" srcset="https://bastion.traction.one/images/branding-logotype-dark.png">
    <a title="Bastion" href="https://bastion.traction.one">
      <img alt="Bastion Logotype" src="https://bastion.traction.one/images/branding-logotype-light.png">
    </a>
  </picture>
</div>
Original github - https://github.com/TheBastionBot/Bastion<br>
Docker image - https://hub.docker.com/r/darkyghost/bastion-docker

### ENV for image:

```
BASTION_API_AUTH=
BASTION_API_PORT=8377
BASTION_MUSIC_ACTIVITY=true
BASTION_RELAY_DMS=false
STARTUP_CMD=npm start
TESSERACT_BOT_ID=...
TESSERACT_BOT_TOKEN=...
TESSERACT_MONGO_URI=mongodb+srv://...
TESSERACT_UNSAFE_MODE=false
```

### To run this image, run command: <br>
```
docker run -d -t -i -e BASTION_API_AUTH='' \ 
-e BASTION_API_PORT=8377 \
-e BASTION_MUSIC_ACTIVITY=true \
-e BASTION_RELAY_DMS=false \
-e STARTUP_CMD='npm start' \
-e TESSERACT_BOT_ID='...' \
-e TESSERACT_BOT_TOKEN='...' \
-e TESSERACT_MONGO_URI='mongodb+srv://...' \
-e TESSERACT_UNSAFE_MODE=false \
--name bastion darkyghost/bastion-docker:latest
```
