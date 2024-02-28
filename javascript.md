### ASYNC

```
import axios from 'axios';
const API = `${process.env.API_URL}`;
export const client = axios.create({ baseURL: API });

export const seedUsers = async ({  
  dbUrl = "mongodb://root:root@0.0.0.0:27018/",  
} = {}) => {}

```

### Const & Types

```
const filterDisplayedTabs = (tabsDisplayed: string[]) => {}
const { appTheme } = useTheme()! ;

const API_URL = `${process.env.API_URL}`;  
export const API_ENDPOINTS = {  
  LOGIN: `${API_URL}users/login`,  
};

const videoNames = response.data.map((video) => video.filename);
const API_URL = `${process.env.API_URL}`;

type OrganizationData = { id: string, actions: JSX.Element }   

const data: DataType[] = [
  {
    key: "1",
  },
]
```

### DOTENV

```
import dotenv from 'dotenv';
dotenv.config();
// https://vitejs.dev/config/
export default defineConfig(({ command, mode }) => {
  const env = loadEnv(mode, process.cwd(), '');
  return {}
})
```

### Interface

```
interface IMeteoBlueProps {
   showLogo?: boolean;
   currentContract?: Contract;
}

MeteoBlue = (props: IMeteoBlueProps) => {}
```

### Loop

for(let key of keys)  
for(let key in localStorage)

### Misc

{enabled: !!currentContract}

### Params

```
(props: IMeteoBlueProps & typeof defaultProps)  
MeteoBlueService.getWeather(currentContract?.id ?? "");
```

### Promise

```
fetchUserDisplayedWidgets().then((res) => { console.log(res) })

fetchPromise
   .then((response) => {
      if (!response.ok) {
         throw new Error(`HTTP error: ${response.status}`);
      }
      return response.json();
   })
   .then((data) => {
      console.log(data[0].name);
   })
   .catch((error) => {
      console.error(`Could not get products: ${error}`);
   });
```

### Storage

sessionStorage.setItem('test', 1);  
localStorage.getItem('test')  
localStorage.user = {name: "John"};  
let user = JSON.parse( localStorage.user );  


