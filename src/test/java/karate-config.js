function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);

  if (!env) {
    env = 'dev';
  }

  var config = {
    //env: env,
    apiUrlTypiCodeCom: 'https://jsonplaceholder.typicode.com/',
    apiUrlLocalhost: 'https://conduit.productionready.io/api/'
  }

  if (env == 'dev') {

  config.userEmail = 'test12user@test.com'
  config.userPassword = 'test12user'

  } else if (env == 'e2e') {
    // customize
  }

//  var accessToken = karate.callSingle('classpath:com/karate/helpers/CreateToken.feature', config).authToken
//  karate.configure('headers', {Authorization: 'Token ' + accessToken })

  return config;
}