// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "stylesheets/application";
import 'boxicons';
import toastr from "toastr";

Rails.start();
Turbolinks.start();
ActiveStorage.start();
require("jquery");
// require("toastr")


window.$ = $
window.toastr = toastr

$(document).ready(function(){                                                       
    $('.field_with_errors input:first').addClass('is-error')                        
    $('.field_with_errors select:first').addClass('is-error')                       
    $('.field_with_errors textarea:first').addClass('is-error')                     
  });  