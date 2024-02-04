### DOCKER
docker build --pull --rm -f ".\Dockerfile" -t name:latest "zeus-portail-api" \
  --build-arg="ARG=VAL" --target base --build-context context=".\"

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
