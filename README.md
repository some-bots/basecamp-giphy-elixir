# basecamp-giphy-elixir
A Giphy bot of the simplest kind....only for Basecamp... written in Elixir!

# Setup

### Giphy API Key

>To use the GIPHY API, you'll need to obtain an API Key by creating an app. You'll need a GIPHY account to create an app (don't worry, it's free!) Each application you create will have its own API Key. Don't worry if you're not sure what you want to use the GIPHY API for yet, all that's needed to create an app is a name and a basic description, which can be changed at any time.

Start here: 👉 [https://developers.giphy.com/docs/](https://developers.giphy.com/docs/)

### Clone the repo

```
git clone git@github.com:some-bots/basecamp-giphy-elixir.git
cd basecamp-giphy-elixir
```

### Setup a Heroku app

Ensure you have the [Heroku CLI](https://devcenter.heroku.com/categories/command-line) and are logged in.

**Create an app**

```
heroku create
```
**Set a buildpack**

```
heroku buildpacks:set https://github.com/HashNuke/heroku-buildpack-elixir.git
```
**Set your config vars**
```
heroku config:set GIPHY_API_KEY=<<the giphy api key created above>>
heroku config:set PORT=80
```
**Deploy**

```
git push heroku master
```

### Setup Basecamp App

![add-chat-bot](https://github.com/some-bots/basecamp-giphy/raw/master/assets/add-chat-bot.gif)

1. Go to your HQ (any any team/project) and click the ellipsis at the top right
1. Select `Configure chatbots`
1. Click `Add a new chatbot`
1. _Optional_ Upload `assets/giphy logo.png` as the bot's avatar
1. Name is `giphy` (any name will do)
1. Enter the url of your Heroku app created above with the `/cmd` on the end

# Testing Locally

_Note: Replace <key> with your actual Giphy API Key._

Install dependencies

```bash
PORT=4000 GIPHY_API_KEY=<key> mix deps.get
```

Start the server

```bash
PORT=4000 GIPHY_API_KEY=<key> heroku local
```

Open your browser to http://localhost:4000 and you should be greeted with `Hi from Basecamp-giphy-elixir bot! 🤖`.

You can send test queries using curl:

```bash
 curl -H "Content-Type: application/json" -d '{"command":"test"}' localhost:4000/cmd
```

or via the convenience url to test in the browser:

http://localhost:4000/cmd/test