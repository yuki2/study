# How to configure eslint in ReactNative

#### Step1 
```
npm install --save-dev eslint eslint-config-airbnb eslint-plugin-import eslint-plugin-react eslint-plugin-jsx-a11y babel-eslint
```

#### Step2
```
node node_modules/eslint/bin/eslint.js --init
```
1. Select 'Use a popular style guide'
2. Select Airbnb
3. Select y
4. Select JSON

#### Step3
Paste this into your .eslintrc.json
```
{
    "env": {
        "node": true,
        "browser": true,
        "es6": true,
        "jest": true
    },
    "parser": "babel-eslint",
    "extends": "airbnb",
    "rules": { "react/jsx-filename-extension": [ 1, { "extensions": [ ".js", ".jsx" ] } ] }
}
```

*Ref*
https://github.com/airbnb/javascript/issues/1589
