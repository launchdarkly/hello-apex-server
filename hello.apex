String flagKey = 'my-flag';

LDConfig config = new LDConfig.Builder().build();

LDClient client = new LDClient(config);

LDUser user = new LDUser.Builder('abc').build();

if (client.boolVariation(user, flagKey, false)) {
    System.debug('feature is on');
} else {
    System.debug('feature is off');
}