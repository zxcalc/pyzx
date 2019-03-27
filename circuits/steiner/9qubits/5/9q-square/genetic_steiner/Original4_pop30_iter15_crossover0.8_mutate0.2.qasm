// Initial wiring: [3, 6, 5, 0, 2, 4, 1, 7, 8]
// Resulting wiring: [3, 6, 5, 0, 2, 4, 1, 7, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[6], q[7];
cx q[3], q[8];
cx q[3], q[4];
cx q[0], q[5];
