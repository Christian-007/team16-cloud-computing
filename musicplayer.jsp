<%--
  Created by IntelliJ IDEA.
  User: Spencer
  Date: 2017/4/22
  Time: 23:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div id="popView" class="player">
    <form>
        <fieldset style="width:30%">
            <div class="row">
                <div class="col-xs-3">
                    <div class="btn-group">
                      <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        List <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu">
                        <li><a><input type="submit" name="button1" id="button1" value="1.mp3" onclick="a()"></a></li>
                        <li><a><input type="submit" name="button2" id="button2" value="2.mp3" onclick="b()"></a></li>
                        <li><a><input type="submit" name="button3" id="button3" value="3.mp3" onclick="c()"></a></li>
                      </ul>
                    </div>
                </div>
                <div class="col-xs-7">
                    <a><input type="text" class="form-control" name="searchStr" id="searchStr"></a>
                </div>
                <div class="col-xs-2">
                    <a><button class="btn btn-default" id="button_text1" >Search</button></a>
                </div>
            </div>

            <br>
            <div class="midddddd">
                <img src="images/05I58PIC7dW_1024.jpg" style="width:30%;position: relative;margin:auto;">
            </div>
            
            </br>

            <div class="midddddd"><a><audio src="<%=request.getParameter("searchStr")%>" controls="controls" width="240" height="50" autoplay="true" loop="true" id="MediaPlayer" name="MediaPlayer" ></audio></a></div>
        </fieldset>
    </form>
</div>