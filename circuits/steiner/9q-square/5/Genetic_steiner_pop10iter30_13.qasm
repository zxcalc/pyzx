// Initial wiring: [8, 0, 2, 3, 4, 5, 1, 7, 6]
// Resulting wiring: [8, 0, 2, 3, 4, 5, 1, 7, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[7], q[8];
cx q[3], q[8];
cx q[8], q[7];
cx q[7], q[4];
