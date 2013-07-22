#Any Ipsum
> An API to build any placeholder text you desire

<http://any-ipsum.herokuapp.com/>

Created by:

- [Andrew McGregor](https://github.com/andmcgregor)
- [Jeff Belser](https://github.com/JustAboutJeff)
- [Avi Kaufman](https://github.com/Ank13)

##About

Any Ipsum is an API that builds custom lorem ipsum placeholder text. The API may be used by including one or more search term(s) and the number of paragraphs as parameters within a standard HTTP GET request. The application retrieves text related to the term(s) from Wikipedia, generates Lorem Ipsum type placeholder text, and responds to the client with formatted JSON data. We've included a browser facing demonstration page deployed as a lightweight Ruby Sinatra app.

Produced at the Dev Bootcamp Chicago Hack-A-Thon on Sunday July 21, 2013

##Screenshot

![Any Ipsum](/any-ipsum.png)

##Install

- Fork the repo and clone the files onto your local machine:

    	$ git clone https://github.com/andmcgregor/any-ipsum.git

- Navigate to the application directoy in terminal and run **bundle install** to gather the required gems:

    	$ bundle install

- Depending on your local development environment, you may need to create and save out a **.ruby-gemset** and/or **.ruby-version** dot file(s) within the main application directory to configure your gemset and ruby version. Use the provided .ruby-version.sample and .ruby-gemset.sample files as a guide.

- Launch the application server:

    	$ shotgun server.rb

- Open a broswer and navigate to localhost:9393

- Enjoy

##Usage

After the application is up and running you have the ability to fire off API requests by using the form provided at the top. Select a **number of paragraphs** from the dropdown and then enter **search term(s)** within the text input field. You can submit your request and should see an AJAX response within a moment or so. A description of how to use the API from outside the application is provided below.

##Final Thoughts

Thanks to Dev Bootcamp for hosting a very fun and very intense hackathon. Thanks to Jason Benn for organizing the event, Erik Allar for MC'ing and Chris Laubacher for providing the blueberry pie. A few features we're excited to improve on in the future:

- Add additional data formats as parameters in the HTTP request (YAML, etc.)
- Include sentences per paragraph as a parameters in the HTTP request
- Improve the robustness of the search module and ipsum generator modules

===

Last Updated: Spring 2013
