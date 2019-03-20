// Initial wiring: [8, 5, 6, 0, 1, 7, 2, 3, 4]
// Resulting wiring: [8, 5, 6, 0, 1, 7, 2, 3, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[4], q[7];
cx q[4], q[1];
