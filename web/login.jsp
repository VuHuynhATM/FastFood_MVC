<%-- 
    Document   : login
    Created on : Jan 6, 2021, 4:35:32 PM
    Author     : tuanv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="google-signin-scope" content="profile email">
        <meta name="google-signin-client_id" content="445803574555-a2442rcbct5lc2e665thhcp8hqdps2ls.apps.googleusercontent.com">
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <title>Login Page</title>
    </head>
    <body>
        <h1 style="text-align: center">Welcome Hana Shop__drinks/fast food</h1>
        <form action="MainController" method="POST" >
            <table border="0" style="margin: 0 auto">                
                <tbody>
                    <tr>
                        <td>UserID</td>
                        <td><input type="text" name="userID" value="${param.userID}"></td>
                        <td>${requestScope.ERRORUSER }</td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" value="${param.password}"></td>
                        <td>${requestScope.ERRORPASSWORD }</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>${requestScope.ERROR }</br></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="btnAction" value="Login"></td>
                        <td><a href="MainController?btnAction=Search">Product</a></td>
                    </tr>
                </tbody>
            </table>
        </form>
                    <div class="g-signin2"  data-onsuccess="onSignIn" data-theme="dark" style="text-align: center"></div>
    </body>
    <script>
        function onSignIn(googleUser) {
            // Useful data for your client-side scripts:
            var auth2 = gapi.auth2.getAuthInstance();
            auth2.signOut().then(function () {
                console.log('User signed out.');
            });
            var profile = googleUser.getBasicProfile();
            console.log("ID: " + profile.getId()); // Don't send this directly to your server!
            console.log('Full Name: ' + profile.getName());
            console.log('Given Name: ' + profile.getGivenName());
            console.log('Family Name: ' + profile.getFamilyName());
            console.log("Image URL: " + profile.getImageUrl());
            console.log("Email: " + profile.getEmail());
            window.location.href = 'MainController?btnAction=GmailLogin&UserID=' + profile.getId() + '&email=' + profile.getEmail() + '&fullName=' + profile.getName();

            // The ID token you need to pass to your backend:
            var id_token = googleUser.getAuthResponse().id_token;
            console.log("ID Token: " + id_token);
        }

    </script>
</html>
