// Initial wiring: [0, 2, 8, 1, 7, 5, 4, 6, 3]
// Resulting wiring: [0, 2, 8, 1, 7, 5, 4, 6, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[8], q[7];
cx q[8], q[3];
