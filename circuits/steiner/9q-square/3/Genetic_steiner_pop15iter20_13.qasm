// Initial wiring: [6, 3, 0, 4, 5, 1, 2, 7, 8]
// Resulting wiring: [6, 3, 0, 4, 5, 1, 2, 7, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[7];
cx q[6], q[5];
cx q[8], q[3];
