#!/bin/bash

#####
# Define user home as in future, it won't always be root
PROJECTHOME="/opt/projects"
HOME="/opt/projects"
#####
# Create required user cache directories
mkdir -p $PROJECTHOME/.local/share
mkdir -p $PROJECTHOME/.config/cherrytree

#####
# sleep and wait cycle
sleep 2
sync; sync; sync;
sleep 2
sync; sync; sync;
sleep 2

#####
# Set the cherrytree config file content
cat <<EOF > $PROJECTHOME/.config/cherrytree/config.cfg
[state]
file_dir = /opt/projects
toolbar_visible = True
win_is_maximized = False
win_position_x = 564
win_position_y = 61
win_size_w = 963
win_size_h = 630
hpaned_pos = 170
tree_visible = True
node_path = 0
cursor_position = 0
pick_dir_import = 
pick_dir_export = 
pick_dir_file = 
pick_dir_img = 
pick_dir_csv = 
pick_dir_cbox = 
link_type = webs
show_node_name_header = True
nodes_on_node_name_header = 6
toolbar_icon_size = 1

[tree]
rest_exp_coll = 0
expanded_collapsed_string = 1,False_2,False_3,False_4,False_5,False_6,False_7,False
nodes_bookm_exp = False
nodes_icons = c
aux_icon_hide = False
default_icon_text = 25
tree_right_side = False
cherry_wrap_width = 130
tree_click_focus_text = False
tree_click_expand = False

[editor]
syntax_highlighting = custom-colors
auto_syn_highl = sh
style_scheme = cobalt
spell_check_lang = en_US
enable_spell_check = True
show_line_numbers = True
spaces_instead_tabs = True
tabs_width = 4
anchor_size = 16
embfile_size = 48
embfile_show_filename = True
embfile_max_size = 10
line_wrapping = True
auto_smart_quotes = False
wrapping_indent = -14
auto_indent = True
rt_show_white_spaces = False
pt_show_white_spaces = True
rt_highl_curr_line = True
pt_highl_curr_line = True
space_around_lines = 0
relative_wrapped_space = 50
h_rule = ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
special_chars = “”„‘’•◇▪▸☐☑☒★…‰€©®™°↓↑→←↔↵⇓⇑⇒⇐⇔»«▼▲►◄≤≥≠≈±¹²³½¼⅛×÷∞ø∑√∫ΔδΠπΣΦΩωαβγεηλμ☺☻☼♥♣♦✔♀♂♪♫✝
selword_chars = .-@
chars_listbul = •◇▪-→⇒
chars_toc = ▸•◇▪
latest_tag_prop = 
latest_tag_val = 
timestamp_format = "%Y/%m/%d - %H:%M"
links_underline = True
links_relative = False
weblink_custom_action = Falsefirefox %s &
filelink_custom_action = Falsexdg-open %s &
folderlink_custom_action = Falsexdg-open %s &

[codebox]
codebox_width = 700
codebox_height = 100
codebox_width_pixels = True
codebox_line_num = False
codebox_match_bra = True
codebox_syn_highl = plain-text
codebox_auto_resize = False

[table]
table_rows = 3
table_columns = 3
table_column_mode = rename
table_col_min = 40
table_col_max = 60

[fonts]
rt_font = Sans 9
pt_font = Sans 9
tree_font = Sans 8
code_font = Monospace 9

[colors]
rt_def_fg = #ffffff
rt_def_bg = #001b33
tt_def_fg = #0b0c0c
tt_def_bg = #e0e0e0
monospace_bg = #7f7f7f
palette_list = #000000:#ffffff:#7f7f7f:#ff0000:#a020f0:#0000ff:#add8e6:#00ff00:#ffff00:#ffa500:#e6e6fa:#a52a2a:#8b6914:#1e90ff:#ffc0cb:#90ee90:#1a1a1a:#4d4d4d:#bfbfbf:#e5e5e5
col_link_webs = #00008989ffff
col_link_node = #071c838e071c
col_link_file = #8b8b69691414
col_link_fold = #7f7f7f7f7f7f

[misc]
toolbar_ui_list = tree_add_node,tree_add_subnode,separator,go_node_prev,go_node_next,separator,*,ct_save,export_pdf,separator,find_in_allnodes,separator,handle_bull_list,handle_num_list,handle_todo_list,separator,handle_image,handle_table,handle_codebox,handle_embfile,handle_link,handle_anchor,separator,fmt_rm,fmt_color_fg,fmt_color_bg,fmt_bold,fmt_italic,fmt_underline,fmt_strikethrough,fmt_h1,fmt_h2,fmt_h3,fmt_small,fmt_superscript,fmt_subscript,fmt_monospace
systray = True
start_on_systray = False
use_appind = True
autosave = True
autosave_val = 1
check_version = True
word_count = True
reload_doc_last = True
mod_time_sent = True
backup_copy = True
backup_num = 3
autosave_on_quit = True
limit_undoable_steps = 20
journal_day_format = %d %a

[keyboard]

[codexec_term]

[codexec_type]

[codexec_ext]

EOF

#####
# sleep and wait cycle
sleep 2
sync; sync; sync;
sleep 2
sync; sync; sync;
sleep 2

exit 0

