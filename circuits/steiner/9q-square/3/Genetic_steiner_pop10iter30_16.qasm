// Initial wiring: [5, 3, 8, 7, 4, 0, 6, 1, 2]
// Resulting wiring: [5, 3, 8, 7, 4, 0, 6, 1, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[8], q[7];
cx q[3], q[2];
