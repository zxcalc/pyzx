// Initial wiring: [4, 7, 5, 6, 3, 0, 2, 1, 8]
// Resulting wiring: [4, 7, 5, 6, 3, 0, 2, 1, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[6];
cx q[5], q[4];
cx q[6], q[5];
cx q[4], q[1];
cx q[5], q[4];
