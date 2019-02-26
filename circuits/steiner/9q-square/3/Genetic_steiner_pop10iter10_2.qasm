// Initial wiring: [0, 8, 2, 3, 7, 4, 5, 6, 1]
// Resulting wiring: [0, 8, 2, 3, 7, 4, 5, 6, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[7], q[6];
cx q[8], q[7];
