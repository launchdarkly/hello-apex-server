// You will set your LaunchDarkly SDK key through the bridge application.

// Set flagKey to the feature flag key you want to evaluate.
String flagKey = 'my-boolean-flag';

LDConfig config = new LDConfig.Builder().build();

LDClient client = new LDClient(config);

// Set up the user properties. This user should appear on your LaunchDarkly users
// dashboard soon after you run the demo.
LDUser user = new LDUser.Builder('example-user-key')
    .setName('Sandy')
    .build();

Boolean value = client.boolVariation(user, flagKey, false);
System.debug('Feature flag '+flagKey+' is '+value+' for this user');
