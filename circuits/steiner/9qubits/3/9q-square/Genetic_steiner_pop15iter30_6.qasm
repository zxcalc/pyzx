// Initial wiring: [7, 1, 8, 2, 3, 6, 5, 0, 4]
// Resulting wiring: [7, 1, 8, 2, 3, 6, 5, 0, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[3], q[2];
cx q[4], q[1];
