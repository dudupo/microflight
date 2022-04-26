import datetime 
import numpy as np

RELEVANTLINES   = 7
DELIMETR        ='\t'
RELEVENTFIELD   = 1


def load_file(_filepath):

    lines = open(_filepath).readlines()
    channels = len(lines[0].split('\t')) - 1

    #  4x(1+channels) matrix, the first column is the the time,
    # the others are the  channels measurements. 
    ret = [ ] 

    for line in lines[RELEVANTLINES:]:
        fields = line.split('\t')
        mea_time = datetime.datetime.strptime( fields[0], "%m/%d/%Y %H:%M:%S %p.%f") 
        if len(ret) > 0:
            mea_time = mea_time - ret[0][0] 
            mea_time = float(mea_time.total_seconds())
        ret.append( [mea_time] + [float(_) for _ in fields[RELEVENTFIELD:]]  )
    
    ret[0][0] = 0
    return np.array(ret)


if __name__ == "__main__":
    
    matrix = load_file("C:\\Users\\davidponar\\Desktop\\recording\\26_04_22-14_36_37.txt")
    print(matrix)

    # from pywinauto.application import Application
    # app = Application().start("C:\\Program Files\\BlueDAQ\\BlueDAQ.exe")
    # app.menu_select("Help->About")