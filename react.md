### Create project

```
- https://vitejs.dev
- nextjs.org / https://remix.run
- npm / yarn / https://bun.sh
- https://redux.js.org / https://recoiljs.org/fr

- React router
- react-bootstrap.netlify.app
- React Query or Tanstack Query / https://swr.vercel.app
- supabase.com (Firebase alternative)
- Prisma Orm / Drizzle
- date-fns / day.js
- React Hook Form 
- dndkit.com
- Build and deploy: vercel.com
- tailwindcss.com / ShadCN / Radix UI
- rjsf-team.github.io/react-jsonschema-form/
```

**packages**
```
"dependencies": {
    "@myenv/widget": "link:..",
    "@testing-library/jest-dom": "link:../node_modules/@testing-library/jest-dom",
```

## Full page sample with Fragment

```

export const BlockRelatedElements: React.FC = ({}) => {
    return (<React.Fragment>aez</React.Fragment>);
}

const displayRelatedElement = (): ReactNode => {
  return (
    <React.Fragment>
	<div className="work-detail-box p-3" key={'block-related'}>
	    <SzTypographie variant="h1">{trans('related.element')}</SzTypographie>
	    <div className="row p-3">
		<div className="col">
		    <SzData className="mx-3">
			<SzData.Text>{trans('related')}</SzData.Text>
			alpha
		    </SzData>
		</div>
	    </div>
	</div>
    </React.Fragment>
  );
}

export const BlockRelatedElements: React.FC<IBlock1> = ({}) => {
return (
        <React.Fragment>
          {displayRelatedElement}
	</React.Fragment>
    )
}
```

### COMPONENT

```
ReactDOM.createRoot(document.getElementById('root') as HTMLElement).render()
const videoNames = response.data.map((video) => video.filename);
```

### Declare React

```
- composant fonctionnel:  
  const App = ({ message }: AppProps) => <div>{message}</div>  
  
- composant fonctionnel par React ( vérification du type et l'autocomplétion ):  
  const App: React.FC<{ message: string }> = ({ message }): JSX.Element => (  
    <div>{message}</div>  
  )
```

#### Display

```
Variable:
<div className={`signalement-filter-form ${showForm ? "opened" : "closed"}`}>

Style:
<div {...ModulesStyle} style={{ backgroundColor: theme.darkTheme ? "#342525" : "#ffffff" }}>  
  {isLoading && <div className='p-4 text-center'>  
    <Component/>  
    </div>  
  }

Svg:
  import { ReactComponent as MySvgFile } from './file.svg'
  <MySvgFile />
```

### interface

```
interface Props {
    requestTypes: RequestTypeReference[];
    status: WorkflowStatusReference[];
    showForm?: boolean;
    onSubmit: (values: ISignalFilter) => any;
    onClose?: () => void;
}

const SignalFilterForm: React.FC<Props> = (props) => { ... }

const [searchAutoComplete, setSearchAutoComplete] = useState<IAddress[]>([]);
const [searchTerm, setSearchTerm] = useState<string>("");
```

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

```exemple
// sample-ex.d.ts
export interface ICategoryType {id: string;}
export interface IMetadatas {[key: string]: string;}

// sample-im.tsx
import {ICategoryType, IMetadatas} from '@module/widget/dist';
```

### Props

```
const FileImage: React.FC<{picture: ISignalPicture}> = ({picture}) => {}
	or
interface ISignalDataPicture { picture: ISignalPicture; }
const FileImage: React.FC<ISignalDataPicture> = ({picture}) => {}
```

### Reducer
@ref: https://react-redux.js.org/api/hooks

```
const errorReducers = (
    state = initialState,
    action: ErrorsActionTypes,
): IError => {
    switch (action.type) {
        case Constants.ERROR:
            return { isError: action.payload.isError, message: action.payload.message, status: action.payload.status };
        default:
            return state;
    }
};

function MyButton({ title }: { title: string }) {
  return (
    <button>{title}</button>
  );
}

--- sample2

import {useDispatch, useSelector} from "react-redux";
import {setStep} from "../../../store/actions/request";

export const GroupedTemplates = {
    steppers: (props: any) => {
        const currentRequest = useSelector((state: any) => state.request.currentRequest)
```

### Query & form

```
const { data, isError, isLoading, isSuccess } = useQuery(['organizations', my.id, queryFilter, currentPage], fetchData);

```

---
## tips --------------
---

- useState() reload le component lorsqu'il reçoit une valeur/objet différent.

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

### debug with "use previous"

@ npm i @simbathesailor/use-what-changed --save
```
---------> usePrevious with useEffect and useMemo debugging!!!
import React from "react";
function usePrevious(value) {
  const ref = React.useRef(value);
  React.useEffect(() => {
    ref.current = value;
  });
  return ref.current;
}
export default usePrevious;

->use

const previousC = usePrevious(c);
useEffect(() => {
  if (previousA !== a) {
    console.log(`a has changed from ${previousA} to ${a}`);
  }
```
