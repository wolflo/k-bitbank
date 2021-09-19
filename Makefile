BACKEND := java
SPEC_DIR := specs

specs := $(wildcard $(SPEC_DIR)/*.k)

$(SPEC_DIR)/%.k.prove: $(SPEC_DIR)/%.k
	kevm prove --backend $(BACKEND) $< VERIFICATION --smt-prelude specs/axioms/evm.smt2 --z3-cnstr-timeout 100

prove: $(SPEC_DIR)/$(spec).k.prove; $<
prove-all: $(specs:=.prove)
