$(document).ready ->
  $('#user_conf_user_name').autocomplete({source: "/ajax/users"})
