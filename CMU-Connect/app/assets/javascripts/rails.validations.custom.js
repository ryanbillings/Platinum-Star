clientSideValidations.validators.remote['andrew'] = function(element, options) {
  if ($.ajax({
    url: '/validators/andrew.json',
    data: { id: element.val() },
    // async *must* be false
    async: false
  }).status == 404) { return options.message; }
}
