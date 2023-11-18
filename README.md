# @brewen.dev/style
The style library for @brewen-dev projects. This library is used to provide a consistent look and feel across all @brewen-dev projects.
It uses [Sass](https://sass-lang.com/) to provide a set of variables and mixins that can be used to style the projects and a pre-built `index.min.css` file to declare all base styles, including theme css variables.
It is mainly used for color and layout management, but also provides some other useful variables and mixins. It also includes some assets, such as fonts, icons, images and other shared resources.

## Installation
To install the library, you first need to simply follow the instructions on the [GitHub Packages](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-npm-registry#installing-a-package)
page on how to set up your project to use the GitHub Packages registry, with the scope `@brewen-dev`.
Then, you can install the library using the following command:
```bash
npm install @brewen-dev/style
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
