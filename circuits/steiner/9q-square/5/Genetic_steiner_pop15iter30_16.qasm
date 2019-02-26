// Initial wiring: [4, 6, 8, 5, 0, 7, 3, 2, 1]
// Resulting wiring: [4, 6, 8, 5, 0, 7, 3, 2, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[8], q[7];
cx q[6], q[5];
cx q[7], q[6];
cx q[7], q[4];
