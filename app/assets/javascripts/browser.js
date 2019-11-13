$(function() {
    var userAgent = window.navigator.userAgent.toLowerCase();
    if (userAgent.indexOf('msie') != -1 || userAgent.indexOf('trident') != -1) {
        // alert('We have not assure that this website would work proper with this browser\nWe highly recommend you to use Google Chrome\n as we know it is working properly.')
        // console.log('Internet Explorerをお使いですね');
    } else if (userAgent.indexOf('edge') != -1) {
        // console.log('Edgeをお使いですね');
    } else if (userAgent.indexOf('chrome') != -1) {
        // console.log('Google Chromeをお使いですね');
    } else if (userAgent.indexOf('safari') != -1) {
        $('.safari-menu-btn').css({ 'display': 'block' });
        $('.user-hidden-menu').css({ 'display': 'block' });
        $('.recipe-hidden-menu').css({ 'display': 'block' });
        $('.restaurant-hidden-menu').css({ 'display': 'block' });
        $('.chat-hidden-menu').css({ 'display': 'block' });
        $('.hidden-user-recipe').css({ 'display': 'block' });
        $('.hidden-user-review').css({ 'display': 'block' });
    } else if (userAgent.indexOf('firefox') != -1) {
        // console.log('FireFoxをお使いですね');
    } else if (userAgent.indexOf('opera') != -1) {
        // console.log('Operaをお使いですね');
    } else {
        // console.log('そんなブラウザは知らん');
    }
})