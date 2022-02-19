#!/usr/bin/wish
#
# the "pathbox" is a list of paths, which goes in $config(liblist)
# We may also want to re-use this code for the list of stuff in
# 
proc do_pb_delete {} {
    set sel [.pb.pathbox curselection]
    if { $sel ne "" } {
	set se [lindex $sel 0]
	.pb.pathbox del $se
	.pb.pathbox selection clear 0 end
    }
}

proc do_pb_add {} {
    global config
    set lib [tk_chooseDirectory -title "Choose library directory" -initialdir $config(library) ]
    if { $lib ne "" } {
	.pb.pathbox insert end $lib
    }
    raise .pb
}

proc do_pb_ok {} {
    global config

    set config(liblist) [.pb.pathbox get 0 end]
    destroy .pb
}

proc do_pb_create {} {
    global config
    
    toplevel .pb
    listbox .pb.pathbox -width 72
    scrollbar .pb.sb -command [list .pb.pathbox yview]
    .pb.pathbox configure -yscrollcommand [list .pb.sb set]
    foreach i $config(liblist) {
	.pb.pathbox insert end $i
    }
    frame .pb.buttons
    ttk::button .pb.buttons.ok -text "OK" -command do_pb_ok
    ttk::button .pb.buttons.add -text "Add..." -command do_pb_add
    ttk::button .pb.buttons.delete -text "Delete" -command do_pb_delete

    grid .pb.buttons.ok .pb.buttons.add .pb.buttons.delete
    grid columnconfigure .pb.buttons 0 -weight 1
    grid rowconfigure .pb.buttons 0 -weight 1

    grid .pb.pathbox .pb.sb -sticky nsew
    grid .pb.buttons
    grid columnconfigure .pb 0 -weight 1
    grid rowconfigure .pb 0 -weight 1
}
