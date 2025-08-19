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

## Best practices

- https://fireart.studio/blog/9-react-best-practices-to-improve-your-react-code/
- https://www.uxpin.com/studio/blog/react-best-practices/
- https://www.developerway.com/posts/react-re-renders-guide

- https://www.freecodecamp.org/news/best-practices-for-react/
- https://technostacks.com/blog/react-best-practices/
- https://medium.com/front-end-weekly/top-react-best-practices-in-2025-a06cb92def81

Info
- https://nextjs.org/docs/app/building-your-application/data-fetching/fetching

### CAREFUL

```
USE COMPONENTS COMPOSITIONS
Separation of concerns : https://tkdodo.eu/blog/component-composition-is-great-btw
React selector must be: https://en.wikipedia.org/wiki/Pure_function
```

**packages.json**
https://docs.npmjs.com/cli/v6/configuring-npm/package-json#local-paths  
```
"dependencies": {
    "@myenv/widget": "link:..",
    "@testing-library/jest-dom": "link:../node_modules/@testing-library/jest-dom",
    "my_dependendy": "file:../../my_dir",
```

### CSS

```
<img  style={{width:"100px"} as CSSProperties} alt="fs" src="png-image_4013555.jpg" />
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

### Display

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

### Effects

@https://react.dev/reference/react/useDebugValue
```
 useEffect(() => {
    // ..
  }, [serverUrl, roomId]);
  // -> will run after each change of serverUrl and roomId value
 
# effect clean

useEffect(() => {
  // Avoid: Cleanup logic without corresponding setup logic
  return () => {
    doSomethingCleaning();
  };
}, []);

useEffect(() => {
    const connection = createConnection(serverUrl, roomId);
    connection.connect();
    return () => {
      connection.disconnect();
    };
  }, [serverUrl, roomId]);
 
  @https://gist.github.com/markselby9/59640ec27eba6c7a585c6aa71c6522ce
```

### Event

```
// stop event (draggable, other.) on mouse click e.stopPropagation()
<i
	onClick={() => setDisplayFilters(!displayFilters)}
	onMouseDown={(e) => e.stopPropagation()}
	onMouseUp={(e) => e.preventDefault()}
></i>
```

### Full page sample with Fragment

```
export const BlockRelatedElements: React.FC = ({}) => {
    return (<React.Fragment>aez</React.Fragment>);
}

const displayRelatedElement = (): ReactNode => {
  return (  <--------- "(" allow to insert javascript into JSX..
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

### Loading comp

```
type Props = PropsWithChildren<{
  isLoading: boolean;
}>;

const LoadingWrapper = ({ children, isLoading }: Props): JSX.Element => {
  if (isLoading) {
    return <div>Loading...</div>;
  }

  return <>{children}</>;
};
```

### Local install

utiliser un widget comme dépendance en local
```
# docker-compose.yml
  my_app:
    volumes:
      - 'path_to_your_project/mywidget:/home/node/app/mywidget'
      - 'node_modules:/home/node/app/mywidget/node_modules/'
  volumes:
    node_modules:

# packages.json
   dependencies:
      "@package/mywidget": "link:mywidget"
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

### re-render object

useState to re-render with same objects : stringify or spread it
```
    const [externalsServices, setExternalsServices] = useState({})
    let formData: any = externalsServices
       
    setExternalsServices([...formData])
    setExternalsServices([...Object.values(filters)])

    const json = JSON.stringify(filters);
    const filters = JSON.parse(json);
    setExternalsServices(filters  )
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

### STATE
@https://react-redux.js.org/using-react-redux/connect-mapstate

```
# mapstatetoprops
const mapStateToProps = (
   state: { 
      contract: { currentContract: Contract },
      user: { info: User }
   }
) => ({
    currentContract: state.contract.currentContract,
    loggedUser: state.user.info
});
export default connect(mapStateToProps)(HomePage);

# use it:
    public static async getLogged(state: {user: UserState }) {
        let user = state.user.info
}
```

### SVG

```
 // SVG WITH PROPS
import React from 'react'

const SvgDot: React.FunctionComponent<
    React.SVGProps<SVGSVGElement> & { title?: string }
> = ({ title, ...props }) => (
    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="13" viewBox="0 0 12 13" fill="none">
        <circle cx="6" cy="6.5" r="6" fill={props.color} />
    </svg>
);

export default SvgDot
```

--- -----------------------------------------------------------------------------
## TIPS & ERRORS --------------
--- ----------------------------------------------------------------------------

### unmounted error

@https://medium.com/doctolib/react-stop-checking-if-your-component-is-mounted-3bb2568a4934
https://legacy.reactjs.org/blog/2015/12/16/ismounted-antipattern.html@
```
const useIsMounted = () => {
  const isMounted = useRef(true)
  
  useEffect(
    () => () => {
      isMounted.current = false
    },
    []
  )
  
  return isMounted
}

const MyComponent = () => {
  const isMounted = useIsMounted()
  const [state, setState] = useState()
  
  someAsyncOperation().then(data => {
    if (isMounted.current) setState(data)
  })
}
```

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

### use dispatch outside of component

@https://medium.com/@sirwacheski/how-to-access-react-state-values-outside-of-a-component-a43e01bcfda0

-> shared reducer
```
// Shared reducer state //
export const sharedReducersState = {
    "request": initialState
}
// Use useSharedSelector to share data between React Component and not-component fonctions
export function useSharedSelector(selector: (state: any) => any) {
    return selector(sharedReducersState)
}

const requestReducers = (state = initialState, action: any): any => {
    switch (action.type) {
        case Constants.SET_STEP:
            sharedReducersState.request = {...state, step: action.payload}
```

### Debug with "use previous"

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
