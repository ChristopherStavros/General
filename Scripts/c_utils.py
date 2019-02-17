
import os, sys

'''variables'''
script_path = os.path.dirname(sys.argv[0])
if script_path[-1:]=='\\':
    script_path = script_path.strip('\\')


'''functions'''
def dir(folder):
    lst = []
    for foldername, subfolder, filenames in os.walk(folder):
        for file in filenames:
            f = os.path.join(foldername, file)
            lst.append(f)
            print(f)
    return lst