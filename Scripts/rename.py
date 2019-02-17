import os, sys, shutil

script_path = os.path.dirname(sys.argv[0])
if script_path[-1:]=='\\':
    script_path = script_path.strip('\\')

for f in os.listdir(script_path):
    if 'notes_' in f:
        shutil.copy2('{}/{}'.format(script_path, f), '{}/{}'.format(script_path, f.replace('notes_', '')))
        #os.rename('{}/{}'.format(script_path, f), '{}/{}'.format(script_path, f.replace('notes_', ''))