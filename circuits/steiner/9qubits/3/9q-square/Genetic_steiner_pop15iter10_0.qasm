// Initial wiring: [3, 7, 1, 5, 6, 0, 2, 4, 8]
// Resulting wiring: [3, 7, 1, 5, 6, 0, 2, 4, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[6], q[7];
cx q[4], q[3];
