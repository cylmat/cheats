### const

const { appTheme } = useTheme()!;

### interface

```
interface IMeteoBlueProps {
   showLogo?: boolean;
   currentContract?: Contract;
}

MeteoBlue = (props: IMeteoBlueProps) => {}
```

### loop

for(let key of keys)  
for(let key in localStorage)

### misc

{enabled: !!currentContract}

### params

(props: IMeteoBlueProps & typeof defaultProps)  
MeteoBlueService.getWeather(currentContract?.id ?? "");

### promise

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

### storage

sessionStorage.setItem('test', 1);  
localStorage.getItem('test')  
localStorage.user = {name: "John"};  
let user = JSON.parse( localStorage.user );  

### type

type OrganizationData = { id: string, actions: JSX.Element }  
