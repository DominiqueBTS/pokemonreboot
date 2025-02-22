// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery
//= require jquery_ujs
import $ from "jquery";
window.jQuery = $; // Optional, for compatibility with any jQuery plugins
window.$ = $;

import * as Rails from '@rails/ujs';
Rails.start();
