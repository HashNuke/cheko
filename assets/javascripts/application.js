//= require "lib/moment.min"
//= require "lib/jquery-2.0.3"
//= require "lib/handlebars-v1.1.2"
//= require "lib/ember"
//= require "lib/ember-data"
//= require "lib/fastclick"
//= require "mogo_chat"
//= require_self
//= require "serializers"
//= require "transforms"
//= require_tree "./models"
//= require "views"
//= require "helpers"
//= require_tree "./controllers"
//= require "./routes/authenticated_route"
//= require_tree "./routes"
//= require_tree "./pollers"
//= require "plugins"
//= require "notifications"
//= require "emojify"


window.App = Em.Application.create({LOG_TRANSITIONS: true});
App.ApplicationSerializer = DS.ActiveModelSerializer.extend({});
App.ApplicationAdapter    = DS.ActiveModelAdapter.reopen({namespace: "api"});
App.ApplicationView       = Em.View.extend({classNames: ["container"]});
App.paintBox = new MogoChat.PaintBox();
App.plugins  = new MogoChat.PluginRegistry();



App.Router.map(function() {
  // login
  this.route("login");

  // logout
  this.route("logout");

  // rooms
  this.resource("rooms", function() {
    this.route("new");
    this.resource("room", {path: "/:room_id"}, function() {
      this.route("edit");
    });
  });

  // users
  // users/new
  // users/:user_id
  this.resource("users", function() {
    this.route("new");
    this.resource("user", {path: "/:user_id"}, function() {
      this.route("edit");
    });
  });

});


