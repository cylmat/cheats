### DOCKER
docker build --pull --rm -f ".\Dockerfile" -t name:latest "zeus-portail-api" \
  --build-arg="ARG=VAL" --target base --build-context context=".\"

### MAKEFILE
export
.PHONY: cn.* heimdall.* api.* vdm.* front.* signal.* user-request.* init help up down reload ps logs
default: help
${MAKE} front.install

### TRAEFIK
@https://doc.traefik.io/traefik/getting-started/quick-start/
@http://localhost:8080/api/rawdata

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
      - "traefik.http.routers.front.rule=Host(`front.zeus.test`)"

### CURL
@https://curl.se/docs/manpage.html
--(X)request --(d)ata --(I)head --(H)eader -(k)insecure -(i)nc -(L)oc -(o)ut -v
curl -X GET -H Host:whoami.docker.localhost http://{127,128}.0.0.1 -c - --header "Accept: application/json"
curl -X POST -H Host:whoami.docker.localhost http://[120-128].0.0.1 --data "data=val" --stderr output.txt

### REACT

module.exports = {
  fct1,
  fct2,
};

export interface NoteInterface extends Document {
  title: string;
  description: string;
}

const {
  fct1,
  fct2,
} = require("../controllers/fct");

ReactDOM.createRoot(document.getElementById('root') as HTMLElement).render()
const videoNames = response.data.map((video) => video.filename);

export const seedUsers = async ({
  dbUrl = "mongodb://root:root@0.0.0.0:27018/",
} = {}) => {}

<div {...ModulesStyle} style={{ backgroundColor: theme.darkTheme ? "#342525" : "#ffffff" }}>

const data: DataType[] = [
  {
    key: "1",
  },
]

const API_URL = `${process.env.API_URL}`;
export const API_ENDPOINTS = {
  LOGIN: `${API_URL}users/login`,
};

import axios from 'axios';
const API = `${process.env.API_URL}`;
export const client = axios.create({ baseURL: API });

import dotenv from 'dotenv';
dotenv.config();
// https://vitejs.dev/config/
export default defineConfig(({ command, mode }) => {
  const env = loadEnv(mode, process.cwd(), '');
  return {}
})
