// Initial wiring: [4, 3, 5, 1, 0, 6, 7, 8, 2]
// Resulting wiring: [4, 3, 5, 1, 0, 6, 7, 8, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[7];
cx q[8], q[3];
cx q[2], q[1];
