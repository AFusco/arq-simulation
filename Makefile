
TOTAL_ITERATIONS=100
CONDOR_FILE=exercise1.condor


all:
	@echo make submit
	@echo make clean_simulations

submit: submit_int submit_fp

submit_int:
	condor_submit int.condor

submit_fp:
	condor_submit fp.condor

unify:
	./scripts/unify_output.sh > /dev/null

clean_simulations:
	rm -rf runs/*/*.{out,err}
