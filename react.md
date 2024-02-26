### COMPONENT

```
ReactDOM.createRoot(document.getElementById('root') as HTMLElement).render()
const videoNames = response.data.map((video) => video.filename);
```

### Declare
  
- composant fonctionnel:  
  const App = ({ message }: AppProps) => <div>{message}</div>  
  
- composant fonctionnel par React ( vérification du type et l'autocomplétion ):  
  const App: React.FC<{ message: string }> = ({ message }): JSX.Element => (  
    <div>{message}</div>  
  )  

### MODULES

```
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

export declare const SearchBar: FC<SearchBarprops>;

export interface NoteInterface extends Document {
  title: string;
  description: string;
}

export const client = axios.create({ baseURL: API });
export const API_ENDPOINTS = {
LOGIN: `${API_URL}users/login`,
};
```

// sample-ex.d.ts
export interface ICategoryType {id: string;}
export interface IMetadatas {[key: string]: string;}

#-- Imports

// sample-im.tsx
import {ICategoryType, IMetadatas} from '@module/widget/dist';

```
import React, { useEffect, useState } from 'react';
import { useQuery, useQueryClient } from "react-query";
import { useHistory } from "react-router";
const history = useHistory();
import { useLocation } from "react-router-dom";
import { useTranslation } from "react-i18next";
import { connect } from "react-redux";
import { Modal } from "@env/react-theme-components";

ReactDOM.createRoot(document.getElementById('root') as HTMLElement).render()
```

### Misc

```
<div {...ModulesStyle} style={{ backgroundColor: theme.darkTheme ? "#342525" : "#ffffff" }}>  
  {isLoading && <div className='p-4 text-center'>  
    <Component/>  
    </div>  
  }
```
  
### Query

const { data, isError, isLoading, isSuccess } = useQuery(['organizations', my.id, queryFilter, currentPage], fetchData);

### STYLE

```
<div {...ModulesStyle} style={{ backgroundColor: theme.darkTheme ? "#342525" : "#ffffff" }}>
```

### tips ----------------

### Render error

```
setState() change l'état de l'app et déclenche l'appel render(). -> infinite loop

1. Updating the state inside the render
function App() {
  const [count, setCount] = useState(0);
  setCount(1); // infinite loop
}
-> fix:
  useEffect(() => { setCount(1); }, [])

2. In useEffect with update dependency
  useEffect(() => {
    setCount(count + 1) // infinite loop
  }, [count])
  -> fix: use functional update
  useEffect(() => {
    setCount(previousCount => previousCount + 1)
  }, [])

3. Event handler
<button onClick={() => setCount(1)}>
```
