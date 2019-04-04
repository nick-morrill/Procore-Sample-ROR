# README

### Setup Instructions
This following steps are instructions to launch and view a simple Ruby on Rails applicaiton that authenticates with Procore's API using the OAuth 2.0 Authorization Code Grant Type flow. The application is configured to access Procore's environment. If you do not have access to this environment or if you're working out of Procore's developer sandbox environment, all root URLs in the `login_controller` and `users_controller` must be re-configured to https://sandbox.procore.com.

1. Clone this repository
2. Run `bundle install`
3. The Gemfile includes the Figaro gem. This gem should automatically create an untracked file: `config/application.yml`
    * Within this file, configure your application's Client ID, Client Secret, and Redirect URI in order to save these as the application's environment variables:
        * CLIENT_ID: ''
        CLIENT_SECRET: ''
        REDIRECT_URL: 'http://localhost:3000/login/callback'

    * Client ID and Client Secret values are provided when [creating an application](https://developers.procore.com/documentation/new-application) in the Procore Developer Portal. The redirect URI above should be added to your application, which can be done on your application's home page.
    * After these values have been configred within the `application.yml` file, make sure to save your changes.
4. Navigate to the directory where the repository was cloned to and launch your Rails server
5. The landing page will include a button that says, "Sign In to Procore". Click this button and enter your Procore email address/password.
6. After authenticating with Procore, you will be redirected back to the sample application. This page will include a table containing the first five and last five characters of your access token and your refresh token. In addition, there will be timestamps correspoding to when the access token was generated and when it expires (2 hours after generation).
7. To access the data returned by the [Show User Info](https://developers.procore.com/reference/me) endpoint, click on the "Show User Information" button on the home page.
8. To refresh your access token, click on the "Refresh Access Token" button. Notice that the corresponding values will be updated in the table on the home page.

If you have any questions regarding this application's code or functionality, please reach out to apisupport@procore.com
