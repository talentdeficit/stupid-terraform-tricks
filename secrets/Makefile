# find all files in ./vars
vars = $(wildcard vars/*.tfvars)

# extract env name from vars
envs := $(vars:vars/%.tfvars=%)

# derive datadir from env name
datadirs := $(envs:%=.terraform/%)

# derive plan from env name
plans := $(envs:%=.terraform/%.plan)

# module components
module := $(wildcard *.tf)

plan: init $(plans)

# apply plans in .terraform
apply: plan $(envs)

init: $(datadirs)

# remove plans
clean:
	@rm .terraform/*.plan

# remove plans and initialization data
clean-all:
	@rm -rf .terraform

# initialize each env into it's own directory under .terraform
.terraform/%: backends/%.tfvars
	@TF_DATA_DIR=$@ terraform init -backend-config=$<

# generate a plan file in .terraform per env
.terraform/%.plan: vars/%.tfvars $(module) .terraform/%
	@TF_DATA_DIR=.terraform/$* terraform plan -input=false -var-file="vars/$*.tfvars" -out=$@

# apply plans
%: .terraform/%.plan
	@TF_DATA_DIR=.terraform/$* terraform apply ".terraform/$*.plan"
