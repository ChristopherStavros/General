sudo apt-get install devilspie
mkdir -p ~/.devilspie
nano ~/.devilspie/vscode_transparent.ds


( if
( contains ( window_class ) "code-insiders" )
( begin
( spawn_async (str "xprop -id " (window_xid) " -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY 0xdfffffff") )
)
)

