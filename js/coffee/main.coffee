# preLoadImgs = ['./images/cargando.gif']
$window = $(window)

jQuery ->
    bootstrap()
    if typeof preLoadImgs  != 'undefined'
        preLoad()
    responsive()
    offCanvas($('#btn-offcanvas'), $('#row-offcanvas'));

$window
    .on
        load: () ->
        resize: () ->
            responsive()
        scroll: () ->

preLoad = () ->
    for i in preLoadImgs
        $('<img />').attr src: preLoadImgs

bootstrap = () ->
    if navigator.userAgent.match(/IEMobile\/10\.0/)
        msViewportStyle = document.createElement ('style')
        msViewportStyle.appendChild (document.createTextNode ('@-ms-viewport{width:auto!important}'))
        document.querySelector ('head').appendChild (msViewportStyle)

    nua       = navigator.userAgent
    isAndroid = (nua.indexOf ('Mozilla/5.0') > -1 && nua.indexOf ('Android ') > -1 && nua.indexOf ('AppleWebKit') > -1 && nua.indexOf ('Chrome') == -1)

responsive = () ->
    width = $window.width()

    if width >= 1185
        return lg()
    if width >= 977
        return md()
    if width >= 753
        return sm()
    xs()

lg = () ->
md = () ->
sm = () ->
xs = () ->

###################
###### RIOT #######
###################

riot.mount "*"
