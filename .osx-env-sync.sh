grep "^export PATH" "$HOME/.bash_profile" "$HOME/.path" "$HOME/.extra" 2>/dev/null | while IFS=' =' read ignoreexport envvar ignorevalue; do
  launchctl setenv ${envvar} "${!envvar}"
done
