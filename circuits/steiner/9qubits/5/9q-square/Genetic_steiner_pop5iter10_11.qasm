// Initial wiring: [2, 1, 3, 4, 6, 0, 8, 7, 5]
// Resulting wiring: [2, 1, 3, 4, 6, 0, 8, 7, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[5], q[6];
cx q[4], q[5];
cx q[5], q[6];
cx q[6], q[7];
cx q[4], q[7];
cx q[7], q[4];
cx q[8], q[3];
cx q[1], q[0];
