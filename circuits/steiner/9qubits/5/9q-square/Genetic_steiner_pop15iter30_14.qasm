// Initial wiring: [5, 4, 8, 7, 1, 6, 3, 2, 0]
// Resulting wiring: [5, 4, 8, 7, 1, 6, 3, 2, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[2], q[3];
cx q[6], q[7];
cx q[5], q[6];
cx q[0], q[5];
