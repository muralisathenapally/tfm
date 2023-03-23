locals {
  authoritative = var.mode == "authoritative"
  additive      = var.mode == "additive"
  singular = length(var.entities) == 1

  aliased_entities = local.singular ? ["default"] : var.entities

  real_entities = var.entities

  bindings_by_role = distinct(flatten([
    for name in local.real_entities
    : [
      for role, members in var.bindings
      : { name = name, role = role, members = members, condition = { title = "", description = "", expression = "" } }
    ]
  ]))

  bindings_by_conditions = distinct(flatten([
    for name in local.real_entities
    : [
      for binding in var.conditional_bindings
      : { name = name, role = binding.role, members = binding.members, condition = { title = binding.title, description = binding.description, expression = binding.expression } }
    ]
  ]))

  all_bindings = concat(local.bindings_by_role, local.bindings_by_conditions)

  bindings_by_member = distinct(flatten([
    for binding in local.all_bindings
    : [
      for member in binding["members"]
      : { name = binding["name"], role = binding["role"], member = member, condition = binding["condition"] }
    ]
  ]))

  keys_authoritative = distinct(flatten([
    for alias in local.aliased_entities
    : [
      for role in keys(var.bindings)
      : "${alias}--${role}"
    ]
  ]))

  keys_authoritative_conditional = distinct(flatten([
    for alias in local.aliased_entities
    : [
      for binding in var.conditional_bindings
      : "${alias}--${binding.role}--${binding.title}"
    ]
  ]))

  keys_additive = distinct(flatten([
    for alias in local.aliased_entities
    : [
      for role, members in var.bindings
      : [
        for member in members
        : "${alias}--${role}--${member}"
      ]
    ]
  ]))

  keys_additive_conditional = distinct(flatten([
    for alias in local.aliased_entities
    : [
      for binding in var.conditional_bindings
      : [
        for member in binding.members
        : "${alias}--${binding.role}--${binding.title}--${member}"
      ]
    ]
  ]))

  all_keys_authoritative = concat(local.keys_authoritative, local.keys_authoritative_conditional)

  all_keys_additive = concat(local.keys_additive, local.keys_additive_conditional)

  bindings_authoritative = (
    local.authoritative
    ? zipmap(local.all_keys_authoritative, local.all_bindings)
    : {}
  )

  bindings_additive = (
    local.additive
    ? zipmap(local.all_keys_additive, local.bindings_by_member)
    : {}
  )

  set_authoritative = (
    local.authoritative
    ? toset(local.all_keys_authoritative)
    : []
  )

  set_additive = (
    local.additive
    ? toset(local.all_keys_additive)
    : []
  )
}
