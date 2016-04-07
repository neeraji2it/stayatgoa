
// Blue Style
if('styles-blue.css' == getUrlParam('style') ) {
    $('link[href="/assets/stylesheets/styles.css"]').attr('href','css/styles-blue.css');
    $('.navbar-brand img').attr('src', 'img/navbar-logo-blue.png');
    $('.address h2 img').attr('src', 'img/address-logo-blue.png');
}

// Green Style
if('styles-green.css' == getUrlParam('style') ) {
    $('link[href="/assets/stylesheets/styles.css"]').attr('href','css/styles-green.css');
    $('.navbar-brand img').attr('src', 'img/navbar-logo-green.png');
    $('.address h2 img').attr('src', 'img/address-logo-green.png');
}

// Orange Style
if('styles-orange.css' == getUrlParam('style') ) {
    $('link[href="/assets/stylesheets/styles.css"]').attr('href','css/styles-orange.css');
    $('.navbar-brand img').attr('src', 'img/navbar-logo-orange.png');
    $('.address h2 img').attr('src', 'img/address-logo-orange.png');
}

// Pink Style
if('styles-pink.css' == getUrlParam('style') ) {
    $('link[href="/assets/stylesheets/styles.css"]').attr('href','css/styles-pink.css');
    $('.navbar-brand img').attr('src', 'img/navbar-logo-pink.png');
    $('.address h2 img').attr('src', 'img/address-logo-pink.png');
}

// Violet Style
if('styles-violet.css' == getUrlParam('style') ) {
    $('link[href="/assets/stylesheets/styles.css"]').attr('href','css/styles-violet.css');
    $('.navbar-brand img').attr('src', 'img/navbar-logo-violet.png');
    $('.address h2 img').attr('src', 'img/address-logo-violet.png');
}

// Gray Style
if('styles-gray.css' == getUrlParam('style') ) {
    $('link[href="/assets/stylesheets/styles.css"]').attr('href','css/styles-gray.css');
    $('.navbar-brand img').attr('src', 'img/navbar-logo-gray.png');
    $('.address h2 img').attr('src', 'img/address-logo-gray.png');
}



function getUrlParam(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null){
        return null;
    }
    else{
        return results[1] || 0;
    }
}