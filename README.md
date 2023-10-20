<div align="center">
  <h1>Budget App</h1>
</div>

<a name="readme-top"></a>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 Budget-App ](#-budget-app)
  - [🛠 Built With ](#-built-with-)
    - [Key Features ](#key-features-)
  - [🚀 Demo Video](#live-demo)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Usage](#usage)
    - [Run tests](#run-tests)
    - [Deployment](#triangular_flag_on_post-deployment)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->

# 📖 Budget App <a name="about-project"></a>

> Budget app is a mobile web application where you can manage your budget: you have a list of transactions associated with a category, so that you can see how much money you spent and on what.

## 🛠 Built With <a name="built-with"></a>

<h2> Tech Stack </h2>
- Ruby on Rails
- PSQL

<!-- Features -->

### Key Features <a name="key-features"></a>

- Login / Sign up

- Add/Display Categories

- Add/Display Expenses

- Show sum of expenses for each category

- Track your expenses


<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Demo Video

- <a href="https://drive.google.com/drive/u/0/search?q=rails%20capstone">Click Here</a>
<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

```
    ruby >= 3.2.2
    rails >= 7.0
    postgres >- 15.3
```

### Setup

Clone this repository to your desired folder:

```bash
  git clone https://github.com/akezeth/Budget-app.git
```

You need to setup database for these project

```
  development = Budget_app_development
  test        = Budget_app_test
  production  = Budget_app_production
```

or you can use your own database and change the `config/database.yml`

```yml
default: &default
  adapter: postgresql
  encoding: unicode
  pool: 5
  username: [your_username]
  password: [your_password]
  host: localhost

development:
  <<: *default
  database: [your_database_for_development]

test:
  <<: *default
  database: [your_database_for_test]

production:
  <<: *default
  database: [your_database_for_production]
```

### Install

Install this project with:

```bash
  cd Budget-app
  bundle install
```

it will install the required gemfile for running the project

### Usage

to use this project:

```ruby
   rails s
```

it will run the the server on `localhost:3000`

### Test

to run test in these this project:

```
   rspec spec/
```

it will run the all the unit test of these project

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Deployment

- <a href="https://budget-2wf9.onrender.com/">Click here to view live deployment</a>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Aklilu Mekonnen**

- GitHub: [@akezeth](https://github.com/akezeth)

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- Add better features
- Improve GUI

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project, give it a star.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

- Thanks to all Microverse community
- Original design idea by: [Gregoire Vella on Behance](https://www.behance.net/gregoirevella).
- [Creative Commons](https://creativecommons.org)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
