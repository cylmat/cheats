
pass arguments
```
npm run build -- --verbose
```

[patch-package](https://www.npmjs.com/package/patch-package)
```
sed -i 's#../assets/fonts#../fonts#g' node_modules/@pack/react-theme-components/assets/css/.css
npx patch-package @pack/react-theme-components

"scripts": {
  "build": "react-scripts build --verbose",
  "postinstall": "patch-package"
},
```
