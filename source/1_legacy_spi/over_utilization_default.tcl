namespace eval default {
  proc show_available_area {} {

    # available area
    set show_available_area true
    set ad "availabe area for default plane"; # description
    set ac "green"; # color
    set ap "DiagCrossPattern"; # pattern
    set aw 1; # width

    # partially blocked area (is included in available area)
    set show_partially_blocked_area true
    set pd "partially blocked area for default plane"; # description
    set pc "lightgreen"; # color
    set pp "DiagCrossPattern"; # pattern
    set pw 1; # width

    if { $show_available_area } {
      set available_rects {
        {{0 16.8} {18.944 18.6}}
        {{8.362 16.2} {18.944 16.8}}
        {{0 16.2} {7.696 16.8}}
        {{0 14.4} {18.944 16.2}}
        {{16.576 13.8} {18.944 14.4}}
        {{9.768 13.8} {15.91 14.4}}
        {{5.846 13.8} {9.102 14.4}}
        {{0 13.8} {4.514 14.4}}
        {{0 12} {18.944 13.8}}
        {{10.582 11.4} {18.944 12}}
        {{0.592 11.4} {9.25 12}}
        {{0 11.4} {0.074 12}}
        {{13.394 10.8} {18.944 11.4}}
        {{0 10.8} {11.248 11.4}}
        {{13.69 10.2} {18.278 10.8}}
        {{11.914 10.2} {12.358 10.8}}
        {{0 10.2} {10.582 10.8}}
        {{0 8.4} {18.944 10.2}}
        {{15.91 7.8} {18.944 8.4}}
        {{0.814 7.8} {15.244 8.4}}
        {{0 7.8} {0.222 8.4}}
        {{0 6.6} {18.944 7.8}}
        {{3.7 6} {18.944 6.6}}
        {{2.368 6} {3.33 6.6}}
        {{0 6} {0.592 6.6}}
        {{0 5.4} {18.944 6}}
        {{8.436 4.8} {18.944 5.4}}
        {{2.516 4.8} {7.77 5.4}}
        {{0 4.8} {2.146 5.4}}
        {{0 3.6} {18.944 4.8}}
        {{2.516 3} {18.944 3.6}}
        {{0 3} {0.74 3.6}}
        {{4.44 2.4} {18.944 3}}
        {{0 2.4} {2.664 3}}
        {{5.032 1.8} {18.944 2.4}}
        {{0 1.8} {3.7 2.4}}
        {{9.842 1.2} {18.944 1.8}}
        {{0 1.2} {9.324 1.8}}
        {{10.286 0.6} {18.944 1.2}}
        {{0 0.6} {9.472 1.2}}
        {{0 0} {18.944 0.6}}
      }
      foreach rect $available_rects {
        gui_add_annotation -type rectangle $rect -color $ac -width $aw -pattern $ap -info_tip "$ad"
      }
    }
    if { $show_partially_blocked_area } {
      set partially_blocked_rects {
      }
      foreach blocked_rect $partially_blocked_rects {
        set rect [lindex $blocked_rect 0]
        set blocked [lindex $blocked_rect 1]
        gui_add_annotation -type rectangle $rect -color $pc -width $pw -pattern $pp -info_tip "$blocked $pd"
      }
    }
  }
}

default::show_available_area
