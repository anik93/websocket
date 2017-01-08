<!DOCTYPE HTML>
<html lang="en">
  <head>
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700" rel="stylesheet" type="text/css" />
    <style href="style/styles.css" type="text/css"></style>
    
  </head>
    <script href="app/app.js" type="text/javascript"></script>
    <script href="app/controllers.js" type="text/javascript"></script>
    <script href="app/services.js" type="text/javascript"></script>
    <script href="lib/angular.min.js" type="text/javascript"></script>
   
    <script src="https://code.jquery.com/jquery-2.2.4.min.js" type="text/javascript"></script>
    <script src="https://raw.githubusercontent.com/lodash/lodash/4.17.3/dist/lodash.js" type="text/plain"></script>
    <script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js" type="text/javascript"></script>
    
    
  <body ng-app="chatApp">
    <div ng-controller="ChatCtrl" class="container">
      <form ng-submit="addMessage()" name="messageForm">
        <input type="text" placeholder="Compose a new message..." ng-model="message" />
        <div class="info">
          <span class="count" ng-bind="max - message.length" ng-class="{danger: message.length > max}">140</span>
          <button ng-disabled="message.length > max || message.length === 0">Send</button>
        </div>
      </form>
      <hr />
      <p ng-repeat="message in messages | orderBy:'time':true" class="message">
        <time>{{message.time | date:'HH:mm'}}</time>
        <span ng-class="{self: message.self}">{{message.message}}</span>
      </p>
    </div>
</html>
