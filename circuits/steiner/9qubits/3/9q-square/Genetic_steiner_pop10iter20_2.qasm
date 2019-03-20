// Initial wiring: [8, 4, 5, 6, 2, 7, 0, 3, 1]
// Resulting wiring: [8, 4, 5, 6, 2, 7, 0, 3, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[3], q[2];
cx q[8], q[3];
