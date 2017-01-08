<div class="row" id="contRow" >
    <div class="col-xs-12 col-sm-6 col-md-4 col-sm-offset-3 col-md-offset-4" >
        <ul class="faicons" style="margin: 0 auto !important">
            <li class="faspot_1"><a href=""><i class="fa fa-linkedin fa-3x"></i></a></li>
            <li class="faspot_2"><a href=""><i class="fa fa-facebook fa-3x"></i></a></li>
            <li class="faspot_3"><a href=""><i class="fa fa-twitter fa-2x"></i></a></li>
            <li class="faspot_4"><a href=""><i class="fa fa-google-plus fa-2x"></i></a></li>
            <li class="faspot_5"><a href=""><i class="fa fa-reddit fa-2x"></i></a></li>
            <li class="faspot_6"><a href="https://github.com/anik93"><i class="fa fa-git fa-2x"></i></a></li>
        </ul>
    </div>
</div>
<script>
	$(document).ready(function(){
   		$("#contact").addClass('active');
	});
</script>
<style>

#contRow {
    margin-bottom: 70px;
}

.faicons {
    position: relative;
    height: 3em;
    width: 13.5em;
    text-align: center;
    padding-top: 110px;
}

.faicons li {
    display: block;
    height: 4em;
    line-height: 4em;
    margin: -2.2em;
    position: absolute;
    -webkit-transition: -webkit-transform .7s;
    -moz-transition: -moz-transform .7s;
    -ms-transition: -ms-transform .7s;
    -o-transition: -o-transform .7s;
    transition: transform 0.7s;
    -webkit-transform: rotate(45deg);
    -moz-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    -o-transform: rotate(45deg);
    transform: rotate(45deg);
    text-align: center;
    width: 4em;
}

.faicons a {
    color: #fffdf0;
    display: block;
    height: 4em;
    line-height: 6em;
    text-align: center;
    -webkit-transform: rotate(-45deg);
    -moz-transform: rotate(-45deg);
    -ms-transform: rotate(-45deg);
    -o-transform: rotate(-45deg);
    transform: rotate(-45deg);
    width: 4em;
}

.faicons li:hover {
    -webkit-transform: scale(1.3,1.3) rotate(-35deg);
    -moz-transform: scale(1.3,1.3) rotate(-35deg);
    -ms-transform: scale(1.3,1.3) rotate(-35deg);
    -o-transform: scale(1.3,1.3) rotate(-35deg);
    transform: scale(1.3,1.3) rotate(-35deg);
}

.faspot_1 {
    background: #1A85BC;
    left: 0;
    top: 50%;
}

.faspot_2 {
    background: #02aaf8;
    top: 75;
    left: 25%;
}

.faspot_3 {
    background: #5EA9DD;
    left: 50%;
    top: 50%;
}

.faspot_4 {
    background: #DC4A38;
    top: 75;
    left: 75%;
}

.faspot_5 {
    background: #FF4500;
    left: 100%;
    top: 50%;
}

.faspot_6 {
    background: #000000;
    top: 75;
    left: 125%;
}

</style>