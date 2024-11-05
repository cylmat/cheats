carreful !!!  

```
Boolean([]); = true
[] && 1 === true
if({}) === true

(arrays are objects, objects are truthy.)
```

### Axios

```
import axios from 'axios';
const API = `${process.env.API_URL}`;
export const client = axios.create({ baseURL: API });

export const seedUsers = async ({  
  dbUrl = "mongodb://root:root@0.0.0.0:27018/",  
} = {}) => {}
```

### ASYNC

@https://fr.javascript.info
https://www.pierre-giraud.com/javascript-apprendre-coder-cours/async-await/
```
// async devant veut dire que la function renvoi une promesse .then()
async function f() {  return 1; }

// equivalent à return Promise.resolve(1);
// error
await Promise.reject(new Error("Whoops!")); }

// await promise <=> promise.then f().then(alert); // 1

// attendre 3 secondes
await new Promise((resolve, reject) => setTimeout(resolve, 3000));
async function f() { let response = await fetch('http://no-such-url'); }

// try catch
try { let response = await fetch('http://no-such-url'); } catch(err) { 
   alert(err); // TypeError: failed to fetch
}
//or
// f() devient une promesse rejetée
f().catch(alert); // TypeError: failed to fetch // (*)
```

sample
```
### js async sample

const getUserOrganizationsRequestTypes = async (): Promise<any[]> => {
            return UserReferenceRepository.getAllFromUser(user.data.id).then((response: any) => {
                let organizationIds = response.data.map((organization: OrganizationType) => organization.id)
                
                return await Promise.all(organizationIds.map(async (organizationId: string) => {
                    const response = await RequestTypeReferenceRepository.getAll(organizationId);
                    return response.data.map((reference: RequestTypeReference) => reference.requestType);
                }));
            });
        }

}

// Equivalence
 return RequestTypeReferenceRepository.getAll(organizationId).then((response: any) => {
                        return response.data.map((reference: RequestTypeReference) => reference.requestType)
                    })
=>
const response = await RequestTypeReferenceRepository.getAll(organizationId);
                    return response.data.map((reference: RequestTypeReference) => reference.requestType);

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

### clone

```
string concat:
      setCoordinates(`${lat}, ${lng}`);
      
- cloning object SHALLOW (one level)
//@https://www.freecodecamp.org/news/clone-an-object-in-javascript/
      -> immutable obj = {...obj2}
      
// Cloning the Object with Object.assign() Method
let cloneUser = Object.assign({}, userDetails);

- cloning object DEEP (full childs level)
let cloneUser = JSON.parse(JSON.stringify(userDetails));
```

### Date

```
let fromOneYear = new Date().setFullYear(new Date().getFullYear() - 1);  
startDate = startDate ? startDate : new Date(fromOneYear).toDateString();
```

### download

const link = document.createElement('a');
link.setAttribute('download', `${picture.fileName}.${picture.extension}`);
link.href = window.URL.createObjectURL(new Blob([response.data]));
link.target = "blank";
document.body.appendChild(link);
link.click();

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

**foreach**
https://masteringjs.io/tutorials/fundamentals/foreach-object
```
Object.entries(requestObject).forEach(([key, items]: [string, any]) => {
            if (key === 'data') {
                Object.entries(items).forEach(([dataKey, dataElement]: [string, any]) => {
                    requestWithDataAs[dataKey] = dataElement
                })
            } else {
                requestWithData[`__${key}`] = items
            }
        })
```

### NULLable !

- @https://blog.logrocket.com/understanding-exclamation-mark-typescript/  
console.log(word.toLowerCase()) // Error: Object is possibly 'null'.ts(2531)  
console.log(word!.toLowerCase())  

### Misc

{enabled: !!currentContract}

### Params

```
(props: IMeteoProps & typeof defaultProps)  
MeteoService.getWeather(currentContract?.id ?? "");
const { appTheme } = useTheme()!;
type OrganizationData = { id: string, actions: JSX.Element }
{enabled: !!currentContract}
```
### sleep

```
function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

Or as a one-liner:
await new Promise(r => setTimeout(r, 2000));
As a function:
const sleep = ms => new Promise(r => setTimeout(r, ms));
or in Typescript:
const sleep = (ms: number) => new Promise((r) => setTimeout(r, ms));
use it as:
await sleep(<duration>);
```

### sort and date

```
requests.sort(function(a: IPceRequest, b: IPceRequest) {
    return new Date(a.createdAt).getTime() - new Date(b.createdAt).getTime()
})
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

```
sessionStorage.setItem('test', 1);  
localStorage.getItem('test')  
localStorage.user = {name: "John"};  
let user = JSON.parse( localStorage.user );  
```
