# README

Back-end repo: https://github.com/dylanconnolly/drinkee-backend

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/dylanconnolly/drinkee-backend">
  </a>

  <h3 align="center">Drinkee Frontend</h3>

  <p align="center">
    This application consumes from a cocktail API (https://www.thecocktaildb.com/api.php) using a sinatra backend application. From here we are passing the needed information back and forth between our front and back end in order to create cocktails. This is done by listing ingredients a user has where it is then cross-referenced against our cocktail database. If a user has all ingredients within a cocktail, then that cocktail is returned. 
    https://github.com/dylanconnolly/drinkee-frontend
    <br />
    <br />
    <br />
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Installation](#installation)
* [Usage](#usage)
* [Roadmap](#roadmap)
* [Contributors](#contributors)



<!-- ABOUT THE PROJECT -->
## About The Project

![image](https://user-images.githubusercontent.com/48839191/75552761-3d168600-59f4-11ea-962a-78fbff8e03fe.png)

Drinkee Backend is a Sinatra app meant to run in conjunction with [Drinkee Frontend](https://github.com/dylanconnolly/drinkee-frontend). Drinkee Backend imports data from [The Cocktail DB API](https://www.thecocktaildb.com/api.php) and exposes data to the frontend through seven endpoints.

```sh
'/api/v1/ingredients'
'/api/v1/ingredients/:id'
'/api/v1/:user_id/cabinet'
'/api/v1/:user_id/cabinet'
'/api/v1/:user_id/cabinet'
'/api/v1/:user_id/results'
'/api/v1/drinks'
```

The Ingredients, Drinks, DrinkIngredients, Cabinet, and CabinetIngredients tables are stored on the backend while the Users table is stored on the frontend. The backend exposes an all ingredients endpoint to the frontend, allowing users to select the ingredients they have. When a user successfully authenticates/logs in for the first time, a post request is sent to the backend to create an empty cabinet that stores their user id. When they select their ingredients, a patch request is sent to the backend to update their cabinet's ingredients. Each time a user views their cabinet, the backend exposes the cabinet associated with that user. When a users views their results (the drinks they can make with their cabinet's ingredients), the backend iterates through all drinks and returns individual drinks whose required ingredients are satisfied by the elements in that user's cabinet – no required ingredients can be missing from a drink for that drink to be returned.

[Heroku Backend](https://dashboard.heroku.com/apps/drinkee-backend)
[Heroku Frontend](https://drinkee-frontend.herokuapp.com/)

### Built With

* Rails 
* Ruby 
* HTML
* CSS

### Tested With
* Launchy
* Capybara
* Webmock

### Notable Gems 
* Faker
* Figaro
* Factory bot

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Installation
 
1. Clone the repo
```sh
git clone git@github.com:dylanconnolly/drinkee-frontend.git
```

2. Install gems
```sh
bundle install
```

3. Create and migrate database
```sh
rake db:{create,migrate}
```

<!-- USAGE EXAMPLES -->
## Usage

To run both apps correctly in a local environment, cd into this backend directory, open a terminal tab, and run the command
```sh
shotgun
```
and then open a new terminal tab, cd into the frontend directory, and run the command
```sh
rails s
```
The backend server must be started first to allow the frontend to properly make API calls to the backend. Both servers must be running at the same time for the app to work locally.



<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/dylanconnolly/drinkee-backend/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTORS -->
## Contributors

* [Dylan Connolly](https://github.com/dylanconnolly)
* [David Barriga-Gomez](https://github.com/DavidBarriga-Gomez)
* [Rachel Lew](https://github.com/rlew421)





<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=flat-square
[contributors-url]: https://github.com/othneildrew/Best-README-Template/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=flat-square
[forks-url]: https://github.com/othneildrew/Best-README-Template/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=flat-square
[stars-url]: https://github.com/othneildrew/Best-README-Template/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=flat-square
[issues-url]: https://github.com/othneildrew/Best-README-Template/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=flat-square
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[product-screenshot]: images/screenshot.png
