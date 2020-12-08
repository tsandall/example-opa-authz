package system.authz

default allow = false

allow {
    input.method == "POST"
    input.path == ["v1", "data", "example", "echo"]
    app_owners[input.body.input.app] == input.identity
}

app_owners := {
    "foo": "alice",
    "bar": "bob",
}