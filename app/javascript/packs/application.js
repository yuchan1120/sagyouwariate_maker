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

window.insertRow = function (target) {
  let elements = document.getElementsByTagName( "tr" ) ;

  const element = target.parentNode.parentNode;

  elements = [].slice.call( elements ) ;

  const index = elements.indexOf( element ) ;

  const table = document.getElementById('sagyouwariate');

  const row = table.insertRow(index + 1);

  const cell1 = row.insertCell(-1);
  const cell2 = row.insertCell(-1);
  const cell3 = row.insertCell(-1);
  const cell4 = row.insertCell(-1);
  const cell5 = row.insertCell(-1);
  const cell6 = row.insertCell(-1);
  const cell7 = row.insertCell(-1);

  const add_button = '<input type="button" value="↪︎+" onclick="insertRow(this)" class="insert_row" title="下に1行挿入" />';
  const delete_button = `<input type="button" value="×→" onclick="deleteRow(this)" id="delete_button_${index + 1}" class="delete_row" title="この行を削除" />`;

  const input_time = document.createElement("input");
  input_time.setAttribute("type", "text");
  input_time.setAttribute("class", "cell");
  input_time.setAttribute("size", "5");

  const input_regular_work = document.createElement("input");
  input_regular_work.setAttribute("list", "regular_work");
  input_regular_work.setAttribute("type", "text");
  input_regular_work.setAttribute("class", "cell");
  input_regular_work.setAttribute("size", "28");

  const input_deliver_work = document.createElement("input");
  input_deliver_work.setAttribute("list", "deliver_work");
  input_deliver_work.setAttribute("type", "text");
  input_deliver_work.setAttribute("class", "cell");
  input_deliver_work.setAttribute("size", "28");

  const input_product_management_work = document.createElement("input");
  input_product_management_work.setAttribute("list", "product_management_work");
  input_product_management_work.setAttribute("type", "text");
  input_product_management_work.setAttribute("class", "cell");
  input_product_management_work.setAttribute("size", "28");

  const input_cleaning_work = document.createElement("input");
  input_cleaning_work.setAttribute("list", "cleaning_work");
  input_cleaning_work.setAttribute("type", "text");
  input_cleaning_work.setAttribute("class", "cell");
  input_cleaning_work.setAttribute("size", "28");

  cell1.innerHTML = add_button;
  cell2.innerHTML = delete_button;
  cell3.appendChild(input_time);
  cell4.appendChild(input_regular_work);
  cell5.appendChild(input_deliver_work);
  cell6.appendChild(input_product_management_work);
  cell7.appendChild(input_cleaning_work);

  setId();
}

window.deleteRow = function (obj) {
  let tr = obj.parentNode.parentNode;

  tr.parentNode.deleteRow(tr.sectionRowIndex);

  setId();
}

window.setId = function () {
  let cells = document.getElementsByClassName( "cell" ) ;
  cells = [].slice.call( cells ) ;
  cells.forEach((cell, index) => {
      cell.setAttribute("id", "cell" + index);
      cell.setAttribute("name", "cell" + index);
  });
  const cells_length = document.getElementById('cells_length');
  cells_length.setAttribute("value", cells.length);

  let insert_rows = document.getElementsByClassName( "insert_row" ) ;
  insert_rows = [].slice.call( insert_rows ) ;
  insert_rows.forEach((insert_row, index) => {
      insert_row.setAttribute("id", "insert_row_" + index);
  });

  const table = document.getElementById('sagyouwariate');
  const row_len = table.rows.length - 1;
  const table_size = document.getElementById('table_size');
  table_size.setAttribute("value", row_len);
}
