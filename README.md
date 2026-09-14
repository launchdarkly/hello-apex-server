# LaunchDarkly sample Apex application

We've built a simple application that demonstrates how LaunchDarkly's SDK works.

Below, you'll find the basic build procedure, but for more comprehensive instructions, you can visit the [Apex SDK reference guide](https://docs.launchdarkly.com/sdk/server-side/apex).

This guide requires you to install the [Salesforce CLI](https://developer.salesforce.com/tools/salesforcecli) and the [Go compiler](https://golang.org/), version 1.26 or newer, which the bridge requires to build.

## Build instructions

1. Clone the Apex SDK.

```bash
git clone https://github.com/launchdarkly/apex-server-sdk.git
```

2. Deploy the SDK to Salesforce.

```bash
cd apex-server-sdk
sf project deploy start --target-org 'YOUR TARGET ORG' --source-dir 'force-app'
```

3. Build the Salesforce LaunchDarkly bridge.

```bash
cd apex-server-sdk/bridge
go build .
```

4. Set the environment variable `LD_SDK_KEY` to your LaunchDarkly SDK key. Set environment variables for your Salesforce account. This example uses the client credentials flow, which needs no user credential; enable **Enable Client Credentials Flow** on the connected app or External Client App in Salesforce first. See the [bridge configuration reference](https://github.com/launchdarkly/apex-server-sdk/blob/main/bridge/README.md) for all supported options, including JWT authentication.
  - `SALESFORCE_URL` must name the org's **My Domain** host (`https://MyDomainName.my.salesforce.com/services/apexrest/`), not the Lightning host from your browser's address bar. The bridge derives the OAuth token endpoint from it when `OAUTH_URI` is unset.
  - The client credentials flow is not accepted on `login.salesforce.com` or `test.salesforce.com`, so leave `OAUTH_URI` unset for both production and sandbox orgs.

5. Start the Salesforce bridge.

```bash
cd apex-server-sdk/bridge

export LD_SDK_KEY='Your LaunchDarkly SDK key'
export SALESFORCE_URL='Your Salesforce Apex REST URL'
export OAUTH_GRANT_TYPE='client-credentials'
export OAUTH_ID='Your Salesforce OAuth Id'
export OAUTH_SECRET='Your Salesforce OAuth secret'

./bridge
```

6. If there is an existing boolean feature flag in your LaunchDarkly project that you want to evaluate, edit `hello.apex` and set the value of `flagKey` to the flag key.

```java
String flagKey = 'my-boolean-flag';
```

7. Use the SDK with `hello.apex`

```bash
sf apex run --target-org 'YOUR TARGET ORG' --file 'hello.apex'
```
