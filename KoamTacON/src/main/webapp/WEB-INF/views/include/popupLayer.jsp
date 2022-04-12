<div id="dim-layer-secu" class="dim-layer">
    <div id="dimBgSecu" class="dimBg"></div>
    <div id="secu-layer" class="pop-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="secuDiv">
                    <form id="frmSecuPop" method="post">
                        <input type="hidden" id="secuRsaPublicKeyModulus" name="secuRsaPublicKeyModulus" value="">
                        <input type="hidden" id="secuRsaPublicKeyExponent" name="secuRsaPublicKeyExponent" value="">
                        <input type="hidden" id="encSecuPassword" name="encSecuPassword" value="">
                        <div class="row uniform">
                            <div class="12u 12u$(small)">
                                <input type="password" name="secuPassword" id="secuPassword" value="" placeholder="Password" required="required" />
                            </div>
                            <div class="12u 12u$">
                                <ul class="actions vertical">
                                    <li><input type="button" name="btnCheckSecu" id="btnCheckSecu" value="Submit" class="button special fit" /></li>
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closeSecuPopup" class="btn-layerClose">Close</a>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="dim-layer-msg" class="dim-layer">
    <div id="dimBgMsg" class="dimBg"></div>
    <div id="message_layer" class="pop-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <div id="messageDiv" >
                    <p class="ctxt mb20">Thank you.<br>
                     Your registration was submitted successfully.
                    </p>
                </div>
                
                <!--// content-->
                <div class="btn-r">
                    <a href="#" id="closePopup" class="btn-layerClose">Close</a>
                </div>
            </div>
        </div>
    </div>
</div>