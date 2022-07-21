// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
// import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage";
import "channels";
require("../time");
require("../delete_alert");
require("../tag");
require("../preview");
require("../search-box");
require("../mypage-location");
require("../sort-location");
require("../position-color");
require("../comment-big");
require("../issue-appear");
require("../room-dropdown");
// require("../ajax");

Rails.start();
// Turbolinks.start()
ActiveStorage.start();
