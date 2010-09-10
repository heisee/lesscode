function switchProfileTo(el) {
    if(el=='person') {
        otherEl='company'
    } else {
        otherEl='person'
    }
    $('#profile_'+el).show();
    $('#profile_'+otherEl).hide();
}

$(".auto_search_complete").autocomplete({
    source: "/profiles/skill_suggestions.js",
    minLength: 1
});
