Echo “ … Hello Message … ”
set MODULE Mux_en_Synch
quit -sim 
vlib work
Vlog ../$MODULE.v
Vlog ../DFF_Synch.v
Vlog ../mux2.v
Vlog ../register.v
Vlog ../dff.v
Vlog ../${MODULE}_tb.v
vsim work.${MODULE}_tb
add wave *
run 200ns
Echo “Test Finished .. “
