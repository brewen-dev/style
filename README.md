# @brewen.dev/style
The style library for @brewen-dev projects. This library is used to provide a consistent look and feel across all @brewen-dev projects.
It uses [Sass](https://sass-lang.com/) to provide a set of variables and mixins that can be used to style the projects and a pre-built `index.min.css` file to declare all base styles, including theme css variables.
It is mainly used for color and layout management, but also provides some other useful variables and mixins. It also includes some assets, such as fonts, icons, images and other shared resources.

## Installation
To install the library, you first need to authenticate to the GitHub package registry. You can find more information about this [here](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-npm-registry#authenticating-to-github-packages). <br />
To do so, you will need a GitHub account and a personal access token with the `read:packages` scope. (No matter if the package is public or private, you will need this scope to install it.) <br />
Then, you can install the library using whatever package manager you use.
### npm
First, login to the GitHub package registry using npm.
```bash
npm login --scope=@brewen-dev --auth-type=legacy --registry=https://npm.pkg.github.com

> Username: USERNAME
> Password: TOKEN
```
Then, add the following to a `.npmrc` file in your project root.
```
@brewen-dev:registry=https://npm.pkg.github.com
```
Finally, you can install the library using npm.
```bash
npm install @brewen-dev/style
```
### bun
You only need to add the following to a `bunfig.toml` file in your project root.
```toml
[install.scopes]
"@brewen-dev" = { username = "USERNAME", password = "TOKEN", registry = "https://npm.pkg.github.com" }
```
(You can also declare a variable in a `.env` file and use it in the `bunfig.toml` file.) <br />
Then, you can install the library using bun.
```bash
bun add @brewen-dev/style
# or
bun install @brewen-dev/style # if you do not want to update package.json and bun.lockb
```

## Usage
To use the library, you first need to import the `index.min.css` file in your project. This file contains all the base styles, including the theme css variables.
As it is a pre-built file, it does not contain any variables or mixins, so you can import it directly in your stylesheets.
```scss
@import "~@brewen-dev/style/index.min.css";
```
Then, you can use the variables and mixins provided by the library in your own stylesheets.
```scss
@import "~@brewen-dev/style/variables";

div {
  border: $border-width $border-style var(--layout-border-color);
  border-radius: $border-radius-small;
}
```
