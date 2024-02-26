### COMPONENT

```
ReactDOM.createRoot(document.getElementById('root') as HTMLElement).render()
const videoNames = response.data.map((video) => video.filename);
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
```

### export
module.exports = {
fct1,
fct2,
};
export declare const SzSearchBar: FC<SzSearchBarprops>;
export interface NoteInterface extends Document {
title: string;
description: string;
}
export const seedUsers = async ({
dbUrl = "mongodb://root:root@0.0.0.0:27018/",
} = {}) => {}
export const client = axios.create({ baseURL: API });
export const API_ENDPOINTS = {
LOGIN: `${API_URL}users/login`,
};
### imports
import React, { useEffect, useState } from 'react';
import { useQuery, useQueryClient } from "react-query";
import { useHistory } from "react-router";
const history = useHistory();
import { useLocation } from "react-router-dom";
import { useTranslation } from "react-i18next";
import { connect } from "react-redux";
import { SzModal } from "@env/react-theme-components";
ReactDOM.createRoot(document.getElementById('root') as HTMLElement).render()
### use of i/e
// index.d.ts
export interface ICategoryType {id: string;}
export interface IMetadatas {[key: string]: string;}
// file.tsx
import {ICategoryType, IMetadatas} from '@module/widget/dist';
### const
const filterDisplayedTabs = (tabsDisplayed: string[]) => {}
const {
fct1,
fct2,
} = require("../controllers/fct");
const videoNames = response.data.map((video) => video.filename);
const data: DataType[] = [
{
key: "1",
},
]
const API_URL = `${process.env.API_URL}`;

### misc
<div {...ModulesStyle} style={{ backgroundColor: theme.darkTheme ? "#342525" : "#ffffff" }}>
{isLoading && <div className='p-4 text-center'>
<Component/>
</div>
}
  
### query
const { data, isError, isLoading, isSuccess } = useQuery(['organizations', my.id, queryFilter, currentPage], fetchData);

### STYLE

```
<div {...ModulesStyle} style={{ backgroundColor: theme.darkTheme ? "#342525" : "#ffffff" }}>
```
