import numpy as np
import matplotlib.pyplot as plt

# NTC103F397F datasheet
d_T = np.array(np.arange(-40, 121, 5))
d_R = np.array([333.110, 240.704, 175.794, 129.707, 96.646, 72.691, 55.169, 42.234, 32.6,
                25.364, 19.886, 15.705, 12.490, 10.0, 8.0584, 6.5341, 5.3297, 4.3722,
                3.6065, 2.9906, 2.4925, 2.0875, 1.7565, 1.4848, 1.2605, 1.0746, 0.91983,
                0.79042, 0.68178, 0.59020, 0.51271, 0.44690, 0.39080])
d_B = 3970
d_T0 = 273.15 + 25
d_R0 = 10

# B parameter equation
b_T = 1/d_T0 - (1/d_B)*np.log(d_R0) + (1/d_B)*np.log(d_R)

# Steinhart–Hart equation
s_T = b_T + 0.000000254 * (np.log(d_R)**3)
s_T = 1/s_T - 273.15

b_T = 1/b_T - 273.15

# B, SH
plt.figure(1)
plt.plot(d_T, d_R, label="datasheet", marker='*')
plt.plot(b_T, d_R, label="B equ")
plt.plot(s_T, d_R, label="SH equ")
plt.yscale('log')
plt.grid()
plt.legend()
plt.xlabel(r"$\degree C$")
plt.ylabel(r"$k\Omega$")

# find optimal resistan
plt.figure(2)
for R in [3, 5, 10, 20]:
    T_v = d_R*5/(R+d_R)
    plt.plot(d_T, T_v, label=r"{0} $k\Omega$".format(R))
plt.xticks(np.arange(-40, 121, 10))
plt.yticks(np.arange(0, 5.1, 0.2))
plt.grid()
plt.xlabel(r"$\degree C$")
plt.ylabel("V")
plt.legend()
plt.show()
