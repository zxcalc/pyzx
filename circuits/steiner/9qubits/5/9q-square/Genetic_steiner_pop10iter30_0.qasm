// Initial wiring: [4, 5, 1, 8, 3, 2, 0, 7, 6]
// Resulting wiring: [4, 5, 1, 8, 3, 2, 0, 7, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[3], q[8];
cx q[6], q[5];
cx q[3], q[2];
cx q[1], q[0];
