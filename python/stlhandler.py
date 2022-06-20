
'''
facet normal ni nj nk
    outer loop
        vertex v1x v1y v1z
        vertex v2x v2y v2z
        vertex v3x v3y v3z
    endloop
endfacet
'''

from unittest import registerResult
import numpy as np
import networkx as nx

eX,eY,eZ = np.array([1,0,0]),\
     np.array([0,1,0]), np.array([0,0,1]) 

class STLTriangle():
    def __init__(self) -> None:
        pass

class SolidObject():
    def __init__(self) -> None:
        pass


    def trianglize(self) ->None:
        pass 

def StlTriangles(vectors):
    normal = lambda z1, z2, z3  :\
         np.cross(z2 - z1, z3 - z1) / np.linalg.norm(np.cross(z2 - z1, z3 - z1))  
    vectostr = lambda vec : " ".join(map( str , vec.tolist()))
    facetosr = lambda tri : "\n\t\t".join( [f"vertex {vectostr(p)}" for p in tri])
    
    def handletrig(tri):
        n = normal(*tri)
        ret = f"facet normal {vectostr(n)}\n\
    outer loop\n\
        {facetosr(tri)}\n\
    endloop\n\
endfacet\n" 
        return ret
    return "".join(list(map( handletrig, vectors))) 




def pm( func ):
    def returnfunc(x):
        return (func(x), func(-x))
    return returnfunc  

def requsrive_pm( func, depth, input):
    def returnfunc (x):
        if depth >= 0:
            ret  = requsrive_pm( func, depth - 1, x) 
            x[depth] *= -1
            ret += requsrive_pm( func, depth - 1, x)
            x[depth] *= -1 #uncompute
            return ret 
        else:
            return [func(*x)]
    return returnfunc(input)
    
def rectangle(u, v, n=eZ):
    delta = np.cross(v-u,n)
    mid = (u + v)/2
    z,w = pm( lambda x :  mid + 0.5 * x )( delta ) 
    return [ [u, z, v], [u, w, v] ]


def cynlander(center, r, h):
    N = 12

    x = np.cos(2*np.pi* np.arange(N)/N)
    y = np.sqrt(1- x**2)
    x *= r 
    y *= r 
    y[int(len(y)/2 +1):] *= -1

    
    _l = pm( lambda hh :  list(map( lambda u : center +  np.array([u[0],u[1]\
         ,hh/2]), zip(x,y))))(h)
    
    
    def up_down_faces_trigs():
        ret = []
        for sign ,_points in zip( [1,-1], _l) :
            for j in range(N-1):
                ret.append( [ _points[j] , _points[j+1] ,center + sign* np.array( [0,0,h/2]) ] )
            ret.append( [ _points[-1] , _points[0] , center + sign* np.array( [0,0,h/2]) ] )
        return ret

    def sidfaces():
        ret = [  ]
        for j in range(N-1):
            mid = 0.5*(_l[0][j] + _l[1][j+1])
            ret += rectangle( _l[0][j], _l[1][j+1], (mid - center)/(np.linalg.norm(mid - center)))
        return ret
    

    ret =  up_down_faces_trigs() + sidfaces()    
    print(ret)
    return ret


def qubic(center, a ,b ,h):
    ret = []
    points = requsrive_pm(lambda x,y,z : center + np.array([x,y,z]), 2, [a,b,h])
    ret += rectangle(points[0], points[3], eZ)
    ret += rectangle(points[0], points[5], eY)
    ret += rectangle(points[0], points[6], eX)
    ret += rectangle(points[3], points[5], eX)
    ret += rectangle(points[3], points[6], eY)
    ret += rectangle(points[5], points[6], eZ)
    return ret
        
    # rectangle(points[6], points[9], eY)



    # pm ( lambda x : pm (  lambda y :  center + x/2   )( a )
    # [   center - h/2 ]

    # rectangle(  )

if __name__ == "__main__":


    obj = qubic( np.array([0,0,0]), 4, 4, 4 ) +\
        qubic( np.array([20,20,20]), 4, 4, 4 )


    obj = cynlander(np.array([7,7,7]), 5,3)


    open( "newstl.stl", "w+").write(\
        "solid newstl.stl\n" +\
             StlTriangles(obj) + "endsolid newstl.stl\n" )