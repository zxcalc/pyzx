// Initial wiring: [4, 8, 0, 6, 5, 1, 2, 7, 3]
// Resulting wiring: [4, 8, 0, 6, 5, 1, 2, 7, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[3], q[4];
cx q[7], q[8];
cx q[7], q[6];
cx q[5], q[4];
