// Initial wiring: [0, 2, 7, 5, 4, 1, 3, 8, 6]
// Resulting wiring: [0, 2, 7, 5, 4, 1, 3, 8, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[6], q[7];
cx q[8], q[3];
