TESTS_PATH?=../tests
TESTS_TYPE?=unit_tests
HDL_PATH?=../../pipe/src
SCRIPTS_PATH?=../scripts
PROG?=add
#RUN_DIR?=$(PROG)_sim
RUN_DIR?=test_sim
SV_TEST?=wiscv_tb
HDL_TOP = $(SV_TEST)
MODE?=pipe
REGR_TL?=unit_tests
NO_DUT?=0
MEM_MODE?=fixed
WAVES?=0
#HDL_FILES += +incdir+../riscv-tests

ifneq ("$(wildcard $(SV_TEST).sv)","")
  HDL_FILES += $(SV_TEST).sv -f ../riscv.f
else
  HDL_FILES += $(SV_TEST).v -f ../riscv.f
endif


ifeq ("$(MODE)","pipe")
  SV_ARGS += "+define+PIPE"
  export HDL_PATH=../../pipe/src
else ifeq ("$(MODE)","nopipe")
  SV_ARGS += "+define+NO_PIPE"
  export HDL_PATH=../../nopipe/src
else ifeq ("$(MODE)","nodut")
  SV_ARGS += "+define+NO_DUT"
  HDL_FILES = $(SV_TEST).sv riscv_reg_comp_if.sv
  NO_DUT = 1
endif

ifeq ("$(MEM_MODE)","fixed")
  SV_ARGS += "+define+FIXED_LATENCY"
else ifeq ("$(MEM_MODE)","variable")
  SV_ARGS += "+define+VARIABLE_LATENCY"
else ifeq ("$(MEM_MODE)","cache")
  SV_ARGS += "+define+CACHE"
endif

ifneq ("$(WAVES)", "0")
  SV_ARGS += "+define+WAVES"
endif

clean : 
	@rm -rf $(RUN_DIR); rm -rf work; rm -rf transcript; rm -rf vsim.wlf;


create_dir :
	@mkdir -p $(RUN_DIR); cp $(SCRIPTS_PATH)/* $(RUN_DIR)/; 

c_compile :
	@cp $(TESTS_PATH)/*/$(PROG).* $(RUN_DIR)/;
	@cd $(RUN_DIR); ./wiscv_prog_to_hex.sh $(PROG);
	@cd -;
             
               
	
sv_compile :
	@cp *.sv $(RUN_DIR); cp *.v $(RUN_DIR); cp modelsim.ini $(RUN_DIR);
	@cd $(RUN_DIR); echo "MODE = $(MODE) $(SV_ARGS)"; vlog +sv $(HDL_FILES) $(SV_ARGS); 
	@cd -;

compile : c_compile sv_compile

sim : 
	@cd $(RUN_DIR); vsim $(HDL_TOP) -c -do "run -all; quit;" ; cp transcript $(PROG)_run.log; cd -;

check : 
	@grep -n "ERROR" $(RUN_DIR)/transcript; /usr/bin/test "$$?" -eq 1
	@grep -n "Errors: 0" $(RUN_DIR)/transcript; /usr/bin/test "$$?" -eq 0
	@if [ $(NO_DUT) -eq 0 ]; then \
	    diff $(RUN_DIR)/REF.* $(RUN_DIR)/DUT.* > /dev/null 2>&1  || (echo "STATUS : RELAX_PASS"; exit 1;);\
	else\
	     echo "NO DUT MODE STATUS : PASS"; \
	fi
	@echo "STATUS : PASS";

all : clean create_dir compile sim check

all_regr : clean create_dir sv_compile run_regr check_regr
	   
run_regr :
	@./run_regr.sh $(TESTS_PATH)/testlists/$(REGR_TL).tl $(RUN_DIR) $(NO_DUT)
check_regr :
	@echo "**************************************************************";
	@echo "\t\t TESTLIST : $(REGR_TL)";
	@grep "STATISTICS" $(RUN_DIR)/regression_summary.log;
	@echo "**************************************************************";

clean_all :
	@rm -rf *_sim;
