// Initial wiring: [5, 0, 4, 1, 7, 6, 2, 8, 3]
// Resulting wiring: [5, 0, 4, 1, 7, 6, 2, 8, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[4], q[7];
cx q[7], q[6];
cx q[8], q[7];
cx q[5], q[0];
