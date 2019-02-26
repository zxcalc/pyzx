// Initial wiring: [0, 6, 7, 5, 4, 3, 1, 2, 8]
// Resulting wiring: [0, 6, 7, 5, 4, 3, 1, 2, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[4], q[3];
cx q[4], q[1];
