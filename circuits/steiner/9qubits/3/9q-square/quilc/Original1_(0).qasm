// EXPECTED_REWIRING [0 1 3 8 2 5 6 7 4]
// CURRENT_REWIRING [0 1 3 8 2 5 6 7 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
rz(-1.5707963267948966*pi) q[4];
rx(1.5707963267948966*pi) q[4];
cz q[4], q[1];
cz q[4], q[7];
cz q[4], q[3];
rz(3.141592653589793*pi) q[1];
rz(3.141592653589793*pi) q[3];
rx(-1.5707963267948966*pi) q[4];
rz(1.5707963267948966*pi) q[4];
rz(3.141592653589793*pi) q[7];
