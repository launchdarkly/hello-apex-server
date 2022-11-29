# LaunchDarkly sample Apex application

We've built a simple application that demonstrates how LaunchDarkly's SDK works.

Below, you'll find the basic build procedure, but for more comprehensive instructions, you can visit the [Apex SDK reference guide](https://docs.launchdarkly.com/sdk/server-side/apex).

This guide requires you to install the [Salesforce CLI](https://developer.salesforce.com/tools/sfdxcli) and the [Go compiler](https://golang.org/).

## Build instructions

1. Clone the Apex SDK.

```bash
git clone https://github.com/launchdarkly/apex-server-sdk.git
```

2. Deploy the SDK to Salesforce.

```bash
cd apex-server-sdk
sfdx force:source:deploy --targetusername='YOUR TARGET ORG' --sourcepath='force-app'
```

3. Build the Salesforce LaunchDarkly bridge.

```bash
cd apex-server-sdk/bridge
go build .
```

4. Set the environment variable `LD_SDK_KEY` to your LaunchDarkly SDK key. Set environment variables for your Salesforce account.
  - Optional: If authenticating to your Salesforce sandbox, set 
```bash
export OAUTH_URI='https://test.salesforce.com/services/oauth2/token'
```
6. Start the Salesforce bridge.

```bash
cd apex-server-sdk/bridge

export LD_SDK_KEY='Your LaunchDarkly SDK key'
export SALESFORCE_URL='Your Salesforce Apex REST URL'
export OAUTH_ID='Your Salesforce OAuth Id'
export OAUTH_SECRET='Your Salesforce OAuth secret'
export OAUTH_USERNAME='Your Salesforce username'
export OAUTH_PASSWORD='Your Salesforce password + security token'

./bridge
```

5. If there is an existing boolean feature flag in your LaunchDarkly project that you want to evaluate, edit `hello.apex` and set the value of `flagKey` to the flag key.

```java
String flagKey = 'my-boolean-flag';
```

6. Use the SDK with `hello.apex`

```bash
sfdx force:apex:execute --targetusername='YOUR TARGET ORG' --apexcodefile='hello.apex'
```
