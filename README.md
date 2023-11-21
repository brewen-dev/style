# @brewen.dev/style
The style library for @brewen-dev projects. This library is used to provide a consistent look and feel across all @brewen-dev projects.
It uses [Sass](https://sass-lang.com/) to provide a set of variables and mixins that can be used to style the projects and a pre-built `index.min.css` file to declare all base styles, including theme css variables.
It is mainly used for color and layout management, but also provides some other useful variables and mixins. It also includes some assets, such as fonts, icons, images and other shared resources.

## Installation
To install the library, you first need to authenticate to the GitHub package registry. You can find more information about this [here](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-npm-registry#authenticating-to-github-packages). <br />
I will only cover installation for [Bun](https://bun.sh) here.
1. First, create or edit the `bunfig.toml` file in your project with the following content:
```toml
[install.scopes]
"@brewen-dev" = { username = "USERNAME", password = "TOKEN", registry = "https://npm.pkg.github.com" }
```
While replacing `USERNAME` with your GitHub username and `TOKEN` with a [personal access token](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token) with the `read:packages` scope.

> [!TIP]
> You may want to use environment variables instead of hardcoding your username and token in the `bunfig.toml` file. <br />
> To do so, you only need to add a `.env` file in your project with your variables and replace the `USERNAME` and `TOKEN` values in the `bunfig.toml` file with the corresponding environment variables. (e.g. `username = "$USERNAME"`)

> [!WARNING]
> As of right now (2023-11-21), fine-grained access tokens are not supported for GitHub packages. (see the issue [here](https://github.com/github/roadmap/issues/558))

2. Then, you can install the library using bun.
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
