This project was a take home assignment for a job interview.

See the finished result [here: https://flutterwebappexample.web.app/](https://flutterwebappexample.web.app/)

DISCLAIMER: This is merely a showcase of my flutter work. I am not taking credit for the design or the idea of this webpage.

### Brief

Your challenge is to build out this landing page, integrate with the [shrtcode API](https://app.shrtco.de/docs) and get it looking as close to the design as possible.

Your users should be able to:

- View the optimal layout for the site depending on their device's screen size
- Shorten any valid URL
- See a list of their shortened links, even after refreshing the browser
- Copy the shortened link to their clipboard in a single click
- Receive an error message when the `form` is submitted if:
  - The `input` field is empty

### Conclusion/Retrospective

1. Best Practices

- I tried to follow all best practices for writing clean and simple code. I chose to use the `BLOC` package for state management. To keep it simple, I only use this package for all state needs.
- When communicating with the shortco API, I broke the HTTP calls into a separate repository called `short_code_api_repository`. This provides a separation of concerns and makes the testing process a bit easier. It also future proofs for other potential products that we might want to build using this API. In the future, we could import this package and use the same coded API calls in another product.

2. I should have used a different package

- As I was building this product out, the flutter team released the `flutter_adaptive_scaffold`. I would have love to use this package, but instead I used the `responsive_builder` which is not backed by the floater team. This just goes to show that the pace of development moves quickly and things that were good ideas yesterday might be worse ideas today. 🤣

3. Testing

- I did not have the time that I needed to reach 100% code coverage in this project. That being said, it would be really easy to achieve that goal, especially with the help of the helper functions that I wrote to mock the local database storage, and the API calls.

4. How I met the criteria for persistent data

- One of the criteria for this project was that the user shortened input data be persistent across reload states. My thinking was that implementing a database might be more firepower than we actually needed. I wanted to see if I could store the data locally on device. There are a few great libraries that I could have used to accomplish this - the `shared_preferences` and `hive` packages come to mind immediately. However, because I was already using `BLOC` for my state management tool, I chose to use `hydrated_bloc` to manage the local storage. This meant all I had to do was write a toJson, and fromJson method in my `BLOC` that could read the locally stored json and convert it to the state object and vice versa.
