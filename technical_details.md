<h1 align=center> Technical Details </h1>

## Back-End

### ExpressJS
[ExpressJS](https://expressjs.com) is used to create a REST API which will have the functionality to link the database to the application. The REST API will be deloployed on [Heroku](https://www.heroku.com).

### MongoDB
[MongoDB](https://www.mongodb.com) is used to query any required information and will be accessible by our REST API.
This application will use the [M0 Sandbox (Shared RAM, 512 MB Storage)](https://www.mongodb.com/docs/atlas/reference/free-shared-limitations/) and will be deployed on AWS Cloud using [MongoDB Atlas](https://www.googleadservices.com/pagead/aclk?sa=L&ai=CH2G5s5eWYqPTFIDmvdMPyN25mAnpxLW-Y_n-l_u2D5WirarGCggAEAEguVRg_bCWgegDoAHNxtehA8gBAcgD2CCqBFtP0DHta51t5DBZfDCXXZBIVoHEQdhXOQmxOkhYWjMxCbIHL_y-dURJzqUjhQTO0Mmzymp04ead0S2lApNTuhidJKTFdSdDX9rJcYZQmJJMUPI2ewdyWSIeBePIwASXpeGZrwOABZBOiAW3t7e_LaAGZoAHm7moXogHAZAHAagHpr4bqAe5mrECqAfz0RuoB-7SG6gH_5yxAqgHytwbqAfYprECoAjZrqUEsAgB0ggMEAIghAEyAoJAOgEAmgkraHR0cHM6Ly93d3cubW9uZ29kYi5jb20vY2xvdWQvYXRsYXMvbHAvdHJ5MrEJa-cqwQD2Daq5CWvnKsEA9g2q-AkBmAsBqgwCCAG4DAHaDAgKAyDJARIBAugMBoIUEQgDEg1tb25nb2RiIGF0bGFzyBSN2YPSyZDNxQLQFQGYFgH4FgGAFwGSFwkSBwgBEAMY-wE&ae=2&ved=2ahUKEwjLxori5Yr4AhWGMM0KHei2AGwQ0Qx6BAgCEAE&nis=2&dct=1&cid=CAASFORoQMdqTDSEqttlZdEQhY65ykJ7&dblrd=1&sival=AF15MECEzSe1wJZSgqj3NoNr9mpdklaHzUlusOhYWlRB1bWdmR2jmPPk6IohA5zWouaZrHL8aj6FeAdh9b-Fck1XKNFRB9YrelBUcL8_5BW8ALeW1jUhkbiOtAwsfRtQIsMXmLz1FlZ7iWOe78Jp7TzvTne4fATfh-FKpUw0KLDxacB2selSvB0tHkYtkeZTdsElJCJiVSOn&sig=AOD64_32HbZU838oRQA8w0Gfsz2aWdZo5A&adurl=https://www.mongodb.com/cloud/atlas/lp/try2%3Futm_source%3Dgoogle%26utm_campaign%3Dgs_americas_canada_search_core_brand_atlas_desktop%26utm_term%3Dmongodb%2520atlas%26utm_medium%3Dcpc_paid_search%26utm_ad%3De%26utm_ad_campaign_id%3D12212624311%26adgroup%3D115749704343).

<hr/>
There are a number of third party libraries/APIs that might be used as the application is developed:

### Firebase
[Firebase](https://firebase.google.com) is developed by Google and has a great [Swift Package](https://github.com/firebase/firebase-ios-sdk) with the functionality to authenticate, store information, query, and many more features.


### Stripe
[Stripe](https://stripe.com/en-ca) could be used to enable different payment methods such as Apple Pay, PayPal for users while using the application.

## Front-End
[SwiftUI](https://developer.apple.com/xcode/swiftui/) or [UIKit](https://developer.apple.com/documentation/uikit) will be used to create a responsive user interface that can be run by any iOS 13+ devices.

## Developing Tools
This application is developed using [Xcode](https://apps.apple.com/ca/app/xcode/id497799835?mt=12) for Front-End development and [WebStorm IDE](https://www.jetbrains.com/webstorm/) for Back-End development. Moreover, [Postman](https://www.postman.com) is used to make HTTP requests and is only used in the development phase of the project and for testing purposes.
