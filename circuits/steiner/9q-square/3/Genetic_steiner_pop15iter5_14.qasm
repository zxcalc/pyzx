// Initial wiring: [1, 5, 2, 7, 4, 6, 0, 3, 8]
// Resulting wiring: [1, 5, 2, 7, 4, 6, 0, 3, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[4], q[7];
cx q[4], q[1];
