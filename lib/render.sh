# -*- mode: bash; tab-width: 2; -*-
# vim: ts=2 sw=2 ft=bash noet

# template(3)
#
# $1 = source
# $2 = destination
# $3 = JSON|YAML payload
#
# Renders a mustache template from the templates directory and persists the
# result at (destination). The payload provided is passed to mustache.
template() {
  if [[ "$2" = "-" ]]; then
    echo "${3}" | mustache - ${engine_template_dir}/${1}
  else
    echo "${3}" | mustache - ${engine_template_dir}/${1} > $2
  fi
}

# template_file(2)
#
# $1 = source
# $2 = destination
#
# Copies a file from the files directory to the specified destination.
template_file() {
  cp -f ${engine_file_dir}/${1} $2
}
