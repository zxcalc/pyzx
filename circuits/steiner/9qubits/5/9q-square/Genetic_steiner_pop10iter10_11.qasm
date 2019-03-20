// Initial wiring: [4, 5, 0, 1, 3, 6, 7, 8, 2]
// Resulting wiring: [4, 5, 0, 1, 3, 6, 7, 8, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[7];
cx q[5], q[6];
cx q[6], q[7];
cx q[3], q[8];
cx q[7], q[6];
cx q[6], q[5];
cx q[1], q[0];
