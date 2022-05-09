import datetime 
import numpy as np

RELEVANTLINES   = 7
DELIMETR        ='\t'
RELEVENTFIELD   = 1


#tasks:
'''
    figuring out how to set the zero offest. why the values are negative. 
    what is the meaning of the gain. what would destroy the sensor, (in force manner)
    and to check waht the sacels of the screws. 
'''

'''
    yaron : 
        (1) Each load cell has calibrated with diffrent channel into the bridge.
            for example 1193925 -> 4. (should check before telling tesvi).
        (2) And that why we shouldn't deal with the gain of bridge.
        (3) All the screws are in mm. 
        (4) Can tolrate without getting demage up to 1.5x range  (in our case 7.5[N])
        (5)  
'''


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
    return np.array(ret).transpose()


if __name__ == "__main__":
    
    data = load_file("C:\\Users\\davidponar\\Desktop\\recording\\09_05_22-10_28_41.txt")


    from matplotlib import pyplot as plt
    # matrix = matrix.trans
    
    
    def plot_time_slice(matrix, axs):    
        for j in range(1,5):
            axs.plot(matrix[0], matrix[j])
        axs.legend( ["channel {0}".format(_) for _ in range(1,5)] )
        
    fig, axs = plt.subplots(3, figsize=(12, 8))
    fig.suptitle('Lisening to all channels')
    plot_time_slice(data[:,300:330], axs[0])
    plot_time_slice(data[:,-30:-1], axs[1])
    plot_time_slice(data, axs[2])
    plt.savefig("C:\\Users\\davidponar\\Desktop\\recording\\09_05_22-10_28_41.svg")
    # print(matrix)

    # from pywinauto.application import Application
    # app = Application().start("C:\\Program Files\\BlueDAQ\\BlueDAQ.exe")
    # app.menu_select("Help->About")