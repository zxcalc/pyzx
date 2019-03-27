// Initial wiring: [1, 4, 7, 5, 0, 3, 6, 2, 8]
// Resulting wiring: [1, 4, 7, 5, 0, 3, 6, 2, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[1];
cx q[4], q[7];
cx q[1], q[2];
