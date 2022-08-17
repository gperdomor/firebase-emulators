# Firebase Emulator Suite for Docker

Docker image to run firebase emulators for use in testcontainers/CI

## Usage

The easiest way to start the emulator is to run the following command:

```bash
docker run \
  --rm \
  -p=4000:4000 \
  -p=5000:5000 \
  -p=8080:8080 \
  -p=8085:8085 \
  -p=9000:9000 \
  -p=9099:9099 \
  -p=9199:9199 \
  gperdomor/firebase-emulators:latest
```

The command above starts the container and exposes ports of all Firebase emulators.

## Exposed ports

| Port | Purpose           |
| ---- | ----------------- |
| 4000 | Emulator Suite UI |
| 5000 | Firebase Hosting  |
| 8080 | Cloud Firestore   |
| 8085 | Cloud Pub/Sub     |
| 9000 | Realtime Database |
| 9099 | Authentication    |
| 9199 | Cloud Storage     |
