// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

let header_menuToggle = document.querySelector(".header_menu__toggle");
let header_menuWrapper = document.querySelector(".header_menu__wrapper");

header_menuToggle.addEventListener("click", function () {
  if (header_menuWrapper.classList.contains("active")) {
    this.setAttribute("aria-expanded", "false");
    this.setAttribute("aria-label", "menu");
    header_menuWrapper.classList.remove("active");
  } else {
    header_menuWrapper.classList.add("active");
    this.setAttribute("aria-label", "close menu");
    this.setAttribute("aria-expanded", "true");
  }
});

function user_menu() {
  document.getElementById('user_menu').classList.toggle('user_menu_in');
}
document.getElementById('user_menu_link').addEventListener('click' , function () {
  user_menu();
} );
