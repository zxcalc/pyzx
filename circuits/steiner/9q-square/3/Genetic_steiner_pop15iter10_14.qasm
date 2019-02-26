// Initial wiring: [2, 5, 1, 3, 4, 7, 6, 0, 8]
// Resulting wiring: [2, 5, 1, 3, 4, 7, 6, 0, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[7];
cx q[4], q[3];
cx q[4], q[1];
