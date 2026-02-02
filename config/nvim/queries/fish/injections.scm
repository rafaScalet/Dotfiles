(command
  name: (word) @cmd
  argument: (single_quote_string) @injection.content
  (#eq? @cmd "awk")
  (#set! injection.language "awk"))

(command
  name: (word) @cmd
  argument: (single_quote_string) @injection.content
  (#match? @cmd "(jq|yq)$")
  (#set! injection.language "jq"))

(command
  name: (word) @cmd
  argument: (single_quote_string) @injection.content
  (#eq? @cmd "sed")
  (#set! injection.language "sed"))
