﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="account.aspx.cs" Inherits="web_khachsan.account" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <!-- Account - page -->
        <div class="account-page">
            <div class="container">
                <div class="row">
                    <div class="col-2">
                        <img src="./images/logo.png" style="width:100%">
                    </div>
                    <div class="col-2">
                        <div class="form-container">
                            <div class="form-btn">
                                <span onclick="login()">Đăng Nhập</span>
                                <span onclick="register()">Đăng Ký</span>
                                <hr id="Indicator">
                            </div>
                            <form></form>
                                                                                <!--Đăng nhập-->
                            <form id="LoginForm" method="post" style="margin-top: -35px;">
                                <asp:Label ID="loidangnhap" runat="server" ForeColor="Red" Width="70%" Font-Size="Small"></asp:Label>
                                <input type="text" id="username" name="username" placeholder="Username">
                                <input type="password" id="Password" name="Password" placeholder="Password">

                                <input type="submit" name="dangnhap" id="dangnhap" value="Đăng Nhập" class="account-btn" onclick="checkValidate()"/>
                                <a>Quên mật khẩu</a>
                            </form>
                                                                                <!--Đăng ký-->
                            <form id="RegForm" runat="server" method="post" onsubmit="return (check())">
                                <p style="color: red; font-size:9px; text-align: center; margin-top: -50px;">
                                    <asp:Label ID="loi" runat="server"></asp:Label>
                                </p>
                                <input type="text" placeholder="Username" id="nameRegister" name="nameRegister" required="required">
                                <input type="email" placeholder="Email" id="emailRegister" name="emailRegister" required="required">
                                
                                <input type="password" placeholder="Password" id="passwordRegister" name="passwordRegister" required="required">
                                <asp:Button ID="RegisterBtn" runat="server" CssClass="account-btn" Text="Đăng Ký" OnClick="RegisterBtn_Click" />
                                <!--<button type="submit" class="account-btn">Register</button> <input class="inputregister" type="date" id="dobRegister" name="dobRegister" required="required" />-->
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <!-- JS-->
    <script>
        //Menu
        var MenuItems = document.getElementById("MenuItems");
        MenuItems.style.maxHeight = "0px";

        function menutoggle() {
            if (MenuItems.style.maxHeight == "0px") {
                MenuItems.style.maxHeight = "200px";
            } else {
                MenuItems.style.maxHeight = "0px";
            }
        }

        //Account
        var LoginForm = document.getElementById("LoginForm");
        var RegForm = document.getElementById("RegForm");
        var Indicator = document.getElementById("Indicator");

        function register() {
            RegForm.style.transform = "translateX(0px)";
            LoginForm.style.transform = "translateX(0px)";
            Indicator.style.transform = "translateX(100px)";
        }

        function login() {
            RegForm.style.transform = "translateX(300px)";
            LoginForm.style.transform = "translateX(300px)";
            Indicator.style.transform = "translateX(0px)";
        }

        function search() {
            var searchBox = document.querySelector('.search-box');
            if (searchBox.style.display == "none") {
                searchBox.style.display = "block";
            } else {
                searchBox.style.display = "none";
            }

        }
        //Register password check
        function check() {
            var name = document.getElementById("nameRegister").value;
            var pas = document.getElementById("passwordRegister");
            pas.innerText = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
            var dob = document.getElementById("dobRegister");
            var loi = document.getElementById("MainContent_loi");
            datenow = new Date();
            datedob = new Date(dob.value);
            /*if (datenow.getTime() < datedob.getTime()) {
                loi.innerText = "Vui lòng nhập đúng ngày sinh.bạn đang nhập ngày sinh lớn hơn ngày hiện tại";
                dob.focus();
                return false;
            }*/
            if (pas.value.length < 5) {
                loi.innerText = "Password has to have from 5 chars above!";
                pas.focus();
                return false;
            }
           
        
            return true;
        }

        function checkValidate() {
            var username = document.getElementById('username').value;
            var password = document.getElementById('Password').value;

            if (username == '') {
                alert('Name is not empty!');
            }

            if (password == '') {
                alert('Password is not empty');
            }
        }
    </script>
   
</asp:Content>
