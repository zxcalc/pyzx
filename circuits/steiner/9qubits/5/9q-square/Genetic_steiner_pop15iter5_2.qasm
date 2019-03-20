// Initial wiring: [0, 4, 5, 7, 3, 6, 2, 1, 8]
// Resulting wiring: [0, 4, 5, 7, 3, 6, 2, 1, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[8];
cx q[7], q[6];
cx q[8], q[7];
cx q[7], q[4];
