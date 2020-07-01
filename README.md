# stupid terraform tricks

mostly just a demo of a Makefile that makes terraform slightly less
intolerable

## explanation

terraform is great for really trivial examples but kind of falls apart when
you get into multiple environments with multiple backends. this is a Makefile
to simplify a lot of the housekeeping involved with using terraform under those
conditions

the [Makefile is here](secrets/Makefile)

to use it drop it in a module directory, setup `vars` and `backends` directories
that contain `.tfvars` files with identical names (so `vars/foo.tfvars` and
`backends/foo.tfvars`) and run `make plan` or `make apply`. reset the plan (in
case it goes stale) with `make clean` and remove local state  (including
external modules) with `make clean-all`. to generate a single plan use
`make .terraform/foo.plan` and to apply a single env use `make foo`

it works by creating a seperate `TF_DATA_DIR` for each env (under .terraform)
with a name derived from the `vars/backends` files pair

this demo uses s3 as the state store, but you can replace it with whatever and
everything should still work
