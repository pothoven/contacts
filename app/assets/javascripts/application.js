//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require jquery.jsocial
//= require_self
//= require_tree .

// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function remove_item(element) {
	$(element).parentsUntil('.vcard_item').parent('.vcard_item').remove();
}


