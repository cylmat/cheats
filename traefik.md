
@https://doc.traefik.io/traefik/getting-started/quick-start  
@http://localhost:8080/api/rawdata  

```
    container_name: traefik
    # The official v2.8 Traefik docker image
    image: traefik:v2.7
    # Enables the web UI and tells Traefik to listen to docker
    command:
      --api.insecure=true
      --providers.docker
    #      --entrypoints.websecure.address=:443
    ports:
      # The HTTP port
      - "80:80"
      # The Web UI (enabled by --api.insecure=true)
      - "8080:8080"
    volumes:
      # So that Traefik can listen to the Docker events
      - /var/run/docker.sock:/var/run/docker.sock

-> on services
    labels:
      - "traefik.http.routers.front.rule=Host(`host.test`)"
```
