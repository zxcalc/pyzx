// Initial wiring: [7, 8, 2, 4, 6, 3, 1, 0, 5]
// Resulting wiring: [7, 8, 2, 4, 6, 3, 1, 0, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[0], q[1];
cx q[3], q[4];
cx q[4], q[5];
cx q[0], q[5];
cx q[5], q[6];
cx q[6], q[7];
cx q[5], q[6];
cx q[6], q[7];
cx q[3], q[8];
cx q[5], q[4];
