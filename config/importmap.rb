# Pin npm packages by running ./bin/importmap

pin "application"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "jquery", to: "https://code.jquery.com/jquery-3.6.0.min.js"
pin "@rails/ujs", to: "rails-ujs.js"
