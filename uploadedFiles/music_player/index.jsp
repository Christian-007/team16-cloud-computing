<%--
  Created by IntelliJ IDEA.
  User: Spencer
  Date: 2017/4/22
  Time: 23:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    div p{margin:0 auto;width:200px;}
    nav {
        /*margin: 80px auto;*/
        /*text-align: center;*/
    }
    nav ul ul {
        display: none;
    }

    nav ul li:hover > ul {
        display: block;
    }

    nav ul {
        background: #efefef;
        background: linear-gradient(top, #efefef 0%, #bbbbbb 100%);
        background: -moz-linear-gradient(top, #efefef 0%, #bbbbbb 100%);
        background: -webkit-linear-gradient(top, #efefef 0%,#bbbbbb 100%);
        box-shadow: 0px 0px 9px rgba(0,0,0,0.15);
        padding: 0 20px;
        border-radius: 10px;
        list-style: none;
        position: relative;
        display: inline-table;
    }
    nav ul:after {
        content: ""; clear: both; display: block;
    }

    nav ul li {
        float: left;
    }
    nav ul li:hover {
        background: #efefef;
        background: linear-gradient(top, #efefef 0%, #bbbbbb 40%);
        background: -moz-linear-gradient(top, #efefef 0%, #bbbbbb 40%);
        background: -webkit-linear-gradient(top, #efefef 0%,#bbbbbb 40%);
    }
    nav ul li:hover a {
        color: #fff;
    }

    nav ul li a {
        display: block;
        padding: 10px 12px;
        color: #4b545f;
        text-decoration: none;
    }


    nav ul ul {
        background: #efefef; border-radius: 0px; padding: 0;
        position: absolute;
        top: 100%;
    }
    nav ul ul li {
        float: none;
        border-top: 1px solid #efefef;
        border-bottom: 1px solid #efefef;
        position: relative;
    }
    nav ul ul li a {
        padding: 5px 2px;
        color: #fff;
    }
    nav ul ul li a:hover {
        background: #efefef;
    }

    nav ul ul ul {
        position: absolute;
        left: 100%;
        top:0;
    }
    a {
        position: relative;
    }
    .mid {
        text-align: center;
    }
</style>

<body>
<form>
    <fieldset style="width:30%">
        <nav class="mid">
            <ul>
                <li><a href="#">List</a>
                    <ul>
                        <li><a><input type="submit" name="button1" id="button1" value="1.mp3" onclick="a()"></a></li>
                        <li><a><input type="submit" name="button2" id="button2" value="2.mp3" onclick="b()"></a></li>
                        <li><a><input type="submit" name="button3" id="button3" value="3.mp3" onclick="c()"></a></li>
                        <li><a><input type="submit" name="button4" id="button4" value="4.mp3" onclick="d()"></a></li>
                        <li><a><input type="submit" name="button5" id="button5" value="5.mp3" onclick="e()"></a></li>
                    </ul>
                </li>
                <li><a><input type="text"  name="searchStr" id="searchStr"></a></li>
                <li><a><button id="button_text1" >Search</button></a></li>
            </ul>
        </nav>

        <div class="mid"><img src="images/05I58PIC7dW_1024.jpg" style="width:30%;position: relative;margin:auto;"></div>
        </br>

        <div class="mid"><a><audio src="<%=request.getParameter("searchStr")%>" controls="controls"  width="240" height="50" autoplay="true"  loop="true" id="MediaPlayer" name="MediaPlayer" ></audio></a></div>
    </fieldset>
</form>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function(){
        $("#button_text1").click(function(){
            var result2 = $("#searchStr").val();
        });
    });
    function a(){
        document.getElementById("searchStr").value="Music/1.mp3";
        var result2 = $("#searchStr").val();
    }function b(){
        document.getElementById("searchStr").value="Music/2.mp3";
        var result2 = $("#searchStr").val();
    }function c(){
        document.getElementById("searchStr").value="Music/3.mp3";
        var result2 = $("#searchStr").val();
    }function d(){
        document.getElementById("searchStr").value="Music/4.mp3";
        var result2 = $("#searchStr").val();
    }function e(){
        document.getElementById("searchStr").value="Music/5.mp3";
        var result2 = $("#searchStr").val();
    }
</script>