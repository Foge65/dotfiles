(call_expression
  function: (member_expression
    object: (member_expression
      object: (this)
      property: (property_identifier) @_db)
    property: (property_identifier) @_method (#eq? @_method "query"))
  arguments: (arguments
    (template_string) @injection.content)
  (#set! injection.language "sql")
  (#set! injection.include-children))

