// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import "./components"
import ReactRailsUJS from "react_ujs";
const componentRequireContext = require.context("components", true);
ReactRailsUJS.useContext(componentRequireContext);
