// EXPECTED_REWIRING [0 1 2 3 7 5 6 4 8]
// CURRENT_REWIRING [0 1 2 4 7 5 6 3 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
rz(-1.5707963267948966*pi) q[8];
rx(1.5707963267948966*pi) q[8];
cz q[8], q[3];
rz(-1.5707963267948966*pi) q[4];
rx(1.5707963267948966*pi) q[4];
cz q[4], q[1];
rz(3.141592653589793*pi) q[1];
rz(2.5746205493519536*pi) q[3];
rx(1.5707963267948966*pi) q[3];
rz(2.1852726301212035*pi) q[3];
rx(-1.5707963267948966*pi) q[3];
rz(0.7528786421718403*pi) q[4];
rx(1.5707963267948966*pi) q[4];
rz(0.8615850853884033*pi) q[4];
rx(-1.5707963267948966*pi) q[4];
rz(-1.1755590516102494*pi) q[4];
cz q[4], q[3];
rz(-1.0709397404153753*pi) q[3];
rx(1.5707963267948966*pi) q[3];
rx(-1.5707963267948966*pi) q[4];
cz q[4], q[3];
rx(-1.5707963267948966*pi) q[3];
rx(1.5707963267948966*pi) q[4];
cz q[4], q[3];
rz(-1.5707963267948966*pi) q[6];
rx(1.5707963267948966*pi) q[6];
cz q[6], q[7];
rz(-2.3671251090347027*pi) q[4];
rx(1.5707963267948966*pi) q[4];
rz(1.741015432735895*pi) q[4];
rx(-1.5707963267948966*pi) q[4];
cz q[4], q[1];
rz(-1.5707963267948966*pi) q[5];
rx(1.5707963267948966*pi) q[5];
rx(-1.5707963267948966*pi) q[6];
cz q[5], q[6];
rz(3.141592653589793*pi) q[1];
rz(-0.8019051056875961*pi) q[3];
rx(1.5707963267948966*pi) q[3];
rz(0.8066623120848482*pi) q[3];
rx(-1.5707963267948966*pi) q[3];
rz(2.896301154950409*pi) q[3];
rz(-2.3267419137916523*pi) q[4];
rx(1.5707963267948966*pi) q[4];
rz(-1.5707963267948966*pi) q[4];
rx(-1.5707963267948966*pi) q[5];
rz(1.5707963267948966*pi) q[5];
rz(-1.5707963267948966*pi) q[6];
rz(3.141592653589793*pi) q[7];
rx(-1.5707963267948966*pi) q[8];
rz(1.5707963267948966*pi) q[8];