onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_bench_3/clk
add wave -noupdate /test_bench_3/sel
add wave -noupdate /test_bench_3/seed
add wave -noupdate /test_bench_3/rng_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1848288 ps} 0}
configure wave -namecolwidth 161
configure wave -valuecolwidth 75
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {1793888 ps} {2010848 ps}
