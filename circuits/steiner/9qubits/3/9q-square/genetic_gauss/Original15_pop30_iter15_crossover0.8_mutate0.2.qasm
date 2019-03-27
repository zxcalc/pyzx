// Initial wiring: [0, 3, 1, 5, 6, 8, 7, 2, 4]
// Resulting wiring: [0, 3, 1, 5, 6, 8, 7, 2, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[3];
cx q[8], q[1];
cx q[1], q[2];
