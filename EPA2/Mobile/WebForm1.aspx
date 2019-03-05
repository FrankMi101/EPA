<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="EPA2.Mobile.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/angular.min.js"></script>
</head>
<body>
        <div ng-app="myApp" ng-controller="myCtrl">
            First Name:
            <input type="text" ng-model="firstName"><br>
            Last Name:
            <input type="text" ng-model="lastName"><br>
            <br>
            Full Name: {{firstName + " " + lastName}}

        </div>
     
</body>
</html>
<script>
    var app = angular.module('myApp', []);
    app.controller('myCtrl', function ($scope) {
        $scope.firstName = "Frank";
        $scope.lastName = "Miller";
    });
</script>
