// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require('webpack-jquery-ui/sortable');
require('webpack-jquery-ui/css');
require('webpack-jquery-ui/datepicker');

import $ from 'jquery';
global.$ = jQuery;

import "select2/dist/css/select2.css";
import "select2";

import "foundation";
import "controllers";
import "scrollable";
import "smooth_anchor";
import "checkbox";

$(document).on('turbolinks:load', () => {
  SmoothAnchor.start();

  // Do not allow css transitions to function as page is loading.
  setTimeout(() => {
    $("body").removeClass("css-transition-preload");
  }, 250);
});

$(document).on('click', '.prevent-default', (e) => {
  // e.preventDefault();
  e.stopPropagation();
});

$(document).on('click', '.stop-propagation', (e) => {
  // e.preventDefault();
  e.stopPropagation();
});

import "stylesheets/application.scss";

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("trix");
require("@rails/actiontext");

import "controllers"
