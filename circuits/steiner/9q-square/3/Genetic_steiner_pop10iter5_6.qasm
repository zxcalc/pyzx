// Initial wiring: [0, 4, 8, 2, 5, 7, 3, 1, 6]
// Resulting wiring: [0, 4, 8, 2, 5, 7, 3, 1, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[8];
cx q[6], q[7];
cx q[7], q[8];
cx q[3], q[2];
