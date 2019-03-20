// Initial wiring: [4, 7, 2, 1, 8, 3, 6, 0, 5]
// Resulting wiring: [4, 7, 2, 1, 8, 3, 6, 0, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[1], q[2];
cx q[3], q[4];
cx q[0], q[5];
cx q[6], q[7];
cx q[7], q[6];
cx q[6], q[5];
cx q[1], q[0];
