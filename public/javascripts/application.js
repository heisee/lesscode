function switchProfileTo(el) {
    if(el=='person') {
        otherEl='company'
    } else {
        otherEl='person'
    }
    $('#profile_'+el).show();
    $('#profile_'+otherEl).hide();
}