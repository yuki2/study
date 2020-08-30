# Github example with SwiftUI

<img src="https://user-images.githubusercontent.com/4437236/91659542-4dc2c880-eb0b-11ea-8ecd-5e13ed007901.png" width="320">

This is example app to investigate how to implement Networking with SwiftUI

## What's included

### SwiftUI

https://developer.apple.com/jp/xcode/swiftui/

### Apollo

#### SetUp

1.  Get token from https://github.com/settings/tokens
2. `yarn global add apollo`
3. `apollo schema:download --endpoint="https://api.github.com/graphql" --header "API-TOKEN"`
4. Prepare `query.graphql`
5. `apollo codegen:generate --queries=query.graphql --localSchemaFile=schema.json --target=swift API.swift`


#### References

- https://github.com/apollographql/apollo-ios
- https://developer.github.com/v4/explorer/
