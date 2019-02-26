// Initial wiring: [4, 3, 8, 6, 1, 7, 5, 2, 0]
// Resulting wiring: [4, 3, 8, 6, 1, 7, 5, 2, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[3], q[4];
cx q[2], q[3];
cx q[0], q[5];
cx q[3], q[8];
cx q[2], q[3];
cx q[7], q[8];
cx q[3], q[8];
