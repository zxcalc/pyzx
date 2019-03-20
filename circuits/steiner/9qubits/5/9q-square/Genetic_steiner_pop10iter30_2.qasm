// Initial wiring: [6, 5, 3, 8, 4, 7, 0, 2, 1]
// Resulting wiring: [6, 5, 3, 8, 4, 7, 0, 2, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[7];
cx q[3], q[2];
cx q[8], q[3];
cx q[3], q[8];
