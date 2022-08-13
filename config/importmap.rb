# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "jquery", to: "https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js", preload: true
pin "lodash", to: "https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js", preload: true
pin "select2", to: "https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js", preload: true
pin "flatpickr", to: "https://cdn.jsdelivr.net/npm/flatpickr", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
